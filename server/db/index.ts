import logger from '../logger'
import { Pool, PoolClient } from 'pg'

// TODO: exponential backoff, reconnect strategy
export function buildClient(): Pool {
  return new Pool({
    // connectionString
    host: process.env.POSTGRES_HOST,
    port: Number(process.env.POSTGRES_PORT),
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DATABASE,
    ssl: process.env.POSTGRES_REQUIRE_SSL ? { rejectUnauthorized: false } : false,
  })
}

let client: Pool | undefined

export async function setupDbConnection() {
  getClient().on('error', err => console.error(`PG ERROR: ${err}`))

  try {
    getClient()
      .connect()
      .then(v => v.release())
  } catch (err) {
    logger.error(`Could not connect to db with error ${err}`)
    process.exit(1)
  }
}

export async function connect(): Promise<void> {
  try {
    getClient()
      .connect()
      .then(v => v.release())
  } catch (err) {
    logger.error(`Could not connect to db with error ${err}`)
    process.exit(1)
  }
}

export function getClient(): Pool {
  if (!client) {
    client = buildClient()
  }
  return client
}

export async function closeClient(): Promise<void> {
  await client?.end()
}

export type TransactionClient = Pool | PoolClient
export async function runInTransaction(
  cb: (tc: TransactionClient) => Promise<void>
  ) {
  const tc = await getClient().connect()
  try {
    await tc.query('BEGIN')
    await cb(tc)
    await tc.query('COMMIT')
  } catch (err) {
    await tc.query('ROLLBACK')
    throw err
  } finally {
    tc.release()
  }
}

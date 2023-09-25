import bodyParser from 'body-parser'
import express, {NextFunction, Request, RequestHandler, Response} from 'express'
import helmet from 'helmet'
import logger from './logger'
import pinoHttp from 'pino-http'

const app = express()


app.use(
  pinoHttp({logger})
)

app.use(helmet())

app.use(bodyParser.json() as RequestHandler)
app.use(bodyParser.urlencoded({ extended: true }) as express.RequestHandler)

function defaultErrorHandler(
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
  ) {
  logger.error(err)
  res.status(err.httpStatus || 500).json({ err: err.message || err })
  next()
}

app.use(defaultErrorHandler)

const port = 3000

app.listen(port, () => {
  logger.info(`api server listening on port ${port}`)
})


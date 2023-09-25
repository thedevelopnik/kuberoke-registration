import { Express } from 'express'
import logger from './logger'

export default function(app: Express) {
  logger.info('initializing server routing')
  app.get('/healthz', function(req, res) {
    res.status(200)
  })
}
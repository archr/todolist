express = require 'express'
logger = require 'morgan'
bodyParser = require 'body-parser'
errorhandler = require 'errorhandler'

module.exports = (server) ->

  if GLOBAL.config.env is 'development'
    server.use errorhandler()


  server.use express.static("#{config.root}/public")
  server.use logger("dev")
  server.use bodyParser()


  server.set 'showStackError', true
  server.set 'views', "#{config.root}/views"
  server.set 'view engine', "jade"
  server.set 'view options',
    pretty: true


  return
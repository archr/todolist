mongoose = require 'mongoose'

module.exports = (server) ->

  server.get "/"
  , (req, res) ->
    res.render "index"

  server.use "/tasks", require('./tasks').tasks
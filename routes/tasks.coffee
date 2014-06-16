express = require 'express'
mongoose = require 'mongoose'

Task = mongoose.model 'Task'

router = new express.Router
module.exports.tasks = router

router.get "/",
(req, res) ->
  Task.find {}, (err, tasks) ->
    return res.send 500 if err

    res.locals.tasks = tasks
    res.render "tasks/index"

router.get "/add",
(req, res) ->
  res.render "tasks/add"

router.post "/add",
(req, res) ->
  Task.create req.body, (err, task) ->
    res.redirect "/tasks"
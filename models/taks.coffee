mongoose = require 'mongoose'

Schema = mongoose.Schema

module.exports = ->
  taskSchema = new Schema
    name: String


  mongoose.model "Task", taskSchema

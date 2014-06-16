path = require 'path'
root = path.normalize("#{__dirname}/..")

config = {}


config.development =
  port: 3000
  db: "mongodb://localhost/todolist-dev"
  env: 'development'
  root: root


module.exports = config
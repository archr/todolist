express = require 'express'
mongoose = require 'mongoose'
fs = require 'fs'

#Se carga la configuración del entorno de desarrollo
env = process.env.NODE_ENV || 'development'
GLOBAL.config = require('./config')[env]


#Configuración de la bade de datos
mongoose.connect(config.db)
modelsDir = "#{config.root}/models"
fs.readdirSync(modelsDir).forEach (model) ->
  require("#{modelsDir}/#{model}")()


#Se inicializa express y se carga su configuración
server = express()
require("#{config.root}/config/express")(server)


#Se agregan las rutas con las que funciona el server
require("#{config.root}/routes")(server)


#El server inicia
server.listen config.port, ->
  console.log "Servidor en puerto: #{config.port} en: #{env}"
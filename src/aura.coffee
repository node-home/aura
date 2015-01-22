home = require 'home'

core = require './core'

###
 * An app needs to be instantiated with a unique identifier
 * and a secret.
 * Or does it?
###

module.exports = home.app module,
  name: 'Aura'
  description: """
    Light control for your home.
  """
  , (app) ->
    throw new Error "HUE_IP missing from env" unless process.env.HUE_IP
    throw new Error "HUE_APP missing from env" unless process.env.HUE_APP

    app.hue = new core.Hue [
      process.env.HUE_IP
      process.env.HUE_APP
    ]...

    app.actions = require './actions'
    app.models = require './models'
    app.utils = require './utils'
    # app.grammar = require './grammar'

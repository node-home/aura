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
    app.hue = new core.Hue '192.168.1.70', 'jessethegame'

    app.actions = require './actions'
    app.models = require './models'
    # app.grammar = require './grammar'

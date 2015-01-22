_      = require 'lodash'

flow   = require 'home.flow'

aura   = require '../aura'
models = require '../models'

toggleParams =
  light:
    type: 'integer' # [models.Light, models.Group]
    description: """
      The light OR light group to target.
    """
    nullable: true
  ms:
    type: 'integer'
    description: """
      The transition time in milliseconds over which the light
      fades in.
    """
    default: 0

toggleCallback = (state, light, ms) ->
  if light?
    models.Light.get light
      .then (light) ->
        light.toggle state, ms
  else
    models.Group.get 0
      .then (group) ->
        console.log "THEN", group
        group.toggle state, ms

module.exports =
  on: flow.action 'aura/lights/toggle',
    name: "Light toggle"
    description: """
      Toggle given light to state OR bring it to the opposite of its current.
    """
    params: _.defaults toggleParams,
      state:
        type: 'boolean'
        nullable: true
  , ({state, light, ms}) ->
    toggleCallback state, light, ms

  on: flow.action 'aura/lights/on',
    name: "Light on"
    description: """
      Turn given light OR group OR all lights on over ms
    """
    params: toggleParams
  , ({light, ms}) ->
    toggleCallback on, light, ms

  off: flow.action 'aura/lights/off',
    name: "Light off"
    description: """
      Turn given light OR group OR all lights off over ms
    """
    params: toggleParams
  , ({light, ms}) ->
    toggleCallback off, light, ms

  color: flow.action 'aura/lights/color', ({light, color, ms}) ->
    # Set given light OR group OR all lights to color over ms
    null

  gradient: flow.action 'aura/lights/gradient', ({light, gradient, ms}) ->
    # Animate given light OR group OR all lights over gradient over ms
    null

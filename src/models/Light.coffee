q   = require 'Q'

home = require 'home'
hue = home.apps.aura.hue

class Light
  constructor: ({@id, @name}) ->
    null

  @get: (uid) ->
    hue.lights.show uid
      .then (light) ->
        new Light light

  @list: ->
    hue.lights.list()
      .then (lights) ->
        new Light light for id, light of lights

  save: -> null
  destroy: -> null

  activate: ->
    @active = true
    do @save

  deactivate: ->
    @active = false
    do @save

  toggle: (state, transitionTime) ->
    # TODO get state and put it in the other one if no parameter is given
    hue.lights.update @id, on: state, transitionTime: transitionTime

  on: (transitionTime) ->
    @toggle on, transitionTime

  off: (transitionTime) ->
    @toggle off, transitionTime


module.exports = Light
q   = require 'Q'

home = require 'home'
hue = home.apps.aura.hue

class Group
  constructor: ({@id, @name}) ->
    null

  @get: (uid) ->
    hue.groups.show uid
      .then (group) ->
        new Group group

  @list: ->
    hue.groups.list()
      .then (groups) ->
        new Group group for id, group of groups

  save: -> null
  destroy: -> null

  activate: ->
    @active = true
    do @save

  deactivate: ->
    @active = false
    do @save

  toggle: (state) ->
    # TODO get state and put it in the other one if no parameter is given
    hue.groups.update @id, on: state

  on: ->
    @toggle on

  off: ->
    @toggle off

module.exports = Group

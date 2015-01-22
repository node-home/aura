request = require 'request'
Q       = require 'Q'
_       = require 'lodash'

# The reason that this is not a class is because of
# the nested resources that reference the hue instance.
module.exports = (ip, options={}) ->
  hue = _.defaults {ip}, options,
    app: 'hue'
    verbose: false

  hue.log = (args...) ->
    console.log "[hue]", args... if hue.verbose

  hue.request = (method, path, options) =>
    options ||= {}
    options.method = method
    options.url = "http://#{hue.ip}/api/#{hue.app}#{path}"

    deferred = Q.defer()

    request options, (err, response, body) ->
      return deferred.reject body if err
      deferred.resolve body

    hue.log method, path, options

    deferred.promise
      .then (data) ->
        hue.log "✓", path, options, data
        data
      .catch (data) ->
        hue.log "✗", path, options, data
        data

  hue.get = (path) ->
    hue.request 'GET', path

  hue.put = (path, data) ->
    hue.request 'PUT', path, json: data

  hue.post = (path, data) ->
    hue.request 'POST', path, json: data

  # Lights
  hue.lights =
    list: ->
      hue.get '/lights'
    discover: ->
      hue.post '/lights'
    collect: ->
      hue.get '/lights/new'
    show: (id) ->
      hue.get "/lights/#{id}"
    rename: (id, name) ->
      hue.put "/lights/#{id}", name: name
    update: (id, state) ->
      hue.put "/lights/#{id}/state", state

    # Groups
  hue.groups =
    list: ->
      hue.get '/groups'
    create: ->
      throw new Exception "Hue.groups.create not supported"
    show: (id) ->
      hue.get "/groups/#{id}"
    define: (id, attrs) ->
      hue.put "/groups/#{id}", state
    update: (id, state) ->
      hue.put "/groups/#{id}/action", state
    destroy: ->
      throw new Exception "Hue.groups.delete not supported"

  hue

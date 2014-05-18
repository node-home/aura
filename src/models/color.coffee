q     = require 'Q'

utils = require '../utils'
###

class Color
  schema:
    id:
    r:
    g:
    b:
    name:
    group:

  constructor: ({rgb, hsl, cmyk, hex}) ->
    null

  @get: (uid) -> null
  @list: -> null
  save: -> null
  destroy: -> null

module.exports = Color
###

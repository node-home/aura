flow = require 'home.flow'

aura = require '../aura'
models = require '../models'

flow.action 'aura/aura/set',
  name: "Configure Aura"
  description: """
    Configure an aura.
  """
  params:
    obj:
      name: "Object"
      description: """
        The object that the aura follows.
      """
      default: null
    color:
      name: "Color"
      description: """
        The color of the aura light.
        """
  , ({obj, color}) ->
    aura = models.Aura.get(obj: obj) or new models.Aura
    aura.color = color
    do aura.save

flow.action 'aura/aura/activate',
  name: "Activate Aura"
  description: """
    Activate an aura.
  """
  params:
    obj:
      name: "Object"
      description: """
        The object that the aura follows.
        When none is given, turn all auras off.
      """
      default: null
  , ({obj}) ->
    if obj
      do models.Aura.get(obj: obj)?.activate

    else
      for aura in do models.Aura.list
        do aura.activate

flow.action 'aura/aura/deactivate',
  name: "Deactivate Aura"
  description: """
    Deactivate an aura.
  """
  params:
    obj:
      name: "Object"
      description: """
        The object that the aura follows.
        When none is given, turn all auras off.
      """
      default: null
  , ({obj}) ->
    if obj
      do models.Aura.get(obj: obj)?.deactivate

    else
      for aura in do models.Aura.list
        do aura.deactivate


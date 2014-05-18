nock = require 'nock'

core = require '../src/core'
aura = require '../'
hue = aura.hue

createNock = ->
  nock "http://#{hue.ip}"
  .filteringRequestBody /.*/, '*'
  .post "/#{hue.app}/lights/1", '*'
  .post "/#{hue.app}/lights/1/state", '*'
  .post "/#{hue.app}/lights/1/", '*'
  .post "/#{hue.app}/lights/1", '*'

describe 'aura', ->
  describe 'actions', ->
    describe 'lights', ->
      describe 'toggle', ->
        it 'should toggle the light'
        it 'should set the light'
      describe 'off', ->
        it 'should turn off the light'
      describe 'on', ->
        it 'should turn on the light'

describe 'hue', ->

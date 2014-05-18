nock = require 'nock'

home = require 'home'
flow = require 'home.flow'

home.init()

core = require '../../src/core'
aura = require '../../src'

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

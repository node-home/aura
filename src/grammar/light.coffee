voice = require 'home.voice'

light = voice.vocabulary 'light',
  keywords: [
    'light', 'lights'
  ]

light.vocabulary  'on',
  keywords: [
    'on'
  ]
  variations: [
    'Let there be light'
  ]

light.vocabulary 'off',
    keywords: [
      'off'
    ]
    variations: [
      'Dark'
      'Darkness'
    ]

light.vocabulary 'dim',
    keywords: [
      'dim', 'little'
    ]
    variations: [
      'Turn your lights down low'
    ]

light.vocabulary 'bright',
  keywords: [
    'bright', 'shine'
  ]
  variations: [
    'Shine bright like a diamond'
  ]

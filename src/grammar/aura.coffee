voice = require 'home.voice'

voice.keyword ['aura'],
  on:
    keywords: [
      'on', 'light', 'shine', 'live', 'bright'
    ]
    variations: [
      'Let there be light'
    ]

  off:
    keywords: [
      'off', 'dark', 'die'
    ]
    variations: [
      'Dark'
      'Darkness'
    ]

  dim:
    keywords: [
      'dim', 'little'
    ]
    variations: [
      'Turn your lights down low'
    ]

  bright:
    keywords: [
      'bright', 'shine'
    ]
    variations: [
      'Shine bright like a diamond'
    ]

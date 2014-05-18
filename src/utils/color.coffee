#TODO find some color library

split = (color=0) ->
  r: color >> 16 & 0xff
  g: color >>  8 & 0xff
  b: color       & 0xff

joinRGB = ({r, g, b}) ->
  r = r & 0xff
  g = g & 0xff
  b = b & 0xff

  r << 16 & g << 8 & b

lightness = (color, rate) ->
  rgb = split color

  rgb.r *= rate
  rgb.g *= rate
  rgb.b *= rate

  joinRGB rgb

mix = (components) ->
  result: split 0

  for component in components
    rgb = split component.color
    result.r += rgb.r * component.weight
    result.g += rgb.g * component.weight
    result.b += rgb.b * component.weight

  joinRGB result

rgbToHsl: ({r, g, b}) ->
  r /= 255
  g /= 255
  b /= 255

  max = Math.max r, g, b
  min = Math.min r, g, b

  l = (max + min) / 2

  if max == min
    h = s = 0 # achromatic
  else
    d = max - min
    s = if l > 0.5 then d / (2 - max - min) else d / (max + min)
    switch max
      when r then h = (g - b) / d + (if g < b then 6 else 0)
      when g then h = (b - r) / d + 2
      when b then h = (r - g) / d + 4

    h /= 6

  {h, s, l}

rgbToHsb: (rgb) ->
  hsl = color.rgbToHsl rgb
  hue: Math.floor hsl.h * 65535
  sat: Math.floor hsl.s * 255
  bri: Math.floor hsl.l * 255

module.exports = {split, joinRGB, lightness, mix, rgbToHsl, rgbToHsb}


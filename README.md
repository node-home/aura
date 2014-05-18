# Aura

Requires Philips Hue. Light control.

## Lights

/lights
    [Light]

    /<light>
        {
            "uid": <light>,
            "name": "Light",
            "hue": {
                "hub": <hue>,
                "id": 1
                "state": { ... }
            }
        }


## Halos

Requires spot locations. Keeps a list of nearby objects per light.
Each object has a color and a distance to the light. The light then
mixes these colors into a single one.


First draft <br>
subscribe to the "spot.radius" feed for all the Homies
that are at home.

    /auras
        "light": <light>
        "components: {
            <uuid>: {
                "uuid": <uuid>,
                "color": <color>,
                "distance": <meters>,
            },
            <uuid>: {
                "uuid": <uuid>,
                "color": <color>,
                "distance": <meters>,
            }
        }

## Actions

    lights.on
    lights.off
    lights.color <color>

    lights.on <light>
    lights.off <light>
    lights.color <light> <color>


## Feature Requests

- chrome extension that analyses a website's colors
- daemon that takes screenshots and analyses them for colors
- camera that takes picture of your clothes and sets your aura to match their colors
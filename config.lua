Config = {}

Config.Zones = {
    time = 3, -- in seconds
    notify = {
        title = 'Greenzone',
        description = 'Wyszedłeś z Greenzone - za 3 sekundy skończy ci się ochrona',
        type = 'inform'
    },
    textui = {
        position = "top-center",
        icon = 'hand',
        style = {
            borderRadius = 0,
            backgroundColor = '#48BB78',
            color = 'white'
        }
    }
}

Config.Greenzones = {
    {
        coords = vector3(1734.1427, 3296.2432, 41.2235),
        dist = 60,
        size = 40.0,
        colorR = 0,
        colorG = 255,
        colorB = 0,
        colorA = true,
        blip = {
            title = 'Greenzone',
            sprite = 541,
            scale = 0.8,
            colour = 2,
        }
    },
    {
        coords = vector3(1010.0648, -2521.2388, 28.3069),
        dist = 60,
        size = 40.0,
        colorR = 255,
        colorG = 0,
        colorB = 0,
        colorA = true,
        blip = {
            title = 'Greenzone',
            sprite = 541,
            scale = 0.8,
            colour = 2,
        }
    },
}
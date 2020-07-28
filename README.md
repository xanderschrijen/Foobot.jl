# Foobot.jl

A Julia module wrapping the [Foobot web api](http://api.foobot.io/apidoc/index.html) 

## Simple usage
The code expects your Foobot API key in `~/.foobotapi.key`.

First add the package:
```
pkg> add https://github.com/xanderschrijen/Foobot.jl
```
Then: 
```julia
using Foobot

# list of devices
my_devices=devices("my@foobot.email")

# Find your HappyBot
happybot = finddevice("HappyBot", my_devices)

# hourly data for the last week
data = datapoints(happybot, Dates.now()-Day(7), Dates.now(), 60*60)

# plot
# I want multiple stacked plots here as the scales for all sensors are different
Foobot.plot(data)
```
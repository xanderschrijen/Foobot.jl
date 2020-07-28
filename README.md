# Foobot.jl

The idea is to make this into a `module` such that you can use it with:

```julia
using Foobot

# list of devices
my_devices=devices("my@foobot.email")

# hourly data for the last week
data = datapoints(my_devices[1]["uuid"], Dates.now()-Day(7), Dates.now(), 60*60)

# plot
# for now, use plot_foobot(data)
Foobot.plot(data)
```

Still learning how to create a module, so for now `include("src/Foobot.jl")`

The code expects your Foobot API key in `~/.foobotapi.key`.

This is, of course, a simple wrapper for [the web api](http://api.foobot.io/apidoc/index.html
)
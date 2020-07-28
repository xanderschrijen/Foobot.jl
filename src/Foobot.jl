# This will become a module. For now, put functions here to get stuff working.
# `include` the file.
# API documentation: http://api.foobot.io/apidoc/index.html

using HTTP, JSON, Dates, TimeZones, Plots

const base_url = "https://api.foobot.io"
const all_sensors = ["time", "tmp", "hum", "pm", "voc", "co2", "allpollu"]

"""
    devices(owner)

Get devices owned by user.
"""
function devices(owner)
    endpoint = "/v2/owner/$owner/device/"
    response = HTTP.get(base_url * endpoint,
        ["Accept" => "application/json;charset=UTF-8", "X-API-KEY-TOKEN" => apikey()])
    JSON.parse(String(response.body))
end

"""
    datapoints(uuid, period, average_by[, sensor_list])
Use period = 0 and average_by = 0 to get the very last data point.

Defaults to querying all sensors.
"""
function datapoints(uuid, period, average_by, sensor_list=all_sensors)
    endpoint = "/v2/device/$uuid/datapoint/$period/last/$average_by/"
    sensor_q = join(sensor_list, "%2C")
    response = HTTP.get(base_url * endpoint,
        ["Accept" => "application/json;charset=UTF-8", "X-API-KEY-TOKEN" => apikey()],
        query="sensorList=$sensor_q")
    JSON.parse(String(response.body))
end

"""
    datapoints(uuid, starttime, endtime, average_by[, sensor_list])
Get data points with a specified time range and average factor. Can fetch a maximum of 42 days of data.
To speed up query processing, you can use a combination of average factor multiple of 1H in seconds (e.g. 3600)

Defaults to querying all sensors.
"""
function datapoints(uuid, starttime::DateTime, endtime::DateTime, average_by, sensor_list=all_sensors)
    endpoint = "/v2/device/$uuid/datapoint/$(format_ISO8601(starttime))/$(format_ISO8601(endtime))/$average_by/"
    sensor_q = join(sensor_list, "%2C")
    response = HTTP.get(base_url * endpoint,
        ["Accept" => "application/json;charset=UTF-8", "X-API-KEY-TOKEN" => apikey()],
        query="sensorList=$sensor_q")
   JSON.parse(String(response.body))
end

function format_ISO8601(dt::DateTime, tz=TimeZones.localzone())
    zdt = ZonedDateTime(dt, tz)
    Dates.format(zdt, "yyyy-mm-ddTHH:MM:SSz")
end

function apikey()
    return String(read(open(homedir()*"/.foobotapi.key", "r")))
end

function plot_foobot(json)
    x = [unix2datetime(t[1]) for t in json["datapoints"]]
    ys = [[t[sensor] for t in json["datapoints"]] for sensor in 2:length(json["sensors"])]
    labels = [s for s in json["sensors"][2:end]]
    plot(x, ys, labels=reshape(labels, (1,length(labels))))
end

import json

firmwareVersionString = "tasmotaBerryAirRohr v0.1"
sensorCommunityUrl = "https://api.sensor.community/v1/push-sensor-data/"

def fetchSensorData()
	return json.load(tasmota.read_sensors())
end

def getSensorId()
    return "esp32-" + espChipId
end

def postData(sensorData, pin)
    var data = {
        "software_version": firmwareVersionString,
        "sensordatavalues": sensorData
    }
    var cl = webclient()
    cl.begin(sensorCommunityUrl)
    cl.add_header("Content-Type", "application/json")
    cl.add_header("X-Sensor", getSensorId())
    cl.add_header("X-Pin", pin)
    var response = cl.POST(json.dump(data))
    if response != 201
        print("Failed to publish data: HTTP status " + response)
    end
end

def updateSensorData()
    var sensorData = fetchSensorData()
    for sensor : sensors
        var data = []
        for dataPoint : sensor["dataPoints"]
            var value = sensorData[sensor["sensorName"]][dataPoint["measurement"]]
            if dataPoint.contains("multiplier")
                value = value * dataPoint["multiplier"]
            end
            data.push({"value_type": dataPoint["valueType"], "value": value})
        end
        postData(data, sensor["pin"])
    end
end

def initialize()
	tasmota.add_cron(cronPattern, updateSensorData, "sensorUpdate")
end

initialize()

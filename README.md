# Tasmota Berry AirRohr

A simple berry script, which enables Tasmota devices to push sensor-data to [sensor.community](https://sensor.community) (formerly known as luftdaten.info).

## Hardware Requirements

- a Tasmota device, that can run berry scripts (ESP32)
- some sensors (like an SDS011 for measuring particulate matter or a BME280 for measuring temperature, humidity and pressure)

## #HowTo use this script

1. Connect the sensors to your ESP32 and configure the gpio-pins inside Tasmota, so that it recognizes the sensors. Make sure all required measurements are displayed on the landing page of Tasmota's WebUi.
2. Register your sensor at [devices.sensor.community](https://devices.sensor.community/). You will need the ChipId of your ESP32. You can find it on the "Information"-Page of Tasmota under the entry "ESP Chip Id". Only the sequence of numbers belongs to the Chip Id, so omit the parentheses. On devices.sensor.community, add a new sensor and fill in the form. Under "Sensor ID", insert the Chip Id. Select "esp32" as the "Sensor Board".
3. Edit `config.be`, to configure the script for your specific setup.
    - Replace `<insert_chip-id_here>` with your esp32's chip Id.
    - You may specify, how often data is sent to the server by changing the "cronPattern". This works essentially identically with cron, like it is known from the UNIX-like operating systems, with the exception that tasmota's implementation has an additional field for seconds. So its `seconds minutes hours days months weekdays`.
      Make sure, you do not upload your data in a higher frequency than it is measured. The latter is defined by the "Telemetry Period" inside the logging settings of Tasmota. 
    - You will need to configure your specific kinds of sensors and how they should be mapped to the database of sensor.community . This ist specified under "sensors". With the current configuration it expects an SDS011 and an BME280. If you need help, to configure other sensors, feel free to create an GitHub issue.
4. Upload the script files `autoexec.be`, `config.be` and `sensor.be` to your Tasmota device. Restart the device afterward and it will run the scripts.
5. If everything works, you will see the published data on the map at [sensor.community](https://maps.sensor.community/) .



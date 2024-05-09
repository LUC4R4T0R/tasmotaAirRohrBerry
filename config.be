espChipId = "<insert_chip-id_here>"
cronPattern = "44 */3 * * * *" #every three minutes at second 44

sensors = [
    {
        "pin": 1,
        "sensorName": "SDS0X1",
        "dataPoints": [
            {
                "valueType": "P1",
                "measurement": "PM10"
            },
            {
                "valueType": "P2",
                "measurement": "PM2.5"
            }
        ]
    },
    {
        "pin": 11,
        "sensorName": "BME280",
        "dataPoints": [
            {
                "valueType": "temperature",
                "measurement": "Temperature"
            },
            {
                "valueType": "pressure",
                "measurement": "Pressure",
                "multiplier": 100
            },
            {
                "valueType": "humidity",
                "measurement": "Humidity"
            }
        ]
    }
]

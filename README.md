# WeatherStationSQL
## Potential app description:
* Report hourly details (temperature, humudity, wind speed, visibility, rain rate etc).
* Report current weather condition (sunny, windy, hot etc).
* Collect a forecast for each day in the next week ( max,min-temperature,average humidity,
approximate sunrise and sunset time)
* Allow user (sysadmin) to set local city, change station settings (changing unit for any attribute). (in
scope of this project we have only one city – Baku , and only one personal station )
* Allow user (sysadmin) to see using which devices the measurements have been conducted.
* Allow user (sysadmin) to see the configuration of the station
## Entity Relationship Diagram - ERD
![](assets/images/ERDfull.png)
## Quantitative Entities:

###### Hourly_weather_log holds all attributes that change during the day. We consider these
###### attributes as one record for a specific timeframe.
* Id -> identifier of the Entity.
* city_id -> relevant city identifier.
* start_frame -> signifies when certain timeframe started.
* end_frame -> signifies when certain timeframe ended.
* temperature -> The current temperature for the timeframe.
* humidity -> The current humidity for the timeframe.
* wind_speed -> The current wind speed for the timeframe.
* pressure -> The current atmospheric pressure for the timeframe.
* visibility_distance -> range of visible distance for the timeframe.
* rain_rate -> The current rain rate for the timeframe.
* temp_feeling_id, wind_feeling_id, humidity_feeling_id, rain_feeling_id -> each of these attributes
indicates the overall weather status for the timeframe.

###### Daily_weather_log holds daily attributes
* city_id -> references the city table and indicates to which city this data corresponds.
* date_day -> calendar date for this information.
* max_temp -> maximum temperature during the whole day.
* min_temp -> minumim temperature during the whole day.
* avg_humidity -> average humidity in the air that day.
* sunrise_time -> stores the sunrise time.
* sunset_time -> stores the sunset time.

## Qualitative Entities:
###### Temp_feeling
* id -> identifier of the Entity.
* temp_limit -> example: if current_temperature(30) <= temp_limit(40) then description(hot)
* feel_desc -> description of the weather status. (hot,warm… etc)
###### Wind_feeling
* id -> identifier of the Entity.
* wind_speed_limit -> example: if wind_speed (30) <= wind_speed_limit (40) then description(Windy)
* Feel_desc -> descriprion of the wind status (windy,light wind, windless… etc)
###### Humidity_feeling
* Id -> identifier of the Entity.
* humidity_limit
* Feel_desc -> descriprion of the humidity status. (humid, low humidity… etc)
###### Rain_feeling
* Id -> identifier of the Entity.
* rain_rate_limit
* feel_desc -> descriprion of the rain status. (rainless, heave rain.. etc)

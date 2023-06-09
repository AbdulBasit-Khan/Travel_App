class WeatherModel {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final CurrentWeather? currentWeather;
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentWeather,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });

  WeatherModel.fromJson(Map<String, dynamic> json)
    : latitude = json['latitude'] as double?,
      longitude = json['longitude'] as double?,
      generationtimeMs = json['generationtime_ms'] as double?,
      utcOffsetSeconds = json['utc_offset_seconds'] as int?,
      timezone = json['timezone'] as String?,
      timezoneAbbreviation = json['timezone_abbreviation'] as String?,
      elevation = json['elevation'] ,
      currentWeather = (json['current_weather'] as Map<String,dynamic>?) != null ? CurrentWeather.fromJson(json['current_weather'] as Map<String,dynamic>) : null,
      hourlyUnits = (json['hourly_units'] as Map<String,dynamic>?) != null ? HourlyUnits.fromJson(json['hourly_units'] as Map<String,dynamic>) : null,
      hourly = (json['hourly'] as Map<String,dynamic>?) != null ? Hourly.fromJson(json['hourly'] as Map<String,dynamic>) : null,
      dailyUnits = (json['daily_units'] as Map<String,dynamic>?) != null ? DailyUnits.fromJson(json['daily_units'] as Map<String,dynamic>) : null,
      daily = (json['daily'] as Map<String,dynamic>?) != null ? Daily.fromJson(json['daily'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'latitude' : latitude,
    'longitude' : longitude,
    'generationtime_ms' : generationtimeMs,
    'utc_offset_seconds' : utcOffsetSeconds,
    'timezone' : timezone,
    'timezone_abbreviation' : timezoneAbbreviation,
    'elevation' : elevation,
    'current_weather' : currentWeather?.toJson(),
    'hourly_units' : hourlyUnits?.toJson(),
    'hourly' : hourly?.toJson(),
    'daily_units' : dailyUnits?.toJson(),
    'daily' : daily?.toJson()
  };
}

class CurrentWeather {
  final double? temperature;
  final double? windspeed;
  final double? winddirection;
  final int? weathercode;
  final int? isDay;
  final String? time;

  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.weathercode,
    this.isDay,
    this.time,
  });

  CurrentWeather.fromJson(Map<String, dynamic> json)
    : temperature = json['temperature'] as double?,
      windspeed = json['windspeed'] as double?,
      winddirection = json['winddirection']  ,
      weathercode = json['weathercode'] as int?,
      isDay = json['is_day'] as int?,
      time = json['time'] as String?;

  Map<String, dynamic> toJson() => {
    'temperature' : temperature,
    'windspeed' : windspeed,
    'winddirection' : winddirection,
    'weathercode' : weathercode,
    'is_day' : isDay,
    'time' : time
  };
}

class HourlyUnits {
  final String? time;
  final String? visibility;
  final String? relativehumidity2m;
  final String? pressureMsl;

  HourlyUnits({
    this.time,
    this.visibility,
    this.relativehumidity2m,
    this.pressureMsl,
  });

  HourlyUnits.fromJson(Map<String, dynamic> json)
    : time = json['time'] as String?,
      visibility = json['visibility'] as String?,
      relativehumidity2m = json['relativehumidity_2m'] as String?,
      pressureMsl = json['pressure_msl'] as String?;

  Map<String, dynamic> toJson() => {
    'time' : time,
    'visibility' : visibility,
    'relativehumidity_2m' : relativehumidity2m,
    'pressure_msl' : pressureMsl
  };
}

class Hourly {
  final List<String>? time;
  final List<double>? visibility;
  final List<int>? relativehumidity2m;
  final List<double>? pressureMsl;

  Hourly({
    this.time,
    this.visibility,
    this.relativehumidity2m,
    this.pressureMsl,
  });

  Hourly.fromJson(Map<String, dynamic> json)
    : time = (json['time'] as List?)?.map((dynamic e) => e as String).toList(),
      visibility = (json['visibility'] as List?)?.map((dynamic e) => e as double).toList(),
      relativehumidity2m = (json['relativehumidity_2m'] as List?)?.map((dynamic e) => e as int).toList(),
      pressureMsl = (json['pressure_msl'] as List?)?.map((dynamic e) => e as double).toList();

  Map<String, dynamic> toJson() => {
    'time' : time,
    'visibility' : visibility,
    'relativehumidity_2m' : relativehumidity2m,
    'pressure_msl' : pressureMsl
  };
}

class DailyUnits {
  final String? time;
  final String? weathercode;

  DailyUnits({
    this.time,
    this.weathercode,
  });

  DailyUnits.fromJson(Map<String, dynamic> json)
    : time = json['time'] as String?,
      weathercode = json['weathercode'] as String?;

  Map<String, dynamic> toJson() => {
    'time' : time,
    'weathercode' : weathercode
  };
}

class Daily {
  final List<String>? time;
  final List<int>? weathercode;

  Daily({
    this.time,
    this.weathercode,
  });

  Daily.fromJson(Map<String, dynamic> json)
    : time = (json['time'] as List?)?.map((dynamic e) => e as String).toList(),
      weathercode = (json['weathercode'] as List?)?.map((dynamic e) => e as int).toList();

  Map<String, dynamic> toJson() => {
    'time' : time,
    'weathercode' : weathercode
  };
}
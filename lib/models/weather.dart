class WeatherDetail {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;

  WeatherDetail(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentUnits,
      this.current});

  WeatherDetail.fromJson(json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits = json['current_units'] != null
        ? new CurrentUnits.fromJson(json['current_units'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2m;
  String? relativeHumidity2m;
  String? windSpeed10m;

  CurrentUnits(
      {this.time,
      this.interval,
      this.temperature2m,
      this.relativeHumidity2m,
      this.windSpeed10m});

  CurrentUnits.fromJson(json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    windSpeed10m = json['wind_speed_10m'];
  }
}

class Current {
  String? time;
  int? interval;
  double? temperature2m;
  int? relativeHumidity2m;
  double? windSpeed10m;

  Current(
      {this.time,
      this.interval,
      this.temperature2m,
      this.relativeHumidity2m,
      this.windSpeed10m});

  Current.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    windSpeed10m = json['wind_speed_10m'];
  }
}

class PrayerModel {
  dynamic title;
  dynamic query;
  dynamic forPrayer;
  dynamic method;
  dynamic prayerMethodName;
  dynamic daylight;
  dynamic timezone;
  dynamic mapImage;
  dynamic sealevel;
  TodayWeather todayWeather;
  dynamic link;
  dynamic qiblaDirection;
  dynamic latitude;
  dynamic longitude;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic postalCode;
  dynamic country;
  dynamic countryCode;
  List<PrayerItem> items;
  dynamic statusValid;
  dynamic statusCode;
  dynamic statusDescription;

  PrayerModel({
    required this.title,
    required this.query,
    required this.forPrayer,
    required this.method,
    required this.prayerMethodName,
    required this.daylight,
    required this.timezone,
    required this.mapImage,
    required this.sealevel,
    required this.todayWeather,
    required this.link,
    required this.qiblaDirection,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.countryCode,
    required this.items,
    required this.statusValid,
    required this.statusCode,
    required this.statusDescription,
  });

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      title: json['title'],
      query: json['query'],
      forPrayer: json['for'],
      method: json['method'],
      prayerMethodName: json['prayer_method_name'],
      daylight: json['daylight'],
      timezone: json['timezone'],
      mapImage: json['map_image'],
      sealevel: json['sealevel'],
      todayWeather: TodayWeather.fromJson(json['today_weather']),
      link: json['link'],
      qiblaDirection: json['qibla_direction'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      countryCode: json['country_code'],
      items: List<PrayerItem>.from(json['items'].map((item) => PrayerItem.fromJson(item))),
      statusValid: json['status_valid'],
      statusCode: json['status_code'],
      statusDescription: json['status_description'],
    );
  }
}

class TodayWeather {
  dynamic pressure;
  dynamic temperature;

  TodayWeather({
    required this.pressure,
    required this.temperature,
  });

  factory TodayWeather.fromJson(Map<String, dynamic> json) {
    return TodayWeather(
      pressure: json['pressure'],
      temperature: json['temperature'],
    );
  }
}

class PrayerItem {
  dynamic dateFor;
  dynamic fajr;
  dynamic shurooq;
  dynamic dhuhr;
  dynamic asr;
  dynamic maghrib;
  dynamic isha;

  PrayerItem({
    required this.dateFor,
    required this.fajr,
    required this.shurooq,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerItem.fromJson(Map<String, dynamic> json) {
    return PrayerItem(
      dateFor: json['date_for'],
      fajr: json['fajr'],
      shurooq: json['shurooq'],
      dhuhr: json['dhuhr'],
      asr: json['asr'],
      maghrib: json['maghrib'],
      isha: json['isha'],
    );
  }
}

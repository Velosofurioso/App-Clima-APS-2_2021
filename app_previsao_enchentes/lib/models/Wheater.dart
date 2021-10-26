
class Wheater {
  final int temp;
  final String date;
  final String time;
  final String condition_code;
  final String description;
  final String currently;
  final String cid;
  final String city;
  final String img_id;
  final int humidity;
  final String wind_speedy;
  final String sunrise;
  final String sunset;
  final String condition_slug;
  final String city_name;
  final List<dynamic> forecast;

  Wheater({
      required this.temp,
      required this.date,
      required this.time,
      required this.condition_code,
      required this.description,
      required this.currently,
      required this.cid,
      required this.city,
      required this.img_id,
      required this.humidity,
      required this.wind_speedy,
      required this.sunrise,
      required this.sunset,
      required this.condition_slug,
      required this.city_name,
      required this.forecast
  });


  factory Wheater.fromJson(Map<String, dynamic> parsedJson) {
    return Wheater(
        temp: parsedJson["temp"],
        date: parsedJson['date'],
        time: parsedJson['time'],
        condition_code: parsedJson['condition_code'],
        description: parsedJson['description'],
        currently: parsedJson['currently'],
        cid: parsedJson['cid'],
        city: parsedJson['city'],
        img_id: parsedJson['img_id'],
        humidity: parsedJson['humidity'],
        wind_speedy: parsedJson['wind_speedy'],
        sunrise: parsedJson['sunrise'],
        sunset: parsedJson['sunset'],
        condition_slug: parsedJson['condition_slug'],
        city_name:  parsedJson['city_name'],
        forecast: parsedJson['forecast'],
    );
  }
}



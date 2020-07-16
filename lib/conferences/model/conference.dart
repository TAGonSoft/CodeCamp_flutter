import 'package:flutter/material.dart';

class Location {
  final double latitude;
  final double longitude;

  const Location({
    @required this.latitude,
    @required this.longitude,
  });

  Location.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'];

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude':longitude,
  };
}

class Venue {
  final String name;
  final String city;
  final String country;
  final String direction;

  const Venue({
    @required this.name,
    @required this.city,
    @required this.country,
    @required this.direction,
  });

  Venue.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        city = json['city'],
        country = json['country'],
        direction = json['direction'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'city':city,
    'country':country,
    'direction':direction,
  };
}

class Conference {
  final int refId;
  final String title;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final Venue venue;

  Conference({
    @required this.refId,
    @required this.title,
    @required this.location,
    @required this.startDate,
    @required this.endDate,
    @required this.venue,
  });

  Conference.fromJson(Map<String, dynamic> json)
      : refId = json['refId'],
        title = json['title'],
        location = json['location'],
        startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        venue = Venue.fromJson(json['venue']);

  Map<String, dynamic> toJson() => {
    'refId': refId,
    'title':title,
    'location':location,
    'startDate':startDate.toIso8601String(),
    'endDate':endDate.toIso8601String(),
    'venue':venue.toJson(),
  };
}

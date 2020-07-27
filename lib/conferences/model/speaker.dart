import 'package:flutter/material.dart';

class Speaker {
  final String name;
  final String photoUrl;
  final String company;
  final String companyWebsiteUrl;
  final String jobTitle;
  final String bio;
  final String displayOrder;
  final String twitter;
  final String facebook;
  final String linkedIn;

  Speaker({
    @required this.name,
    @required this.photoUrl,
    @required this.company,
    @required this.companyWebsiteUrl,
    @required this.jobTitle,
    @required this.bio,
    @required this.displayOrder,
    @required this.twitter,
    @required this.facebook,
    @required this.linkedIn,
  });

  Speaker.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        photoUrl = json['photoUrl'],
        company = json['company'],
        companyWebsiteUrl = json['companyWebsiteUrl'],
        jobTitle = json['jobTitle'],
        bio = json['bio'],
        displayOrder = json['displayOrder'],
        twitter = json['twitter'],
        facebook = json['facebook'],
        linkedIn = json['linkedIn'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'photoUrl':photoUrl,
    'company':company,
    'companyWebsiteUrl':companyWebsiteUrl,
    'jobTitle':jobTitle,
    'bio':bio,
    'displayOrder':displayOrder,
    'twitter':twitter,
    'facebook':facebook,
    'linkedIn':linkedIn,
  };
}


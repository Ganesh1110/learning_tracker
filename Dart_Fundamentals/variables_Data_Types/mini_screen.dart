import 'package:flutter/material.dart';

void main() {
  runProfile();

  runApp(
    const MaterialApp(
      home: Scaffold(body: Center(child: Text('Check Debug Console'))),
    ),
  );
}

void runProfile() {
  const String appName = 'SatFlow';
  const int maxFollowers = 10000;
  final String userId = 'USR_${DateTime.now().millisecondsSinceEpoch}';
  final String email = 'user@satflow.io';
  var username = 'johndoe';
  var bio = 'Flutter developer & space enthusiast';
  late int postCount;
  late double rating;
  late bool isVerified;
  late List<String> tags;

  postCount = 42;
  rating = 4.8;
  isVerified = true;
  tags = ['flutter', 'dart', 'space'];

  const Map<String, String> preferences = {
    'theme': 'dark',
    'language': 'en',
    'notifications': 'push',
    'feed_sort': 'latest',
  };

  debugPrint('========== User Profile ==========');
  debugPrint('App Name     : $appName');
  debugPrint('Max Followers: $maxFollowers');
  debugPrint('User ID      : $userId');
  debugPrint('Email        : $email');
  debugPrint('Username     : $username');
  debugPrint('Bio          : $bio');
  debugPrint('Posts        : $postCount');
  debugPrint('Rating       : $rating');
  debugPrint('Verified     : $isVerified');
  debugPrint('Tags         : $tags');
  debugPrint('----------------------------------');
  debugPrint('Preferences  : $preferences');
  debugPrint('==================================');
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeProvider extends ChangeNotifier {
  late SharedPreferences _prefs;

  Map<String, bool> likedPlanets = {};

  LikeProvider() {
    _loadLikedPlanets();
  }

  Future<void> _loadLikedPlanets() async {
    _prefs = await SharedPreferences.getInstance();
    likedPlanets =
        Map<String, bool>.from(_prefs.getKeys().fold({}, (prev, key) {
      prev[key] = _prefs.getBool(key)!;
      return prev;
    }));
    notifyListeners();
  }

  Future<void> toggleLike(String planetName) async {
    if (likedPlanets.containsKey(planetName)) {
      likedPlanets[planetName] = !likedPlanets[planetName]!;
    } else {
      likedPlanets[planetName] = true;
    }
    await _prefs.setBool(planetName, likedPlanets[planetName]!);
    notifyListeners();
  }
}

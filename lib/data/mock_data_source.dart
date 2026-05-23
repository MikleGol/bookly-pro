import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/service.dart';
import '../models/category.dart';
import '../models/profile.dart';

class MockDataSource {
  Future<List<Category>> loadCategories() async {
    final json = await rootBundle.loadString('assets/data/categories.json');
    final list = jsonDecode(json) as List;
    return list.map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Service>> loadServices() async {
    final json = await rootBundle.loadString('assets/data/services.json');
    final list = jsonDecode(json) as List;
    return list.map((e) {
      return Service.fromJson(e);
    }).toList();
  }

  Future<Profile> loadProfile() async {
    final json = await rootBundle.loadString('assets/data/profile.json');
    return Profile.fromJson(jsonDecode(json));
  }
}

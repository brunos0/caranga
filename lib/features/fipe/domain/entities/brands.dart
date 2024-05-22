//import 'dart:convert';

import 'package:caranga/utils/json_utils.dart';

class Brands {
  Brands({this.brandsList = const []});

  List<Map<String, String>> brandsList;

  factory Brands.fromString(String value) {
    final data = JsonUtils.fromText(value);
    if (data.first['codigo'] != 'Error') {
      return Brands(brandsList: data);
    } else {
      return Brands();
    }
  }
}

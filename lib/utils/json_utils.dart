import 'dart:convert';

//import 'package:caranga/features/fipe/domain/entities/brands.dart';

class JsonUtils {
  //BrandsModel({required Brands brands});
  // : super(heroes: heroes);
  //List<Map<String,String> brands
  // increaseStep() {
  //   step = step++;
  // }

  static List<Map<String, String>> fromText(String value) {
    final jsonDecoded = jsonDecode(value);
    List<Map<String, String>> listData = [];
    try {
      for (var item in jsonDecoded) {
        listData.add(Map<String, String>.from(item));
      }
      return listData;
    } catch (error) {
      return [
        {'codigo': 'Error'}
      ];
    }
  }

  static String toText(List dataList) {
    final jsonData = {};
    for (var e in dataList) {
      jsonData.addEntries(e.entries);
    }
    return jsonEncode(jsonData.toString());
  }
  /*
  factory BrandsModel.fromJson(Map<String, String> json) {
     List<Map<String,String>> brands = [];

    //final List<dynamic> jsonList = json['data']['results'];
    int listSize = json.length;

    for (int i = 0; i < listSize; i++) {
      var listComicsJson = json[i]['codigo'];//['comics']['items'] as List;
      final listComics = [];
      if (listComicsJson.isNotEmpty) {
        listComicsJson.forEach((element) {
          listComics.add(element['name']);
        });
      }

      heroes.add(Hero(
        id: jsonList[i]['id'],
        name: '${jsonList[i]['name']}',
        profilePicture:
            '${jsonList[i]['thumbnail']['path']}.${jsonList[i]['thumbnail']['extension']}',
        comics: listComics,
        description: '${jsonList[i]['description']}',
      ));
    }
  
    return BrandsModel(brands: brands);
  }

  String detailsFromJson(Map<String, dynamic> json) {
    final description = json["data"]["results"][0]['description'];

    return description;
  }
  */
}

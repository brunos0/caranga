//import 'package:caranga/features/fipe/data/models/json_utils.dart';
import 'package:caranga/features/fipe/domain/entities/brands.dart';
import 'package:caranga/features/fipe/domain/entities/models.dart';

abstract class FipeRemoteDataSource {
  Future<Brands?> getBrands();
  Future<Models?> getModels(int index);
  Future<Record> getDetail(int index);
}

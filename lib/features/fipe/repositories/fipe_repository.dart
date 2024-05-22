import 'package:caranga/core/error/failures.dart';
import 'package:caranga/features/fipe/domain/entities/brands.dart';
import 'package:caranga/features/fipe/domain/entities/car_details.dart';
import 'package:caranga/features/fipe/domain/entities/manufacture_year.dart';
import 'package:caranga/features/fipe/domain/entities/models.dart';

abstract class FipeRepository {
  FipeRepository();

  Future<(Brands?, Failure?)> loadBrands();
  Future<(Models?, Failure?)> loadModels(String brand);
  Future<(ManufactureYear?, Failure?)> loadYears(String brand, String model);
  Future<(CarDetails?, Failure?)> loadDetails(
      String brand, String model, String year);
}

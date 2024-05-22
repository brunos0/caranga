import 'package:caranga/core/error/exceptions.dart';
import 'package:caranga/core/error/failures.dart';
import 'package:caranga/core/platform/network_info.dart';
import 'package:caranga/features/fipe/data/datasources/fipe_remote_data_source.dart';
import 'package:caranga/features/fipe/domain/entities/brands.dart';
import 'package:caranga/features/fipe/domain/entities/car_details.dart';
import 'package:caranga/features/fipe/domain/entities/manufacture_year.dart';
import 'package:caranga/features/fipe/domain/entities/models.dart';
import 'package:caranga/features/fipe/repositories/fipe_repository.dart';
import 'package:caranga/injection_container.dart';
//import 'package:caranga/utils/json_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FipeRepositoryImpl implements FipeRepository {
  const FipeRepositoryImpl({
    required this.fipeRemoteDataSource,
    required this.networkInfo,
  });

  final FipeRemoteDataSource fipeRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<(Brands?, Failure?)> loadBrands() async {
    bool isConnected = await networkInfo.isConnected;
    final storage = sl.get<FlutterSecureStorage>();
    final brandsListStored = await storage.read(key: 'brands');
    if (isConnected) {
      try {
        final brands = await fipeRemoteDataSource.getBrands();

        return (brands, null);
      } on ServerException {
        return (null, ServerFailure());
      }
    } else if (brandsListStored != null && brandsListStored.isNotEmpty) {
      return (Brands.fromString(brandsListStored), null);
    } else {
      return (null, NoInternetException());
    }
  }

  @override
  Future<(Models?, Failure?)> loadModels(String brand) {
    // TODO: implement loadModels
    throw UnimplementedError();
  }

  @override
  Future<(CarDetails?, Failure?)> loadDetails(
      String brand, String model, String year) {
    // TODO: implement loadDetails
    throw UnimplementedError();
  }

  @override
  Future<(ManufactureYear?, Failure?)> loadYears(String brand, String model) {
    // TODO: implement loadYears
    throw UnimplementedError();
  }
}

import 'package:caranga/core/error/exceptions.dart';
import 'package:caranga/features/fipe/data/datasources/fipe_remote_data_source.dart';
import 'package:caranga/features/fipe/domain/entities/brands.dart';
import 'package:caranga/features/fipe/domain/entities/models.dart';
import 'package:caranga/utils/json_utils.dart';
import 'package:http/http.dart' as http;

class FipeRemoteDataSourceImpl implements FipeRemoteDataSource {
  const FipeRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<Brands?> getBrands() async {
    final response = await client
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    if (response.statusCode == 200) {
      return Brands(brandsList: JsonUtils.fromText(response.body));
    } else {
      throw (ServerException());
    }
  }

  @override
  Future<Record> getDetail(int index) {
    // TODO: implement getDetail
    throw UnimplementedError();
  }

  @override
  Future<Models?> getModels(int index) {
    // TODO: implement getMopdels
    throw UnimplementedError();
  }
}

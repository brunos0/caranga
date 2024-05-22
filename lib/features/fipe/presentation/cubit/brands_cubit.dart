//import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:caranga/utils/json_utils.dart';
import 'package:caranga/features/fipe/domain/entities/brands.dart';
//import 'package:caranga/features/fipe/domain/entities/brands.dart';
import 'package:caranga/features/fipe/presentation/cubit/brands_state.dart';
import 'package:caranga/features/fipe/repositories/fipe_repository.dart';
import 'package:caranga/injection_container.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit({required this.repository}) : super(InitialState()) {
    _loadBrands();
  }

  final FipeRepository repository;

  void _loadBrands() async {
    try {
      emit(LoadingState());

      final storage = sl.get<FlutterSecureStorage>();
      final brandsListStored = await storage.read(key: 'brands');

      if (brandsListStored != null && brandsListStored.isNotEmpty) {
        final brandsExpiryDate = await storage.read(key: 'brandsExpiryDate');
        if (brandsExpiryDate != null &&
            DateTime.parse(brandsExpiryDate).isBefore(
                (DateTime.now()).subtract(const Duration(days: 31)))) {
          emit(LoadedState(Brands.fromString(brandsListStored)));
          return;
        } else {
          await storage.deleteAll();
        }
      }

      final (result, failure) = await repository.loadBrands();
      if (result != null) {
        storage.write(
            key: 'brandsExpiryDate', value: DateTime.now().toString());
        storage.write(
            key: 'brands', value: JsonUtils.toText(result.brandsList));
        emit(LoadedState(result));
      } else {
        if (failure != null) {
          throw Exception(failure.properties);
        } else {
          throw Exception('Unimplemented Exception');
        }
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}

import 'package:caranga/features/fipe/domain/entities/brands.dart';
import 'package:equatable/equatable.dart';

abstract class BrandsState extends Equatable {}

class InitialState extends BrandsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends BrandsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends BrandsState {
  LoadedState(this.brandMap);

  final Brands brandMap;

  @override
  List<Object> get props => [brandMap];
}

class ErrorState extends BrandsState {
  @override
  List<Object> get props => [];
}

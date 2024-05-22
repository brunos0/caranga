import 'package:bloc/bloc.dart';

class Models extends Cubit<Map<String, String>> {
  Models({Map<String, String> brandList = const {}}) : super(brandList);

  //void action1() {} //emit(state + 1);
  //void action2() {} //=> emit(state - 1);
}

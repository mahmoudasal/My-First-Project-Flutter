// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/home_model.dart';
import '../../repo/user_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() async {
    final data = await AllUserRepository().getHomeDataFromApi();

    emit(ShopLoadingHomeDataStata());
    emit(ShopSuccesHomeDataStata(data));
  }
}

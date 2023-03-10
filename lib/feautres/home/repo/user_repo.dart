import 'package:dio/dio.dart';

import '../model/home_model.dart';

class AllUserRepository {
  Future<HomeModel> getHomeDataFromApi() async {
    final response = await Dio().get("https://student.valuxapps.com/api/home");

    final myData = HomeModel.fromJson(response.data);
    return myData;
  }
}

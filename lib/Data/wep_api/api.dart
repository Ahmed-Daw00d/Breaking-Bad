import 'package:dio/dio.dart';
import 'package:train_bloc/constants/string.dart';

class CharactersApi {
  late Dio dio;
  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      // ignore: avoid_print
      print(response.data.toString());
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}

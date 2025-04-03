import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl: "https://uselessfacts.jsph.pl/api/v2/facts/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getRandomFact() async {
    return await dio.get('random', queryParameters: {'language': 'en'});
  }
}

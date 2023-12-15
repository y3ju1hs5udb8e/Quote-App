import 'package:dio/dio.dart';
import 'package:quote_generator/constant/api.dart';
import 'package:quote_generator/model/quote_model.dart';

class QuoteGen {
  static final dio = Dio();

  static Future<List<QuoteModel>> quoteGen() async {
    try {
      final res = await dio.get(ApiLink.baseUrl);
      return [res.data].map((e) => QuoteModel.fromJson(e)).toList();
    } on DioException catch (err) {
      throw '${err.message}';
    }
  }
}

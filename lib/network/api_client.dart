import 'package:prakerja/config/env.dart';
import 'package:prakerja/model/covid_provinsi.dart';
import 'package:http/http.dart';

class ApiClient {
  static Future<CoronaProvince> getCoronaProvinceId() async {
    Response _response = await get("${Env.baseUrl}/provinsi");
    if (_response.statusCode == 200) {
      return CoronaProvince.fromJson(_response.body);
    } else {
      throw Exception("error code : ${_response.statusCode}");
    }
  }
}
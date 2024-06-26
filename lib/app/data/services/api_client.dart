import 'package:dio/dio.dart';

const baseUrl = "https://cpms.patrickmamsery.co.tz";

class ApiClient {
  final String url;
  final String? token;
  final Map<String, dynamic>? data;
  ApiClient({
    required this.url,
    this.token = null,
    this.data = null,
  });

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Connection': 'keep-alive',
      'Accept-Language': 'en-US',
    }));
  }

  //get method
  Future<Map<String, dynamic>> get() async {
    try {
      var response = await _dio().get(baseUrl + url);
      print(response.toString());
      if (response.statusCode == 200) {
        // Return the response data as a Map<String, dynamic>
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> postData(data) async {
    try {
      var response = await _dio().post(baseUrl + url, data: data);
      print(response.toString());
      if (response.statusCode == 200) {
        // Return the response data as a Map<String, dynamic>
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw e;
    }
  }
}

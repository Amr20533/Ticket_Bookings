import 'package:dio/dio.dart';
import 'package:ticket_booking_app/utils/end_points.dart';

class DioHelper{
  final Dio _dio = Dio();

  Future<List<dynamic>> getNoAuthData(String endPoint) async {
    print('Fetching data from $endPoint');
    try {
      final response = await _dio.get(
        '${AppEndPoints.server}/$endPoint',
      );
      print('Response received: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data: ${response.data}');
        // Ensure 'data' -> 'data' key exists and is not null
        List<dynamic>? dataList = response.data['data']['data'] as List<dynamic>?;
        return dataList ?? [];
      } else {
        print("No Data!");
        return [];
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<dynamic> userGetData({required String endPoint, required String token}) async {
    print('Fetching data from $endPoint');
    try {
      final response = await _dio.get(
        '${AppEndPoints.server}/$endPoint',
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Response received: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data: ${response.data}');
        return response.data;
      } else {
        print("No Data!");
        return response.data;
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<dynamic> noAuthPostData(String endPoint, {required Map<String, dynamic> body}) async {
    print('POST DATA to $endPoint');
    try {
      final response = await _dio.post(
        '${AppEndPoints.server}/$endPoint',
          data: body,
          options:Options(
            contentType: 'application/json',
          ),
          );
      print('Response received: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('POST DATA: ${response.data}');

        return response.data;
      } else {
        print("No Data!");
        return response.data;
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return dioError.response?.data;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }



  Future<dynamic> postData(String endPoint, {required String token, required Map<String, dynamic> body}) async {
    print('POST DATA to $endPoint');
    try {
      final response = await _dio.post(
        '${AppEndPoints.server}/$endPoint',
        data: body,
        options:Options(
          contentType: 'application/json',
          headers: {
            'Authorization' : 'Bearer $token'
          },
        ),
      );
      print('Response received: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('POST DATA: ${response.data}');

        return response.data;
      } else {
        print("No Data!");
        return response.data;
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return dioError.response?.data;
    } catch (e) {
      print('Error: $e');
      return e;
    }
  }

}
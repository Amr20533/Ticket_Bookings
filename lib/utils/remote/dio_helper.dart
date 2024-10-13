import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';

class DioHelper{
  final Dio _dio = Dio();

  Future<List<dynamic>> authGetData({required String endPoint, required String token}) async {
    print('Fetching data from ${AppEndPoints.server}/$endPoint');
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
    print('Fetching data from ${AppEndPoints.server}/$endPoint');
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
        return response.data['data']['data'];
      } else {
        print("No Data!");
        return response.data['data']['data'];
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }


  /// A Method to return data with no ['data']['data'] for a Future dynamic Map as response.data['ticket']
  Future<dynamic> getBlankData({required String endPoint, required String token}) async {
    print('Fetching data from ${AppEndPoints.server}/$endPoint');
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


  Future<Map<String, dynamic>> getMyData({required String endPoint, required String token}) async {
    print('Fetching data from ${AppEndPoints.server}/$endPoint');

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

        // Ensure you're returning the correct data type
        return response.data as Map<String, dynamic>; // or adjust based on your actual needs
      } else {
        print("No Data! Status code: ${response.statusCode}");
        return Future.error('Failed to fetch data, status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return Future.error('Request failed: ${dioError.message}');
    } catch (e) {
      print('Error: $e');
      return Future.error('An unexpected error occurred');
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
        data: jsonEncode(body),
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response received: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('POST DATA: ${response.data}');
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

  Future<dynamic> patchData(String endPoint, {required String token, required Map<String, dynamic> body}) async {
    print('PATCH DATA to $endPoint');
    try {
      final response = await _dio.patch(
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
        print('PATCH DATA: ${response.data}');

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
import 'package:dio/dio.dart';
import 'package:ticket_booking_app/utils/end_points.dart';

class DioHelper{
  final Dio _dio = Dio();

  Future<List<dynamic>> getData(String endPoint) async {
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
    } on DioError catch (dioError) {
      print('DioError: ${dioError.response?.data ?? dioError.message}');
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

}
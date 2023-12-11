import 'package:dio/dio.dart';
import 'package:lawas_sumbawa/model/detail_model.dart';

class DetailController {
  final Dio _dio = Dio();

  Future<DetaillawasModel> fetchDataById(int id) async {
    final String apiUrl = 'https://lombokfuntransport.com/lawas_backoffice/api/get-byid';

    try {
      final response = await _dio.post(
        apiUrl,
        queryParameters: {'id': id},
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return DetaillawasModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

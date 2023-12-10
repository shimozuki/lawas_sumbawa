import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lawas_sumbawa/model/detaillawas_model.dart';

class DetailLawasController {
  static const String apiUrl = 'https://lombokfuntransport.com/lawas_backoffice/api/get-byid';

  Future<DetailLawasModel> fetchDetailData(int id) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'id': id.toString()},
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        // Add any additional headers here if needed
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      print("datanya : ${jsonData}");
      return DetailLawasModel.fromJson(jsonData['data']); // Pass jsonData['data']
    } else {
      throw Exception('Failed to load data');
    }
  }
}


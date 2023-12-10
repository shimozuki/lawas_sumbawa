import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lawas_sumbawa/model/lawas_model.dart';

class LawasController {
  static const String apiUrl = 'https://lombokfuntransport.com/lawas_backoffice/api/get-all';

  Future<List<LawasModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((item) => LawasModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

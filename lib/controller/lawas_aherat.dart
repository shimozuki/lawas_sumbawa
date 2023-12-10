import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lawas_sumbawa/model/lawasdunia_model.dart';

class LawasaheratController {
  static const String apiUrl = 'https://lombokfuntransport.com/lawas_backoffice/api/lawas_aherat';

  Future<List<LawasduniaModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((item) => LawasduniaModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
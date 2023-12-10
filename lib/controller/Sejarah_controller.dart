import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lawas_sumbawa/model/about_model.dart';

class SejarahController {
  static const String apiUrl = 'https://lombokfuntransport.com/lawas_backoffice/api/getSejarah';

  Future<AboutModel> fetchAboutData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return AboutModel.fromJson(jsonData['data'][0]);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

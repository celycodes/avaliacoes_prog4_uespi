import 'dart:convert';
import '../models/apod_model.dart';
import 'package:http/http.dart' as http;

class ApodApi {
  final String apiKey = 'd852q1mdkOlU285PjFlZU1yAzNdRmrJ21Q0trvKn';
  final String baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String count = '10';

  Future<List<ApodModel>> fetchApod() async {
    var response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey&count=$count'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        final apodList = jsonData.map((apodJson) => ApodModel.fromJson(apodJson)).toList();
        return apodList;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to fetch APOD data. Error: ${response.statusCode}');
    }
  }
}
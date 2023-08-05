// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  Future<List<MovieModel>> fetchMovies() async {
    final url = Uri.parse('https://moviesdatabase.p.rapidapi.com/titles?info=base_info&limit=10&year=2023');

    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': '20c8c605f4mshacef60df39fd26ap1a89b3jsncdd76df2ce76',
        'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<MovieModel> movies = jsonResponse["results"].map<MovieModel>(
        (map)=> MovieModel.fromJson(map) 
      ).toList();
      // List<MovieModel> movies = List<MovieModel>.from(jsonResponse.map((data) => MovieModel.fromJson(data)));
      return movies;
    } else {
      throw Exception('Erro na solicitação. Código de status: ${response.statusCode}');
    }
  }
}
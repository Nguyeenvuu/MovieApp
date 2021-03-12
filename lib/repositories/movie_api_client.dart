import 'dart:convert';
import 'package:MovieApp/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieApiClient {
  static String _baseURL = "http://api/themoviedb.org/3/movie/";
  static String _apiKey = "802b2c4b88ea1183e50e6b285a27696e";
  static Future<Movie> fetchMovie(int id) async {
    String url = _baseURL + id.toString() + "api_key?=" + _apiKey;

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static List<Future<Movie>> loadMovie(List<int> list_id) {
    List<Future<Movie>> list_movies = new List<Future<Movie>>();
    for (var id in list_id) {
      Future<Movie> movie = fetchMovie(id);
      if (movie != null) {
        list_movies.add(movie);
      }
    }
    return list_movies;
  }

  static Future<Map<String, dynamic>> loadRecommendedMovies(int userId) async {
    http.Response response = await http.post(
        "http://127.0.0.1:8000/api/recommendations",
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, int>{'user_id': userId}));
    Map<String, dynamic> res_data = json.decode(response.body);
    return res_data;
  }

  static Future<List<int>> searchMovies(String title) async {
    String url = "http://127.0.0.1:8000/api/search_movies?title=" +
        title.trim().replaceAll(' ', '%20');
    http.Response response = await http.get(url);

    List<dynamic> data = json.decode(response.body);
    List<int> listMovies = new List<int>();
    for (var i = 0; i < data.length; i++) {
      listMovies.add(data[i]['movie_id']);
    }
    return listMovies;
  }
}

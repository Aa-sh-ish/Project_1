import 'dart:convert';

import 'package:project_1/model/Move2_model.dart';

import 'package:http/http.dart' as http;

class NetworkHelper_2 {
  String url_2 =
      "https://api.themoviedb.org/3/trending/all/day?api_key=a5482144993f4b65fb85bd5cc70327c1";
  Future<Movie_2> getMovieDetails_2() async {
    var movieList_2;
    var response = await http.get(Uri.parse(url_2));
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonMap = jsonDecode(data);
      movieList_2 = Movie_2.fromJson(jsonMap);
    }
    return movieList_2;
  }
}

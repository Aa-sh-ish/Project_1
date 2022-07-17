import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_1/model/Details.dart';

Future<MovieModelDetails> getMovieDetails(String id) async {
  final response = await http.get(
    Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=c9b6129a66e041f79c9c654264747b6f'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MovieModelDetails.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    print(response.body);
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

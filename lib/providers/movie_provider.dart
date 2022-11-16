import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieProvider with ChangeNotifier {
  List trendingMovies = [];
  final apiKey = "de75b3f56e85a5f21c12c4bd7de5dfa4";
  final readAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTc1YjNmNTZlODVhNWYyMWMxMmM0YmQ3ZGU1ZGZhNCIsInN1YiI6IjYzNzI0ZDE4MDI4NDIwMDA3YTFkMDA1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fbzNcGDpnR_cKjTJt07-22qF0lA-kv7zR9y60DO0hYg";

  MovieProvider() {
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();

    trendingMovies = trendingResult['results'];
    notifyListeners();
  }
}

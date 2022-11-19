import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class TopratedDetailsPage extends StatelessWidget {
  static String route = 'toprated detail page';
  const TopratedDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    final int index = routeArgs['index'] as int;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.network(
                "http://image.tmdb.org/t/p/w500${context.watch<MovieProvider>().tvs[index]['poster_path']}",
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                context.watch<MovieProvider>().tvs[index]['name'] as String,
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 15,
              ),
              child: Text(
                "Release Date: ${context.watch<MovieProvider>().trendingMovies[index]['release_date'].toString()}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                context
                    .watch<MovieProvider>()
                    .trendingMovies[index]['overview']
                    .toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

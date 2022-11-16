import 'package:flutter/material.dart';
import 'package:movies_app/screens/details_page.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/providers/movie_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trending
              Text(
                'Trending Movies',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount:
                      context.watch<MovieProvider>().trendingMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: 120,
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, DetailsPage.route,
                              arguments: {'index': index}),
                          child: Image.network(
                            "http://image.tmdb.org/t/p/w500${context.watch<MovieProvider>().trendingMovies[index]['poster_path']}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/screens/toprated_detail_page.dart';
import 'package:movies_app/screens/trending_details_page.dart';
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
          child: ListView(
            children: [
              // Trending
              Text(
                'Trending Movies',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 15,
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
                              context, TrendingDetailsPage.route,
                              arguments: {'index': index}),
                          child: Image.network(
                            "http://image.tmdb.org/t/p/w500${context.watch<MovieProvider>().trendingMovies[index]['poster_path']}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                ),
              ),

              //top rated tv
              const SizedBox(
                height: 30,
              ),
              Text(
                'Top Rated',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 15),
              GridView.builder(
                itemCount: context.watch<MovieProvider>().tvs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.8,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: ((context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, TopratedDetailsPage.route,
                                arguments: {'index': index}),
                            child: Image.network(
                              "http://image.tmdb.org/t/p/w500${context.watch<MovieProvider>().tvs[index]['poster_path']}",
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                              height: 185,
                            ),
                          ),
                          Text(
                            context.watch<MovieProvider>().tvs[index]['name']
                                as String,
                            style: const TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

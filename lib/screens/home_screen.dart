import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:app_pelicula/search/search_delegate.dart';
import 'package:app_pelicula/providers/movies_provider.dart';
import 'package:app_pelicula/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Películas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              // Slider de películas
              MovieSlider(
                movies: moviesProvider.popularMovies, // populares,
                title: 'Populares', // opcional
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}

import 'dart:convert';
import 'detail_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late List<dynamic> _movies;

  @override
  void initState() {
    super.initState();
    _movies = [];
    _fetchMovies();
  }

  void _fetchMovies() async {
    final http.Response response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=1f54bd990f1cdfb230adb312546d765d'),
    );
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    setState(() {
      _movies = responseBody['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> movie = _movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMoviesPage(movie: movie),
                ),
              );
            },
            child: GridTile(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
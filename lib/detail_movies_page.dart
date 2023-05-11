import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:convert';


class DetailMoviesPage extends StatefulWidget {
  const DetailMoviesPage({Key? key, required this.movie}) : super(key: key);

  final Map<String, dynamic> movie;

  @override
  _DetailMoviesPageState createState() => _DetailMoviesPageState();
}

class _DetailMoviesPageState extends State<DetailMoviesPage> {
  late Map<String, dynamic> _movie;
  late Map<String, dynamic> _movieVideo;

  @override
  void initState() {
    super.initState();
    _movie = widget.movie;
    _fetchMoviesDetail();
  }

  void _fetchMoviesDetail() async {
    final http.Response response1 = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/${_movie['id']}?api_key=1f54bd990f1cdfb230adb312546d765d'),
    );
    final http.Response response2 = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/${_movie['id']}/videos?api_key=1f54bd990f1cdfb230adb312546d765d'),
    );

    final Map<String, dynamic> responseBody1 = jsonDecode(response1.body);
    final Map<String, dynamic> responseBody2 = jsonDecode(response2.body);

    setState(() {
      _movie = responseBody1;
      _movieVideo = responseBody2;
    });
  }

  void _onPlayVideo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: _movieVideo['results'][0]['key'],
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: const ProgressBarColors(
            playedColor: Colors.blueAccent,
            handleColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_movie['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _onPlayVideo,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${_movie['backdrop_path']}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            _movie['vote_average'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                _movie['overview'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Release Date: '),
                  Text(_movie['release_date']),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Vote Average: '),
                  Text(_movie['vote_average'].toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Vote Count: '),
                  Text(_movie['vote_count'].toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Popularity: '),
                  Text(_movie['popularity'].toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
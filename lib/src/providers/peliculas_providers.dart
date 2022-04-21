import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/pelicula_model.dart';

class PeliculasProvider {
  final String _apikey = "89674442491a16f4f93e82609bd07793";
  final String _url = "api.themoviedb.org";
  final String _language = "es-ES";
  int _popularesPage = 0;

  List<Pelicula> _populares = [];
  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;
  //ME QUEDE AQUI xd

  void disposeStreams() {
    _popularesStream?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    //print(decodedData['results']);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    //print(peliculas.items[0].title);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopular() async {
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'lenguage': _language,
      'page': _popularesPage.toString()
    });

    return await _procesarRespuesta(url);
  }
}

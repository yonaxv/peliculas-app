import 'package:flutter/material.dart';

import 'package:peliculas/src/Widgets/card_swiper_widget.dart';
import 'package:peliculas/src/Widgets/movie_horizontal_widget.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

class HomePage extends StatelessWidget {
  final peliculasprovider = PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          backgroundColor: Colors.indigoAccent,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        // body: SafeArea(
        //   child: Text('Hello World!'),
        // ),                           para los que tienen notch
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_swiperTarjetas(), _footer(context)]),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasprovider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Container(child: CardSwiper(peliculas: snapshot.data));
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );

    //peliculasprovider.getEnCines();

    //return CardSwiper(peliculas: [1, 2, 3, 4, 5]);
    //return Container();
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Populares',
                style: Theme.of(context).textTheme.subtitle1,
              )),
          FutureBuilder(
            future: peliculasprovider.getPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(peliculas: snapshot.data);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

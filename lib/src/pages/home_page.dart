import 'package:flutter/material.dart';

import 'package:peliculas/src/Widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
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
          child: Column(children: [_swiperTarjetas()]),
        ));
  }

  Widget _swiperTarjetas() {
    return CardSwiper(peliculas: [1, 2, 3, 4, 5]);
    //return Container();
  }
}

import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        width: _screensize.width * 1,
        height: _screensize.height * 0.5,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: peliculas.length,
          itemWidth: 300.0,
          itemHeight: 400.0,
          layout: SwiperLayout.STACK,
        ));
  }
}

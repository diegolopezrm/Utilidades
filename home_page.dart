
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  

  final peliculasProvider =new PeliculasProvider();

  @override
  Widget build(BuildContext context) {


    peliculasProvider.getPopulares();


    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en Cines'),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,), 
            onPressed: () {
              showSearch(
                context: context, 
                delegate: DataSearch(),
                query: ''
              );
            }
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        )
      )
      
      ,

    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        if ( snapshot.hasData ){
          return CardSwiper(
          peliculas:  snapshot.data,
          );
        } else {
          return Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
      },
    );

    
    /* peliculasProvider.getEnCines();

    return CardSwiper(
      peliculas:  [1,2,3,4,5],
    ); */
  }

  Widget _footer(BuildContext context) {

    return Container(
      width: double.infinity ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead)
          ),
          SizedBox(height: 5),

          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              if ( snapshot.hasData ){
                return MovieHorizontal(
                peliculas:  snapshot.data,
                siguientePagina: peliculasProvider.getPopulares,
              );
              } else {
                return Center(child: CircularProgressIndicator());

              }
            },
          ),
        ]
      )

    );
  }
}
import 'dart:async';


import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {


  ScrollController _scrollController = new ScrollController();

  

  List<int> _listaNumeros= new List();
  int _ultimoitem = 0;
  bool _isLoading = false;

 
  @override
  void initState() { 
    super.initState();

    _agregar10();
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) { 
      /* _agregar10(); */
        fetchData();
      }
    });
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children:<Widget> [
          _crearLista(),
          _crearLoading(),
        ]
      )
      
      
      
      
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(

        onRefresh: obtenerPagina1,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){

          final imagen = _listaNumeros[index];


          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage('https://i.picsum.photos/id/$imagen/400/300.jpg'),
      
          );

        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {

    final duration = new Duration( seconds: 2);
    new Timer( duration, (){

      _listaNumeros.clear();
      _ultimoitem++;
      _agregar10();

    });

    return Future.delayed(duration);

  }


  _agregar10(){

    for (var i = 1; i < 10; i++) {
      _ultimoitem++;
      _listaNumeros.add(_ultimoitem) ;
      
    }
    setState(() {
      
    });
  } 

  Future<Null> fetchData() async {


    _isLoading = true;

    setState(() {
      
    });
    
    final duration = new Duration( seconds: 2 );
    new Timer(
      duration, 
      respuestaHTTP,
    );


  }

  void respuestaHTTP(){


    _isLoading= false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: Duration( milliseconds: 250),
      curve: Curves.bounceInOut
    );


    _agregar10();
  }

  Widget _crearLoading() {
    
    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max ,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
            CircularProgressIndicator()
            ]
          ),
          SizedBox( height: 15 )
        ]
      );
      
      
      
    } else {
      return Container();
    }
  }
}
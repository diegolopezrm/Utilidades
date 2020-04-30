import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          
        ],
      ),
    );
  }

  Widget _cardTipo1(){
    
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(50)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(  Icons.photo_album, color: Colors.greenAccent),
            title: Text('Soy el dueño de esta tarjeta') ,
            subtitle: Text('Diego Lopez'),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {}, 
                child: Text('Cancelar')
              ),
              FlatButton(
                onPressed: () {}, 
                child: Text('OK')
              )
            ],
          )
        ]
      ),

    );

  }


  Widget _cardTipo2(){

    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children:<Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: NetworkImage('https://www.xtrafondos.com/descargar.php?id=3934&resolucion=3840x2160'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          //Image(
          // image: NetworkImage('https://www.xtrafondos.com/descargar.php?id=3934&resolucion=3840x2160'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('no tengo idea de que poner'))
        ]

      ),

    );


    return  Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10)
          )
        ]
        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,
      ),
    );
  }
}


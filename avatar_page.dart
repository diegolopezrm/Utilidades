import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.pasionfutbol.com/__export/1586107492248/sites/pasionlibertadores/img/2020/04/05/cristiano-ronaldo-juventus-serie-a-temporada-2019_crop1586106637056.jpg_691115875.jpg'),
              radius: 20,
            ),
          ),  

          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.greenAccent,
              
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://s1.eestatic.com/2018/07/17/elbernabeu/futbol/Futbol_323230729_91156082_1024x576.jpg'),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration( milliseconds: 200),
        ) ,
      ),
    );
  }
}
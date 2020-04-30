import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  bool _bloquearCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          children: <Widget> [
            _crearSlider(),
            Divider(),
            _checkBox(),
            Divider(),
            _crearSwitch(),
            Expanded (
              child: _crearImagen()
            ),
          ]
        )
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño',
      //divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: ( _bloquearCheck ) ? null: ( valor ){

        setState(() {
          _valorSlider = valor;
        });
        
      },
    );
  }

  Widget _checkBox() {

    return CheckboxListTile(
      title:  Text('Bloquear slider'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
        
      }
    );

    /* return Checkbox(
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
        
      }
    ); */
  }

  Widget _crearSwitch() {

    return SwitchListTile(
      inactiveTrackColor: Colors.redAccent,
      activeColor: Colors.greenAccent,
      title:  Text('Bloquear slider'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
        
      }
    );

  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://elcomercio.pe/resizer/It7FEdCKoJye04PhBIvL8GwTS84=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/IYIUIXWOQFCBHMLKFHP2WYNDUA.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
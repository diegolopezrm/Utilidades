import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = ' ';
  String _email  = ' ';
  String _fecha  = ' ';
  String _opcionSeleccionada = 'volar';

  List<String> _poderes  = [ 'volar', 'rayos x', 'super aliento', 'super fuerza',];

  TextEditingController _inputFieldDateController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10, vertical: 10),
        children: <Widget> [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility, color: Colors.redAccent, size: 40 ,),
        icon: Icon(Icons.account_circle, color: Colors.greenAccent,)


      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;          
        });
      },  
    );
  }

  Widget _crearEmail() {
    return TextField(

      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration( 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email, color: Colors.redAccent, size: 40 ,),
        icon: Icon(Icons.email, color: Colors.greenAccent,)
      ),
      onChanged: (valor) => setState(() {
          _email= valor;          
      })   
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.security, color: Colors.redAccent, size: 40 ,),
        icon: Icon(Icons.lock, color: Colors.greenAccent,)
      ),
      onChanged: (valor) => setState(() {
          _email= valor;          
      })
    );
  }

  Widget _crearFecha( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar, color: Colors.redAccent, size: 40 ,),
        icon: Icon(Icons.calendar_today, color: Colors.greenAccent,)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2025),
      locale: Locale('es')
    );
    
    if (picked != null ){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){

      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all, color: Colors.greenAccent,),
        SizedBox(width: 30 ,),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(), 
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );

    
    
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),

    );
  }    
}
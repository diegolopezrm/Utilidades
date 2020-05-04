import 'package:azafran/src/provider/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  
  final Function toggleView;
  Register({ this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.fill,
              height: 40,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.account_circle, ),
          )
        ],
      ),
      
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 20.0),

              Center(
                child: Text("Registro", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),),
              ),

              SizedBox(height: 40.0),

              Center(
                child: RaisedButton(

                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  textTheme: ButtonTextTheme.accent,
                  child: Text(
                    "Iniciar",
                    style: TextStyle(
                    ),
                  ),
                  onPressed: (){
                    widget.toggleView();
                  }
                )
              ),
              
              SizedBox(height: 40,),

              TextFormField(
                validator: (val) => val.isEmpty ? 'Introduce un correo' : null,
                key: _formKey,
                onChanged: (val){
                  setState(() => email = val );
                }, 
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hoverColor: Colors.green,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                  ),
                  /* hintText: 'Email',
                  labelText: 'Email', */
                  suffixIcon: Icon(Icons.alternate_email, color: Colors.greenAccent, size: 20 ,),
                  icon: Icon(Icons.email, color: Colors.greenAccent,)
                ),
              ),

              SizedBox(height: 20.0),

              TextFormField(
                validator: (val) => val.length < 6 ?  'Mas de 6 caracteres' : null,
                onChanged: (val){
                  setState(() => password = val );
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  /* hintText: 'Contraseña',
                  labelText: 'Contraseña', */
                  suffixIcon: Icon(Icons.security, color: Colors.greenAccent, size: 20 ,),
                  icon: Icon(Icons.lock, color: Colors.greenAccent,)
                ),
              ),

              SizedBox(height: 20.0),

              RaisedButton(
                color: Colors.greenAccent,
                textColor: Colors.white,
                textTheme: ButtonTextTheme.accent,
                child: Text(
                  "Registrar",
                  style: TextStyle(
                  
                  ),
                  ),
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    print(email);
                    print(password);
                  }
                },
              ),
              
            ],
          ),
        ),
      ),
    );

  }
}
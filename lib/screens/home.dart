import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/screens/my_service.dart';
import 'package:firstapp/screens/register.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //1st start function of Class _HomeState
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  //Methode
  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/food_logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Noodle Time',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.red.shade400,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Courgette',
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.blue.shade500,
      child: Text('Sign In', style: TextStyle(color: Colors.white)),
      onPressed: () {
        print('You click Sign In');
      },
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You click Sign Up');
        //Open new page
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(width: 5.0),
        signUpButton(),
      ],
    );
  }

  //2nd function of Class _HomeState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Container(
          padding: EdgeInsets.only(left:20,bottom:20,right:20,top:60),
          margin: EdgeInsets.only(top:219),
          constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height -219),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink[100], Colors.pink[50]],
              stops: [0.5, 1],
              begin: const FractionalOffset(0.5, 0.2),
              end: const FractionalOffset(1, 1),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight:Radius.circular(30)
            )
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                showLogo(),
                showAppName(),
                SizedBox(height: 8.0),
                showButton()
              ],
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        ),
      ),
    );
  }
}

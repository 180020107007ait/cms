import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register_login_demo/ui/authentication.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  Padding( // some padding
            padding: EdgeInsets.only(top: 400.0, right: 30.0, left: 30.0, bottom: 50.0),
            child: Text("Welcome to College Management System", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)), // header
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Authentication()));
            }, 
            child: Text('Log Out'),
            )
        ],
      ),
    );
  }
}
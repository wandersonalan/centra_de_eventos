import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:central_de_eventos/screens/login_screen.dart';
import 'package:central_de_eventos/screens/lista_eventos.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 5), () {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                print ("não está logado");
                return LoginScreen();
              })
          );
        } else {
          //tela de listagem de eventos
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                print ("está logado");
                return ListaEventos();
              })
          );
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
            alignment: Alignment.center,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Container(
                    child:SizedBox(
                        height:200,width:200,
                        child:Image.asset("assets/images/logo.png")
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:30),
                    //margin top 30
                    child:const Text("Central de Eventos", style: TextStyle(
                      fontSize: 30,
                    ),),
                  ),
                ]
            )
        )
    );
  }
}
import 'package:central_de_eventos/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListaEventos extends StatefulWidget {
  const ListaEventos({Key? key}) : super(key: key);
  @override
  _ListaEventosState createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Tela de lista de eventos',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                      child: const Text('Logoff'),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      }
                  )
              ),
            ]
        )
    );
  }
}
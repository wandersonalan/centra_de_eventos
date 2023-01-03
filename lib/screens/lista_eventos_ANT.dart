




import 'package:central_de_eventos/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('evento').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        children: snapshot.data!.docs.map((doc) {
                          return Card(
                            child: ListTile(
                              //title: Text(doc.data()!['Nome']),
                            ),
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
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
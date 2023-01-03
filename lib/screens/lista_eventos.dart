import 'package:central_de_eventos/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'form_evento.dart';

class ListaEventos extends StatefulWidget {
  const ListaEventos({Key? key}) : super(key: key);
  @override
  _ListaEventosState createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('evento').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final eventoSnapshot = snapshot.data?.docs;
            if (eventoSnapshot!.isEmpty) {
              return const Text('Sem eventos');
            }
            return ListView.builder(
                itemCount: eventoSnapshot.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(eventoSnapshot[index]['nome'] +
                                ' || Data: ' +
                                eventoSnapshot[index]['data']),
                    subtitle: Text(eventoSnapshot[index]['detalhes']),
                  );
                });
          }),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
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
                })),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Incluir Evento',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FormPageEvento(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

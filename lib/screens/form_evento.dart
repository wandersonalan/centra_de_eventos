import 'package:central_de_eventos/screens/verifica_campos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:central_de_eventos/valida_entrada_form.dart';
import 'package:central_de_eventos/screens/lista_eventos.dart';
import 'package:intl/intl.dart';

class FormPageEvento extends StatefulWidget {
  const FormPageEvento({Key? key}) : super(key: key);
  @override
  _FormPageEventoState createState() => _FormPageEventoState();
}

String nome = "";
String detalhes = "";
TextEditingController dateinput = TextEditingController();

class _FormPageEventoState extends State<FormPageEvento> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Nome',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidName) {
                    return 'Insira um nome válido';
                  } else {
                    nome = val;
                  }
                },
              ),
              CustomFormField(
                hintText: 'Descrição',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidName) {
                    return 'Insira uma descrição válida';
                  } else {
                    detalhes = val;
                  }
                },
              ),
              TextField(
                controller: dateinput,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Data do evento"
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101)
                  );
                  if(pickedDate != null ){
                    print(pickedDate);
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateinput.text = formattedDate;
                    });
                  }else{
                    print("Data não selecionada");
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> evento;
                    FirebaseFirestore
                        .instance
                        .collection("evento")
                        .add(evento = <String, dynamic>{
                          "nome": nome,
                          "detalhes": detalhes,
                          "data": dateinput.text,
                         });
                    FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) {
                      if (user != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ListaEventos(),
                          ),
                        );
                        print(user.uid);
                      }
                  });
                };
                },
                child: const Text('Incluir Evento'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


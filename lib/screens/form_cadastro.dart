import 'package:central_de_eventos/screens/verifica_campos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:central_de_eventos/valida_entrada_form.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState();
}
class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   nameController.dispose();
  //   phoneController.dispose();
  //   super.dispose();
  // }
String nome = "";
String email = "";
String tel = "";
String senha = "";

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
                hintText: 'Email',
                validator: (val) {
                  if (!val!.isValidEmail) {
                    return 'Insira um e-mail válido';
                  } else {
                    email = val;
                  }
                },
              ),
              CustomFormField(
                hintText: 'Telefone',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidPhone) {
                    return 'Insira um telefone válido';
                  } else {
                    tel = val;
                  }
                },
              ),
              CustomFormField(
                hintText: 'Senha',
                validator: (val) {
                  if (!val!.isValidPassword) {
                    return 'Insira um password válido';
                  } else {
                    senha = val;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: senha
                    );
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => SuccessPage(),
                    //   ),
                    // );
                  }
                },
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
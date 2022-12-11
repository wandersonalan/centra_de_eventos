import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:central_de_eventos/global.dart';

class CustomFormField extends StatelessWidget {

  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: emailController,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
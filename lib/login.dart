import 'package:flutter/material.dart';
import 'userPage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  InputDecoration decoration(String tip){
    return  InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 150, 144, 144), width: 1),
                ),
                hintText: tip,
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:  Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0), child:  Center(

        child: Column(
          children: [
          const Text(" "),
          const Text("Numero de celular ou Email:"),
          TextFormField(
             decoration: decoration("email ou numero"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          const Text("Senha:"),
          TextFormField(
            decoration: decoration("*********"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const Text(" "),
          ElevatedButton(onPressed: () {}, child: const Text("Proximo"))])
    )));
  }
}
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Column(
          children: [
          const Text(" "),
          const Text("Numero de celular ou Email:"),
         
          const Text("Senha:"),
          ])
    );
  }
}
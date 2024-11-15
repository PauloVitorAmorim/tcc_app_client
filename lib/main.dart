import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ' '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _cadastro() {
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Cadastro()),
  );
  }

  void _login() {
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Container(
          height: double.infinity,
          width: double.infinity,
           decoration: const BoxDecoration(
          
          image: DecorationImage(
            image: AssetImage("assets/op.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            const Text(
              'Projeto Catraca',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              ' ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _login,
              style: ButtonStyle( 
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 194, 206, 197)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: Color.fromARGB(255, 52, 145, 72))
                )
              )), 
              child: const Text("Login"),
            ),
            const Text(""),
            ElevatedButton(onPressed: _cadastro,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 127, 255, 185)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: Color.fromARGB(255, 13, 117, 44))
                )
              )), child: const Text("Cadastro"))
          ],
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}

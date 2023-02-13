import 'package:flutter/material.dart';

class ExitAccount extends StatefulWidget {
  const ExitAccount({super.key});

  @override
  State<ExitAccount> createState() => _ExitAccountState();
}

class _ExitAccountState extends State<ExitAccount> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000)).then((value) => Navigator.popAndPushNamed(context, "login"));
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      body:  Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.orange[200]!
            ]
          )
        ),
        child: const Center(child: Text("Cerrando sesión..",style: TextStyle(color: Colors.white,fontSize: 20),))),
    );
  }
}
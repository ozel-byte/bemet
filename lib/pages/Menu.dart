import 'package:bemet/service/SaveAccount.dart';
import 'package:bemet/service/bemetService.dart';
import 'package:flutter/material.dart';
import 'package:bemet/pages/InsumoPage.dart';
import 'package:bemet/pages/MedicePage.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Widget> pages = [const MedicinePage(), const InsumoPage()];

  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        elevation: 0.0,
        title: const Text("Bemet"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              SaveAccount().deleteSaveAccount();
              Navigator.popAndPushNamed(context, "exit-session");
            },
            icon: const Icon(Icons.exit_to_app_rounded)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "search",
                    arguments: index == 0 ? "Medical" : "Insumo");
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        selectedItemColor: Colors.orange,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_information), label: "Medical"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services), label: "Insumo")
        ],
      ),
    );
  }
}

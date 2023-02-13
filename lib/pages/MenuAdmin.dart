import 'package:bemet/service/SaveAccount.dart';
import 'package:flutter/material.dart';

import 'InsumoPage.dart';
import 'MedicePage.dart';

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({super.key});

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
   List<Widget> pages = [const MedicinePage(), const InsumoPage()];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          SaveAccount().deleteSaveAccount();
          Navigator.popAndPushNamed(context, "exit-session");
        },icon: const Icon(Icons.exit_to_app_rounded),),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))],
        title: const Text("Bemet"),
      ),
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: (){
          if (index==0) {
            Navigator.pushNamed(context, "add-medical");
          }else{
            Navigator.pushNamed(context, "add-insumo");
          }
        },
        child: const Icon(Icons.add),
        ),
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
          BottomNavigationBarItem(icon: Icon(Icons.medical_information),label: "Medical"),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services),label: "Insumo")
        ],
      ),
    );
  }
}

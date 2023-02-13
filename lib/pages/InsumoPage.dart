import 'package:flutter/material.dart';

import '../model/Consumibles.dart';
import '../service/bemetService.dart';

class InsumoPage extends StatelessWidget {
  const InsumoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BemetService().getConsumibles(),
      builder: (context, AsyncSnapshot<List<Consumible>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "item", arguments: {
                      "name": snapshot.data![index].name,
                      "marca": snapshot.data![index].marca,
                      "piezas": snapshot.data![index].piezas,
                      "referencia": snapshot.data![index].referencia,
                    });
                  },
                  title:  Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].descripcion),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bemet/service/bemetService.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: BemetService().getMedicos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                borderOnForeground: true,
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 500,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          width: size.width * 0.6,
                                          child: Image(
                                              image: NetworkImage(
                                                  snapshot.data![index].img))),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(snapshot.data![index].name,style:const TextStyle(fontSize: 20),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(snapshot.data![index].marca),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("Piezas: ${snapshot.data![index].piezas}"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("Reference: ${snapshot.data![index].referencia}"),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.orange,
                                          Colors.orange[200]!
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Center(
                                      child: Text(
                                    "Solicitar",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].marca),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class ViewItem extends StatefulWidget {
  const ViewItem({super.key});

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  final TextStyle _style = const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("View item"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(args["img"]))),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "piezas: ${args["piezas"]}",
                style: _style.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "${args["name"]}",
              style: _style,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "marca: ${args["marca"]}",
              style: _style.copyWith(fontWeight: FontWeight.w300, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "referencia: ${args["referencia"]}",
              style: _style.copyWith(fontWeight: FontWeight.w300, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

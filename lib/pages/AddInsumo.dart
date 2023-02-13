import 'package:flutter/material.dart';

import '../service/bemetService.dart';

class AddInsumo extends StatefulWidget {
  const AddInsumo({super.key});

  @override
  State<AddInsumo> createState() => _AddInsumoState();
}

class _AddInsumoState extends State<AddInsumo> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerMarca = TextEditingController();
  final TextEditingController _controllerRferencia = TextEditingController();
  final TextEditingController _controllerPiezas = TextEditingController();
  final TextEditingController _controllerUbicacion = TextEditingController();
  final TextEditingController _controllerDescrip = TextEditingController();
  final TextEditingController _controllerCompa = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        elevation: 0.0,
        title: const Text("Agregar Producto Insumo"),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.22,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orange[300]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.photo_camera_back_outlined,
                            color: Colors.orange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Agregar Imagen del producto",
                            style: TextStyle(
                                color: Colors.orange[100],
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nombre",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerName,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Marca del producto",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerMarca,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Piezas",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerPiezas,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Referencia",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerRferencia,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ubicacion",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerUbicacion,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Descripcion",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerDescrip,
                        maxLines: 5,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Compatible",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: _controllerCompa,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: ""),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    if (_controllerName.text.isNotEmpty &&
                        _controllerMarca.text.isNotEmpty &&
                        _controllerPiezas.text.isNotEmpty &&
                        _controllerRferencia.text.isNotEmpty &&
                        _controllerUbicacion.text.isNotEmpty &&
                        _controllerCompa.text.isNotEmpty &&
                        _controllerDescrip.text.isNotEmpty) {
                      final response = await BemetService().addInsumo(
                          _controllerName.text,
                          _controllerMarca.text,
                          _controllerPiezas.text,
                          _controllerRferencia.text,
                          _controllerUbicacion.text,
                          _controllerDescrip.text,
                          _controllerCompa.text);
                      if (mounted) {
                        if (response == StatusResponse.Successfully) {
                          setState(() {
                            loading = false;
                          });
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Error al agregar producto")));
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("llena todo los campos")));
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  child: CustomButtonAdd(size: size, loading: loading),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonAdd extends StatelessWidget {
  const CustomButtonAdd({
    Key? key,
    required this.size,
    required this.loading,
  }) : super(key: key);

  final Size size;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.07,
      decoration: BoxDecoration(
          color: Colors.orange,
          gradient: LinearGradient(
              colors: [Colors.orange, Colors.orange[200]!]),
          borderRadius: BorderRadius.circular(9)),
      child: Center(
          child: loading
              ? Transform.scale(
                  scale: 0.8,
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.orange,
                  ),
                )
              : const Text(
                  "Agregar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
    );
  }
}

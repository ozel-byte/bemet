import 'dart:convert';
import 'dart:io';

import 'package:bemet/model/Consumibles.dart';
import 'package:bemet/model/Medico.dart';
import 'package:bemet/model/User.dart';
import 'package:http/http.dart' as http;

enum StatusResponse { Successfully, Error, ErrorCredencial }

class BemetService {
  String addressIp = "192.168.0.13:3000";

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.http(addressIp, "/login",
        {'username': username.trim(), 'password': password.trim()});
    final respose = await http.get(url);
    if (respose.statusCode == 200) {
      final responseJson = jsonDecode(respose.body);
      print(responseJson);
      if (responseJson["status"] == "true") {
        return {
          "status": StatusResponse.Successfully,
          "user": User(name: responseJson["status"], rol: responseJson["rol"])
        };
      } else {
        return {
          "status": StatusResponse.ErrorCredencial,
          "message": "Incorrect Credencial, you try again"
        };
      }
    } else {
      return {"status": StatusResponse.Error, "message": "Error do request"};
    }
  }

  Future<List<String>> search(query) async {
    final url = Uri.http(addressIp, "/search-consumible", {"query": query});
    List<String> consumibles = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responsJsonList = jsonDecode(response.body);
      for (var insumo in responsJsonList["data"]) {
        consumibles.add(insumo);
      }
      return consumibles;
    } else {
      return [];
    }
  }

  Future<List<Medico>> searchMedical(query) async {
    final url = Uri.http(addressIp, "/search-medical", {"query": query});
    List<Medico> medicals = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responsJsonList = jsonDecode(response.body);

      for (var medico in responsJsonList["data"]) {
        print(medico);
        medicals.add(Medico(
            name: medico["name"],
            piezas: medico["piezas"],
            referencia: medico["referencia"],
            marca: medico["marca"],
            img: medico["img"]));
      }
      return medicals;
    } else {
      return [];
    }
  }

  Future<List<Consumible>> getConsumibles() async {
    final url = Uri.http(addressIp, "/consumibles");
    List<Consumible> consumibles = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responsJsonList = jsonDecode(response.body);
      for (var insumo in responsJsonList["data"]) {
        consumibles.add(Consumible(
            compatibleCon: insumo["compatible-con"],
            descripcion: insumo["descripcion"],
            marca: insumo["marca"],
            name: insumo["name"],
            piezas: insumo["piezas"],
            referencia: insumo["referencia"],
            ubicacion: insumo["ubicacion"]));
      }
      return consumibles;
    } else {
      return [];
    }
  }

  Future<List<Medico>> getMedicos() async {
    final url = Uri.http(addressIp, "/equipo-medico");
    List<Medico> medicos = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responsJsonList = jsonDecode(response.body);
      for (var medico in responsJsonList["data"]) {
        medicos.add(Medico(
            name: medico["name"],
            piezas: medico["piezas"],
            referencia: medico["referencia"],
            marca: medico["marca"],
            img: medico["img"]));
      }
      return medicos;
    }
    return [];
  }

  Future<StatusResponse> addMedical(String nombre, String marca, String piezas,
      String referencia, File img) async {
    final url = Uri.http(addressIp, "/add-equipo-medico");
    print(nombre);
    Map<String, dynamic> medical = {
      "nombre": nombre.trim(),
      "marca": marca.trim(),
      "piezas": piezas.trim(),
      "referencia": referencia.trim()
    };
    final response = http.MultipartRequest("POST", url)
      ..fields["nombre"] = nombre.trim()
      ..fields["marca"] = marca.trim()
      ..fields["piezas"] = piezas.trim()
      ..fields["referencia"] = referencia.trim()
      ..files.add(http.MultipartFile.fromBytes("img", img.readAsBytesSync(),
          filename: img.path));

    final res = await response.send();

    if (res.statusCode == 200) {
      return StatusResponse.Successfully;
    } else {
      return StatusResponse.Error;
    }
  }

  Future<StatusResponse> addInsumo(
      String nombre,
      String marca,
      String piezas,
      String referencia,
      String ubicacion,
      String descripcion,
      String compatible) async {
    final url = Uri.http(addressIp, "/add-consumibles");
    print(nombre);
    Map<String, dynamic> medical = {
      "nombre": nombre.trim(),
      "marca": marca.trim(),
      "piezas": piezas.trim(),
      "ref": referencia.trim(),
      "ubicacion": ubicacion.trim(),
      "descripcion": descripcion.trim(),
      "compatible": compatible.trim()
    };
    final response = await http.post(url,
        body: jsonEncode(medical),
        headers: {'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      print(responseJson);
      if (responseJson["status"] == "true") {
        return StatusResponse.Successfully;
      } else {
        return StatusResponse.Error;
      }
    } else {
      return StatusResponse.Error;
    }
  }
}

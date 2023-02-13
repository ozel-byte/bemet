import 'dart:async';

import 'package:bemet/model/Medico.dart';
import 'package:bemet/service/bemetService.dart';

class SearchStream {


  List<Medico> medicals = [];

  final StreamController<List<Medico>> _streamController = StreamController();

 Stream<List<Medico>> get getStream => _streamController.stream;

  List<Medico> get listMedicals => medicals;

  addQueryResult(query) async {
    List<Medico> response = await BemetService().searchMedical(query);
    _streamController.sink.add(response);
  }
}

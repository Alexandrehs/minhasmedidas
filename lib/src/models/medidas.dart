import 'package:flutter/material.dart';
import 'package:minhasmedidas/src/models/medida.dart';

class Medidas extends ChangeNotifier {
  final List<Medida> _medidas = [];

  List<Medida> get listaMedidas => _medidas;

  adicionar(Medida medida) {
    _medidas.add(medida);
    notifyListeners();
  }
}

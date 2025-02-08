import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutenticacaoController with ChangeNotifier {
  bool _carregando = false;

  bool get carregando => _carregando;

  Future<bool> acessar(String email, String senha) async {
    _carregando = true;

    notifyListeners();

    final resposta = await http.post(
      //Uri.parse('http://pbookmenowapi.test/api/login'), URL API para autenticação
      Uri.parse(
          'http://10.56.46.46/pbookmenowapi.test/api/login'), // URL API para autenticação
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json', // Adicionado
      },
      body: jsonEncode({
        'email': email,
        'password': senha,
      }),
    );

    _carregando = false;

    notifyListeners();

    if (resposta == 200) {
      return true;
    } else {
      return false;
    }
  }
}

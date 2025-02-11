import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutenticacaoController with ChangeNotifier {
  bool _carregando =
      false; // Variável para indicar se a autenticação está em andamento

  bool get carregando =>
      _carregando; // Getter para acessar o estado de carregamento

  Future<bool> acessar(String email, String senha) async {
    _carregando = true;
    notifyListeners(); // Notifica os ouvintes sobre a mudança de estado

    try {
      // Envia a requisição POST com o corpo em formato JSON
      final resposta = await http.post(
        Uri.parse(
            'http://10.56.46.46/projetobookmenowapi/public/api/login'), // URL da API para autenticação
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json', // Adicionado
        },
        body: jsonEncode({
          'email': email,
          'password': senha,
        }),
      );

      _carregando = false;
      notifyListeners(); // Notifica os ouvintes após a resposta da API

      if (resposta.statusCode == 200) {
        return true; // Retorna verdadeiro se a autenticação for bem-sucedida
      } else {
        // Em caso de falha, exibe o código de status ou uma mensagem de erro
        print('Erro na autenticação: ${resposta.statusCode}');
        print('Corpo: ${resposta.body}');
        return false; // Retorna falso em caso de falha
      }
    } catch (e) {
      _carregando = false;
      notifyListeners(); // Notifica os ouvintes em caso de exceção

      // Em caso de erro na requisição, exibe o erro
      print('Erro de conexão ou na requisição: $e');
      return false; // Retorna falso em caso de falha
    }
  }
}

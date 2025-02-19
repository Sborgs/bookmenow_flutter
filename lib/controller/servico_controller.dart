import 'dart:convert';

import 'package:bookmenow_flutter/controller/autenticacao_controller.dart';
import 'package:bookmenow_flutter/model/servico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ServicoController {
  Future<List<Servico>> buscarServicos(BuildContext context) async {
    final autenticacao =
        Provider.of<AutenticacaoController>(context, listen: false);
    String? token = autenticacao.token;

    final resposta = await http.get(
      Uri.parse('http://10.56.46.46/projetobookmenowapi/public/api/login'),
      headers: {
        'authorization': 'Bearer $token',
        'Accept': 'Application/jason'
      },
    );

    if (resposta.statusCode == 200) {
      List<dynamic> dados = jsonDecode(resposta.body);
      return dados.map((json) => Servico.fromJson(json)).toList();
    } else {
      print("Erro ao buscar os serviços: ${resposta.statusCode}");
      return [];
    }
  }
}

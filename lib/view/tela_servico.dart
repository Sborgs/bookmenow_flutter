import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoEstado createState() => _TelaServicoEstado();
}

class _TelaServicoEstado extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serviços"),
      ),
      body: const Center(
        child: Text("Bem vindo a tela de Serviço"),
      ),
    );
  }
}

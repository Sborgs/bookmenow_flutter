import 'package:bookmenow_flutter/controller/autenticacao_controller.dart';
import 'package:bookmenow_flutter/view/tela_servico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  _TelaLoginEstado createState() => _TelaLoginEstado();
}

class _TelaLoginEstado extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final autenticacaoController = Provider.of<AutenticacaoController>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _chaveFormulario,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (valor) =>
                    valor!.isEmpty ? "Informe um e-mail válido" : null,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (valor) =>
                    valor!.isEmpty ? "Informe um e-mail válido" : null,
              ),
              const SizedBox(height: 20),
              autenticacaoController.carregando
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        // print("Botão Clicado");
                        if (_chaveFormulario.currentState!.validate()) {
                          bool sucesso = await autenticacaoController.acessar(
                              _emailController.text, _senhaController.text);

                          if (sucesso) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaServico()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("E-mail ou senha inválido")),
                            );
                          }
                        }
                      },
                      child: const Text('Entrar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

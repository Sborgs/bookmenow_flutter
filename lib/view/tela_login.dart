import 'package:bookmenow_flutter/controller/autenticacao_controller.dart';
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

  @override
  Widget build(BuildContext context) {

    final autenticacaoController = Provider.of<AutenticacaoController>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,                
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,                
              ),
              autenticacaoController.carregando?CircularProgressIndicator()
              :ElevatedButton(
                onPressed: () async {
                  // print("Botão Clicado");
                  bool sucesso = await autenticacaoController.acessar(
                    _emailController.text, _senhaController.text);

                  if( sucesso ) 
                    print("conectado");
                  else
                    print("erro no e-mail ou senha");

                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

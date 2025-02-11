import 'package:bookmenow_flutter/controller/autenticacao_controller.dart';
import 'package:bookmenow_flutter/view/tela_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AutenticacaoController()),
      ],
      child: MainApp(),
    ),    
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaLogin(),
    );
  }
}

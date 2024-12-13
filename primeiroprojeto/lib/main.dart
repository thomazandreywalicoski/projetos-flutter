import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste do APP',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();

  double _resultado = 0.0;

  String _texto = "Email digitado";
  String _senha = "Senha digitada";

  String _numero1 = "Número 1";
  String _numero2 = "Número 2";

  _atualizarEmail() {
    double valor = double.parse(_emailController.text);
    int valorInt = int.parse(_emailController.text);

    setState(() {
      if(_emailController.text.length < 5) {
        _texto = "Email Inválido";
      } else {
         _texto = "Email: ${_emailController.text}";
      }
    });
  }

  _atualizarSenha() {
    setState(() {
      if(_senhaController.text.length < 4) {
        _senha = "A senha deve conter no min 4 digitos";
      } else {
         _senha = "Senha: ${_senhaController.text}";
      }
    });
  }

  _exibirResultado() {
    double numero1 = double.parse(_num1Controller.text);
    double numero2 = double.parse(_num2Controller.text);
    setState(() {
      _resultado = numero1 + numero2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Fazer Login",
              style: TextStyle(color: Colors.blue,
              fontSize: 42.0
              ),
            ),
            Icon(
              Icons.person_2,
              color: Colors.greenAccent,
              size: 65.0,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Digite seu email',
                hintStyle: TextStyle(
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 24,
                ),
                hoverColor: Colors.orange,
              ),
            ),
            TextField(
              controller: _senhaController,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Digite sua senha',
                hintStyle: TextStyle(
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 24,
                ),
                hoverColor: Colors.orange,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                _atualizarEmail();
                _atualizarSenha();
                //print(_emailController.text);
                //print(_senhaController.text);
              },
              child: Text(
                "Entrar", 
                style: TextStyle(
                color: Colors.green,
                fontSize: 22,
                ),
              ),
            ),
            Text(
              _texto,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
            Text(
              _senha,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Número 1",
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 24,
                ),
                hoverColor: Colors.orange,
              ),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Número 2",
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 24,
                ),
                hoverColor: Colors.orange,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                _exibirResultado();
              },
              child: Text(
                "Somar", 
                style: TextStyle(
                color: Colors.green,
                fontSize: 22,
                ),
              ),
            ),
            Text(
              _resultado.toString(),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

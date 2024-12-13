import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
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
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();

  String _pesoDigitado = "";
  String _alturaDigitada = "";

  double _imc = 0.0;
  String _diagnostico = "";

   _calcularImc() {
    double peso = double.parse(_pesoController.text);
    double altura = double.parse(_alturaController.text);
    setState(() {

      if(altura > 2.50) {
        altura = altura / 100;

        _imc = peso / (altura * 2);
      } else {
        _imc = peso / (altura * 2);
      }

      if(_imc < 18.5) {
        _diagnostico = "Abaixo do peso";
      } else if(_imc > 18.5 && _imc < 24.9) {
        _diagnostico = "Peso normal";
      } else if(_imc > 25.0 && _imc < 29.9) {
        _diagnostico = "Excesso de peso";
      } else if(_imc > 30.0 && _imc < 34.9) {
        _diagnostico = "Obesidade classe I";
      } else if(_imc > 35.0 && _imc < 39.9) {
        _diagnostico = "Obesidade classe II";
      } else if(_imc >= 40.0) {
        _diagnostico = "Obesidade classe III";
      }
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 22, 22),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.calculate,
                color: const Color(0xFF00FF04),
                size: 65.0,
              ),
              const Text(
                "CALCULADORA IMC",
                style: TextStyle(color: Color.fromARGB(255, 60, 255, 0),
                fontSize: 38.0,
                fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 50.0),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 0, 255, 0),
                ),
                decoration: const InputDecoration(
                  labelText: "PESO: ",  
                  labelStyle: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 255, 4),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 0, 255, 17),
                ),
                decoration: const InputDecoration(
                  labelText: "ALTURA: ",
                  labelStyle: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 34, 255, 0),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: (){
                  _calcularImc();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0), // Adiciona padding ao redor do texto
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 0, 102, 255),
                ), // Define a cor do texto
                child: Text(
                  "CALCULAR", 
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "IMC: ${_imc.toStringAsFixed(2)}",
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                _diagnostico.toString(),
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 255, 8),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

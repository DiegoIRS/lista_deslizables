import 'package:flutter/material.dart';
import 'package:lista_deslizables/pages/inicio.dart';

void main() {
  // Define los datos del estudiante aquí
  Map<String, dynamic> estudianteData = {
    'nombre': 'Diego Rojas  Santander',
    'correo': 'Diego.Rojas@example.cl',
  };

  // Pasa los datos del estudiante al widget MyApp
  runApp(MyApp(estudianteData: estudianteData));
}

class MyApp extends StatelessWidget {
  // Acepta los datos del estudiante como un parámetro
  final Map<String, dynamic> estudianteData;

  MyApp({Key? key, required this.estudianteData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Pasa los datos del estudiante a HomeWidget
      home: HomeWidget(estudianteData: estudianteData),
    );
  }
}

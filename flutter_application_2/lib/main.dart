import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'inicio.dart';

// Método main: Punto de entrada principal para la aplicación Flutter.
// Aquí se ejecuta la aplicación llamando al método runApp() con una instancia de MyApp.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Clase MyApp: Representa la aplicación Flutter.
// Esta clase es un StatelessWidget, lo que significa que su contenido no cambia durante el ciclo de vida de la aplicación.
class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          // Oculta la bandera de modo de depuración en la esquina superior derecha
          false,
      home:
          // Establece la página principal de la aplicación como Inicio
          Inicio(),
    );
  }
}

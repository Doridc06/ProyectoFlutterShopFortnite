import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para widgets y herramientas de Material Design.
import '/drawer.dart'; // Importa el archivo 'drawer.dart'
import '/tienda.dart';
import 'firebase_service.dart'; // Importa el archivo 'tienda.dart'

class Inicio extends StatelessWidget {
  // Define la clase Inicio que representa la pantalla de inicio de la aplicación.
  const Inicio({Key? key})
      : super(key: key); // Constructor Inicio con una clave opcional.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Tienda de Fortnite'),
          ),
        ),
        drawer: const MenuLateral(),
        body: Container(
          color: const Color.fromARGB(255, 241, 154, 184),
          padding: const EdgeInsets.all(16.0),
          child: const Center(
            child: Text(
              '¡Bienvenidos a la tienda de Fortnite donde podrás ver todos los cosméticos día a día!',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 255, 253, 255),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tienda()),
                );
              },
              child: const Icon(Icons.local_mall),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddComentarioBbdd()),
                );
              },
              child: const Icon(
                  Icons.comment), // Nuevo icono para agregar comentarios
            ),
          ],
        ),
      ),
    );
  }
}

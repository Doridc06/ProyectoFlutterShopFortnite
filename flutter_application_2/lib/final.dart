import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para widgets y herramientas de Material Design.

// Clase pantallaFinal: Representa la pantalla de cierre de sesión.
// ignore: camel_case_types
class pantallaFinal extends StatelessWidget {
  // Define la clase pantallaFinal que representa la pantalla de cierre de sesión. Extiende StatelessWidget.
  const pantallaFinal({super.key}); // Constructor de la clase pantallaFinal.

  @override
  Widget build(BuildContext context) {
    // Método build(), necesario en cualquier widget Flutter. Retorna un árbol de widgets que definen la interfaz de usuario de la pantalla.
    return Scaffold(
      // Retorna un Scaffold, un layout de alto nivel de Material Design que implementa las estructuras básicas de diseño visual de la aplicación.
      appBar: AppBar(
        // Define una AppBar que es la barra de aplicaciones en la parte superior de la pantalla.
        title: const Text('Cerrando sesión..'), // Título de la AppBar.
      ),
      body: Container(
        // Define el cuerpo de la pantalla como un contenedor con un color de fondo y contenido centrado.
        decoration: const BoxDecoration(
          // Establece la decoración del contenedor con un color de fondo.
          color: Color.fromARGB(255, 241, 154, 184), // Fondo rosa
        ),
        child: const Center(
          // Centra el contenido del contenedor.
          child: Column(
            // Define una columna de widgets.
            mainAxisAlignment: MainAxisAlignment
                .center, // Alinea los widgets al centro de la columna.
            children: [
              // Lista de widgets hijos dentro de la columna.
              Icon(
                // Widget de icono.
                Icons.thumb_up, // Ícono de pulgar hacia arriba.
                size: 100, // Tamaño del ícono.
                color: Color.fromARGB(255, 247, 251, 255), // Color del ícono.
              ),
              SizedBox(height: 20), // Espacio vertical entre los widgets.
              Text(
                // Widget de texto.
                '¡Gracias por visitar nuestra tienda!', // Texto de agradecimiento.
                style: TextStyle(
                    fontSize: 22, color: Colors.white), // Estilo del texto.
              ),
              Text(
                // Widget de texto.
                'Autor: Doriana Da Costa', // Nombre del autor.
                style: TextStyle(
                    fontSize: 22, color: Colors.white), // Estilo del texto.
              ),
            ],
          ),
        ),
      ),
    );
  }
}

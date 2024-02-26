import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para widgets y herramientas de Material Design.

// Clase MenuLateral: Representa el menú lateral de la aplicación.
// Este menú se utiliza para mostrar opciones de navegación o acciones adicionales.
class MenuLateral extends StatelessWidget {
  // Constructor de la clase MenuLateral.
  // ignore: use_key_in_widget_constructors
  const MenuLateral({Key? key});

  @override
  Widget build(BuildContext context) {
    // Método build(), necesario en cualquier widget Flutter. Retorna un árbol de widgets que definen la interfaz de usuario del menú lateral.
    return Drawer(
      // Retorna un Drawer, que es un panel deslizable utilizado típicamente para mostrar opciones de navegación.
      child: ListView(
        // Retorna un ListView, que es un widget que muestra una lista de hijos en forma de desplazamiento.
        children: <Widget>[
          // Encabezado del usuario con imagen de fondo
          UserAccountsDrawerHeader(
            // Encabezado que muestra la información del usuario.
            accountName: Padding(
              // Widget de relleno para el nombre de la cuenta del usuario.
              padding: const EdgeInsets.only(
                  bottom:
                      4.0), // Establece el relleno inferior del nombre de la cuenta.
              child: Text(
                // Widget de texto para el nombre de la cuenta del usuario.
                "DorianaDc", // Nombre de la cuenta del usuario.
                style: TextStyle(
                  // Estilo del texto del nombre de la cuenta del usuario.
                  fontWeight: FontWeight.bold, // Establece la negrita.
                  fontSize: 14, // Establece el tamaño de la fuente.
                  shadows: [
                    // Sombreado del texto.
                    Shadow(
                      // Sombra del texto.
                      blurRadius: 2.0, // Radio de desenfoque de la sombra.
                      color: Colors.black
                          .withOpacity(0.5), // Color de la sombra con opacidad.
                      offset: const Offset(
                          1.0, 1.0), // Desplazamiento de la sombra.
                    ),
                  ],
                ),
              ),
            ),
            accountEmail: Padding(
              // Widget de relleno para el correo electrónico del usuario.
              padding: const EdgeInsets.only(
                  top:
                      4.0), // Establece el relleno superior del correo electrónico.
              child: Text(
                // Widget de texto para el correo electrónico del usuario.
                "doridacosta96@gmail.com", // Correo electrónico del usuario.
                style: TextStyle(
                  // Estilo del texto del correo electrónico del usuario.
                  fontWeight: FontWeight.bold, // Establece la negrita.
                  fontSize: 14, // Establece el tamaño de la fuente.
                  shadows: [
                    // Sombreado del texto.
                    Shadow(
                      // Sombra del texto.
                      blurRadius: 2.0, // Radio de desenfoque de la sombra.
                      color: Colors.black
                          .withOpacity(0.5), // Color de la sombra con opacidad.
                      offset: const Offset(
                          1.0, 1.0), // Desplazamiento de la sombra.
                    ),
                  ],
                ),
              ),
            ),
            decoration: const BoxDecoration(
              // Decoración del encabezado del usuario.
              image: DecorationImage(
                // Establece una imagen de fondo para el encabezado.
                image: AssetImage(
                    "assets/images/fortnite.jpg"), // Ruta de la imagen de fondo.
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del encabezado.
              ),
            ),
          ),
          // Elemento de lista con fondo de tinta (Ink) para la clase inicial
          Ink(
            // Widget de tinta que se expande para llenar su contenedor.
            color: const Color.fromARGB(
                255, 181, 63, 148), // Color de fondo de tinta.
            child: const ListTile(
              // Widget de elemento de lista.
              title: Text(
                // Widget de texto para el título del elemento de lista.
                "Tienda de Fortnite", // Título del elemento de lista.
                style: TextStyle(
                    color: Colors
                        .white), // Establece el color del texto del título.
              ),
            ),
          ),
        ],
      ),
    );
  }
}

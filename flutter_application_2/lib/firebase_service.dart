import 'package:flutter/material.dart'; // Importa el paquete flutter material
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa el paquete de Firestore de Firebase

class MyApp extends StatelessWidget {
  // Declara una clase MyApp que extiende StatelessWidget
  const MyApp({Key? key}) : super(key: key); // Constructor de la clase MyApp

  // Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Devuelve un MaterialApp
      title: 'Comentarios App', // Título de la aplicación
      home: AddComentarioBbdd(),
    );
  }
}

// Declara una clase AddComentarioBbdd que extiende StatelessWidget
class AddComentarioBbdd extends StatelessWidget {
  const AddComentarioBbdd({Key? key})
      : super(key: key); // Constructor de la clase AddComentarioBbdd

// Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Devuelve un Scaffold
      appBar: AppBar(
        // Barra de la aplicación
        title: const Text(
            'Deja tu comentario'), // Título de la barra de la aplicación
      ),
      body: Container(
        // Contenedor para el cuerpo de la aplicación
        color: const Color.fromARGB(255, 241, 154, 184),
        child: CommentForm(), // Widget del formulario de comentarios
      ),
    );
  }
}

// Declara una clase CommentForm que extiende StatefulWidget
// ignore: use_key_in_widget_constructors
class CommentForm extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CommentFormState createState() =>
      _CommentFormState(); // Crea el estado del formulario de comentarios
}

// Declara la clase de estado para el formulario de comentarios
class _CommentFormState extends State<CommentForm> {
  final TextEditingController _commentController =
      TextEditingController(); // Controlador para el campo de texto de comentarios

// Método para enviar un comentario
  void _submitComment(BuildContext context) {
    String comment = _commentController.text;
    // ignore: avoid_print
    print('Nuevo comentario: $comment');
    guardarComentario(comment);
    _commentController.clear();

    // Muestra un diálogo emergente para indicar que el comentario se agregó correctamente
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Comentario agregado correctamente'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

// Método para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Devuelve un widget de relleno
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // Contenedor para el campo de texto de comentarios
            color: Colors.white,
            child: TextField(
              controller:
                  _commentController, // Controlador para el campo de texto
              decoration: const InputDecoration(
                hintText: 'Escribe tu comentario aquí',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _submitComment(context),
            child: const Text('Enviar comentario'),
          ),
        ],
      ),
    );
  }
}

// Función para guardar un comentario en Firestore
void guardarComentario(String comentario) {
  FirebaseFirestore.instance.collection('comentarios').add({
    // Agrega un comentario a la colección 'comentarios'
    'comentario': comentario, // Texto del comentario
    'fecha': DateTime.now(),
  }).then((value) {
    // ignore: avoid_print
    print('Comentario guardado correctamente');
  }).catchError((error) {
    // ignore: avoid_print
    print('Error al guardar el comentario: $error');
  });
}

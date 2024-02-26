import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para widgets y herramientas de Material Design.
import 'package:http/http.dart'
    as http; // Importa la biblioteca http para realizar solicitudes HTTP.
import 'dart:convert';

import 'final.dart'; // Importa la biblioteca para codificar y decodificar datos JSON.
// Importa el archivo final.dart que contiene la pantalla de cierre de sesión.

// Clase RarityData: Representa la rareza de los artículos en la tienda.
class RarityData {
  final String value; // Valor de la rareza.
  final String displayValue; // Valor de visualización de la rareza.
  final String backendValue; // Valor de fondo de la rareza.
  final String color; // Color asociado a la rareza.

// Constructor de la clase RarityData.
  RarityData({
    required this.value,
    required this.displayValue,
    required this.backendValue,
    required this.color,
  });
}

class FortniteShopItem {
  final String backgroundImage; // Imagen de fondo del artículo.
  final String name; // Nombre del artículo.
  final int finalPrice; // Precio final del artículo.
  final String vbuckIcon; // Icono de V-Bucks.
  final String rarity; // Rareza del artículo.
  final String packImage; // Imagen del paquete del artículo.
  final String id; // Identificador del artículo.

  // Constructor de la clase FortniteShopItem.
  FortniteShopItem({
    required this.backgroundImage,
    required this.name,
    required this.finalPrice,
    required this.vbuckIcon,
    required this.rarity,
    required this.packImage,
    required this.id,
  });

  // Método factory para crear un objeto FortniteShopItem a partir de JSON.
  factory FortniteShopItem.fromJson(Map<String, dynamic> json) {
    final backgroundImage = json['items'][0]['images']?['icon'] ?? '';
    final name = json['items'][0]['name'] ?? '';
    final finalPrice =
        json['finalPrice'] != null ? json['finalPrice'] ~/ 100 : 0;
    final vbuckIcon = (json['finalPrice'] ?? 0) < (json['regularPrice'] ?? 0)
        ? "https://fortnite-api.com/images/vbuck.png"
        : "";
    final rarity = json['items'][0]['rarity']?['value'] ?? '';
    final packImage = json['bundle']?['image'] ??
        ''; // Obtener la imagen del paquete si está disponible.

    return FortniteShopItem(
      backgroundImage: backgroundImage,
      name: name,
      finalPrice: finalPrice,
      vbuckIcon: vbuckIcon,
      rarity: rarity,
      packImage: packImage,
      id: '',
    );
  }

  // Método para convertir el objeto FortniteShopItem a un mapa.
  Map<String, dynamic> toMap() {
    return {
      'backgroundImage': backgroundImage,
      'name': name,
      'finalPrice': finalPrice,
      'vbuckIcon': vbuckIcon,
      'rarity': rarity,
      'packImage': packImage,
      'id': id,
    };
  }
}

// Clase Tienda: Representa la pantalla principal de la aplicación.
class Tienda extends StatelessWidget {
  const Tienda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fortnite Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fortnite Shop'), // Título de la AppBar.
          leading: IconButton(
            // Botón de retroceso en la AppBar.
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navega de regreso a la pantalla anterior.
            },
          ),
          actions: [
            // Acciones en la AppBar.
            IconButton(
              // Botón de salida que lleva a la pantalla de cierre de sesión.
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const pantallaFinal()), // Navega a la pantalla de cierre de sesión.
                );
              },
            ),
          ],
        ),
        body:
            const MyHomePage(), // Cuerpo de la pantalla que muestra los artículos de la tienda.
      ),
    );
  }
}

// Clase MyHomePage: Representa el cuerpo de la tienda.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<FortniteShopItem> _shopItems; // Lista de artículos de la tienda.
  late List<RarityData> _rarities; // Lista de rarezas de los artículos.

  @override
  void initState() {
    super.initState();
    _shopItems = []; // Inicializa la lista de artículos.
    _rarities = [
      // Inicializa la lista de rarezas con diferentes valores y colores.
      RarityData(
        value: 'icon',
        displayValue: 'Serie de ídolos',
        backendValue: 'EFortRarity::Epic',
        color: 'turquoise',
      ),
      RarityData(
        value: 'dark',
        displayValue: 'SERIE OSCURA',
        backendValue: 'EFortRarity::Epic',
        color: 'dark purple',
      ),
      RarityData(
        value: 'legendary',
        displayValue: 'Legendario',
        backendValue: 'EFortRarity::Legendary',
        color: 'orange',
      ),
      RarityData(
        value: 'epic',
        displayValue: 'Épico',
        backendValue: 'EFortRarity::Epic',
        color: 'purple',
      ),
      RarityData(
        value: 'rare',
        displayValue: 'Raro',
        backendValue: 'EFortRarity::Rare',
        color: 'blue',
      ),
      RarityData(
        value: 'uncommon',
        displayValue: 'Poco común',
        backendValue: 'EFortRarity::Uncommon',
        color: 'green',
      ),
    ];
    _fetchFortniteShopItems(); // Realiza una solicitud HTTP para obtener los datos de la tienda.
  }

  // Método para obtener los datos de la tienda mediante una solicitud HTTP.
  Future<void> _fetchFortniteShopItems() async {
    final response = await http.get(
        Uri.parse('https://fortnite-api.com/v2/shop/br/combined?language=es'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final items = jsonData['data']['featured']['entries'] as List<dynamic>;

      setState(() {
        _shopItems = items.map((item) {
          return FortniteShopItem.fromJson(item);
        }).toList();
      });
    }
  }

// Métodos para obtener el color de fondo y el color del borde según la rareza del artículo.
  Color _getBackgroundColor(String rarity) {
    final rarityData = _rarities.firstWhere(
      (r) => r.value == rarity,
      orElse: () => RarityData(
        value: '',
        displayValue: '',
        backendValue: '',
        color: '',
      ),
    );
    return _getColorFromName(rarityData.color);
  }

  Color _getBorderColor(String rarity) {
    final rarityData = _rarities.firstWhere(
      (r) => r.value == rarity,
      orElse: () => RarityData(
        value: '',
        displayValue: '',
        backendValue: '',
        color: '',
      ),
    );
    return _getColorFromName(rarityData.color);
  }

// Método para obtener un color a partir de un nombre.
  Color _getColorFromName(String name) {
    switch (name.toLowerCase()) {
      case 'blue':
        return Colors.blue;
      case 'purple':
        return const Color.fromARGB(255, 202, 45, 230);
      case 'orange':
        return Colors.orange;
      case 'green':
        return Colors.green;
      case 'turquoise':
        return const Color.fromARGB(255, 106, 236, 223);
      case 'dark purple':
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _shopItems.length,
        itemBuilder: (context, index) {
          final shopItem = _shopItems[index];
          return Card(
            elevation: 4.0,
            color: _getBackgroundColor(shopItem
                .rarity), // Color de fondo de la tarjeta según la rareza del artículo.
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: _getBorderColor(shopItem
                    .rarity), // Color de fondo de la tarjeta según la rareza del artículo.
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: InkWell(
              onTap: () {}, // Acción al tocar la tarjeta (aún no implementada)
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: shopItem.packImage
                                .isNotEmpty // Si hay una imagen del paquete, muestra esa imagen, de lo contrario muestra la imagen de fondo del artículo.
                            ? Image.network(
                                shopItem.packImage,
                                height: 130,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                shopItem.backgroundImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        color: Colors.black.withOpacity(0.10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shopItem.name,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Text(
                                  '${shopItem.finalPrice.toString()}00',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 2.0,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Image.network(
                                  "https://fortnite-api.com/images/vbuck.png",
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Método main: Punto de entrada principal para la aplicación
// Aquí se ejecuta la aplicación llamando al widget Tienda.
void main() {
  runApp(const Tienda());
}

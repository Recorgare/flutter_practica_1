import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 121, 235, 35)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter practica 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < 20) {
        _counter++;
        if (_counter == 20) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('El valor máximo es hasta 20')),
          );
        }
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se permiten numeros negativos')),
        );
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomeContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Rey Ivan Cortez García',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),
        Text(
          'Contador: $_counter',
          style: const TextStyle(fontSize: 26),
        ),
      ],
    );
  }

  Widget _buildCardsPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Hamburguesa\n\n“En Burger King, Tú MANDAS. Disfruta nuestra Whopper con el nuevo jingle ‘Whopper Whopper’… ¡Porque lo real sabe mejor!”',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Image.asset(
              'lib/assets/images/burger.jpeg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridPage() {
    List<String> localImages = [
      'lib/assets/images/tacos.jpeg',
      'lib/assets/images/burger.jpeg',
      'lib/assets/images/ensalada.jpeg',
      'lib/assets/images/enchiladas.jpg',
      'lib/assets/images/pescado.jpeg',
      'lib/assets/images/pozole.jpeg',
    ];

    List<String> descriptions = [
      'Deliciosos tacos al pastor con piña',
      'Hamburguesa con doble carne y queso',
      'Ensalada fresca de verduras y aderezo',
      'Enchiladas verdes con crema y queso',
      'Filete de pescado empanizado',
      'Tradicional pozole mexicano',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: localImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(localImages[index]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        descriptions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Image.asset(localImages[index], fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildListaPage() {
    List<Map<String, dynamic>> platillos = [
      {
        "nombre": "Tacos al Pastor",
        "costo": 50,
        "tamano": "Mediano",
        "imagen": "lib/assets/images/tacos.jpeg"
      },
      {
        "nombre": "Hamburguesa",
        "costo": 80,
        "tamano": "Grande",
        "imagen": "lib/assets/images/burger.jpeg"
      },
      {
        "nombre": "Ensalada César",
        "costo": 60,
        "tamano": "Pequeño",
        "imagen": "lib/assets/images/ensalada.jpeg"
      },
      {
        "nombre": "Enchiladas",
        "costo": 40,
        "tamano": "Grande",
        "imagen": "lib/assets/images/enchiladas.jpg"
      },
      {
        "nombre": "Pescado",
        "costo": 30,
        "tamano": "Pequeño",
        "imagen": "lib/assets/images/pescado.jpeg"
      },
      {
        "nombre": "Pozole",
        "costo": 120,
        "tamano": "Grande",
        "imagen": "lib/assets/images/pozole.jpeg"
      },
      {
        "nombre": "Burrito",
        "costo": 70,
        "tamano": "Grande",
        "imagen": "lib/assets/images/burrito.jpg"
      },
      {
        "nombre": "Sushi",
        "costo": 100,
        "tamano": "Pequeño",
        "imagen": "lib/assets/images/sushi.jpeg"
      },
      {
        "nombre": "Alitas",
        "costo": 90,
        "tamano": "Mediano",
        "imagen": "lib/assets/images/alitas.jpeg"
      },
      {
        "nombre": "Sopes",
        "costo": 55,
        "tamano": "Pequeño",
        "imagen": "lib/assets/images/sopes.jpg"
      },
      {
        "nombre": "Tamales",
        "costo": 35,
        "tamano": "Pequeño",
        "imagen": "lib/assets/images/tamales.jpeg"
      },
      {
        "nombre": "Chiles Rellenos",
        "costo": 65,
        "tamano": "Mediano",
        "imagen": "lib/assets/images/chiles.jpeg"
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: platillos.length,
      itemBuilder: (context, index) {
        final item = platillos[index];
        return ListTile(
          leading: Image.asset(
            item['imagen'],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(item['nombre']),
          subtitle:
              Text('Costo: \$${item['costo']} - Tamaño: ${item['tamano']}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentContent;

    switch (_selectedIndex) {
      case 0:
        currentContent = _buildHomeContent();
        break;
      case 1:
        currentContent = _buildCardsPage();
        break;
      case 2:
        currentContent = _buildGridPage();
        break;
      case 3:
        currentContent = _buildListaPage();
        break;
      default:
        currentContent = const Center(child: Text('Otra página'));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 255, 158),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Información del App')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 12, 255, 158)),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Abriste tu perfil')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Abriste configuración')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cerrando sesión')),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(child: currentContent),
      floatingActionButton: _selectedIndex == 0
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "increment",
                  onPressed: _incrementCounter,
                  tooltip: 'Incrementar',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "decrement",
                  onPressed: _decrementCounter,
                  tooltip: 'Decrementar',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "reset",
                  onPressed: _resetCounter,
                  tooltip: 'Reiniciar',
                  child: const Icon(Icons.refresh),
                ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Card'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Grid'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Lista'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

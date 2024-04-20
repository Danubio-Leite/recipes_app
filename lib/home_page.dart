import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaAtual = 0;
  final List<Widget> _paginas = [
    const Text('Página 1'),
    const Text('Página 2'),
    const Text('Página 3'),
    const Text('Página 4'),
    const Text('Página 5'),
  ];

  void _mudarPagina(int index) {
    setState(() {
      _paginaAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: _paginas[_paginaAtual]),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.deepPurple,
          unselectedItemColor: Colors.red,
          currentIndex: _paginaAtual,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Receitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Meal of the day',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Loja',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Minhas Receitas',
            ),
          ],
          onTap: _mudarPagina,
        ),
      ),
    );
  }
}

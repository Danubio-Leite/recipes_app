import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _paginaAtual = 2;

  void _mudarPagina(int index) {
    setState(() {
      _paginaAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _paginas = [
      const Text('Receitas'),
      const Text('Receitas Favoritas'),
      const HomePage(),
      const Text('Loja Virtual'),
      const Text('Menu'),
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: ClipRRect(
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          )),
      backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
      body: Center(child: _paginas[_paginaAtual]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(236, 236, 236, 1),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {
            _mudarPagina(2);
          },
          backgroundColor: Colors.transparent,
          shape: const CircleBorder(
            side: BorderSide(
              color: Color.fromRGBO(236, 236, 236, 1),
            ),
          ),
          elevation: 0,
          child: Container(
              padding: const EdgeInsets.all(3),
              child: Image.asset('assets/images/logo_tuga.png',
                  width: 50, height: 50)),
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          fixedColor: const Color.fromARGB(255, 152, 39, 39),
          unselectedItemColor: Colors.black,
          currentIndex: _paginaAtual,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Receitas',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Favoritas',
            ),
            const BottomNavigationBarItem(
              icon: Icon(null), // Removido o ícone do logo daqui
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  const Icon(Icons.shopping_cart),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 101, 90),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              label: 'Loja',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
          onTap: _mudarPagina,
        ),
      ),
    );
  }
}

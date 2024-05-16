import 'package:flutter/material.dart';
import 'package:ecorecycler/Gestion/raparatose_screen.dart';
import 'package:ecorecycler/Gestion/rordinario_screen.dart';
import 'package:ecorecycler/Gestion/rreciclable_screen.dart';
import 'package:ecorecycler/Horario/horario_screen.dart';
import 'package:ecorecycler/Tips/tips_screen.dart';
import 'package:ecorecycler/Puntos/puntog_screen.dart';
import 'package:ecorecycler/Perfil/perfil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navegar a las diferentes pantallas principales
    switch (index) {
      case 0:
        // Ya estamos en HomeScreen, no hacemos nada
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HorarioScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TipsScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PuntoGScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PerfilScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoRecycler'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset('assets/images/logo.png', height: 100),
            ),
            const SizedBox(height: 20),
            const Text(
              '¡Hola!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Aprende como gestionar tus residuos sólidos',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RordinarioScreen()),
                );
              },
              child: const Center(
                child: Text(
                  'Residuos Ordinarios',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RreciclableScreen()),
                );
              },
              child: const Center(
                child: Text(
                  'Residuos Reciclables',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RaparatoseScreen()),
                );
              },
              child: const Center(
                child: Text(
                  'Residuos RAAEEs',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.white : Colors.black),
            label: 'Inicio',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule,
                color: _selectedIndex == 1 ? Colors.white : Colors.black),
            label: 'Horario',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb,
                color: _selectedIndex == 2 ? Colors.white : Colors.black),
            label: 'ReciTips',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on,
                color: _selectedIndex == 3 ? Colors.white : Colors.black),
            label: 'RecPuntos',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 4 ? Colors.white : Colors.black),
            label: 'Perfil',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
      ),
    );
  }
}

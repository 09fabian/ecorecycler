import 'package:flutter/material.dart';
import 'package:ecorecycler/Detalle%20Tips/tip1_screen.dart';
import 'package:ecorecycler/Detalle%20Tips/tip2_screen.dart';
import 'package:ecorecycler/Detalle%20Tips/tip3_screen.dart';
import 'package:ecorecycler/Detalle%20Tips/tip4_screen.dart';
import 'package:ecorecycler/Detalle%20Tips/tip5_screen.dart';
import 'package:ecorecycler/Horario/horario_screen.dart';
import 'package:ecorecycler/Inicio/home_screen.dart';
import 'package:ecorecycler/Puntos/puntog_screen.dart';
import 'package:ecorecycler/Perfil/perfil_screen.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  int _selectedIndex =
      2; // Asegúrate de ajustar el índice seleccionado para TipsScreen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HorarioScreen()),
        );
        break;
      case 2:
        // Ya estamos en TipsScreen, no hacemos nada
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
        title: const Text('ReciTips'),
        automaticallyImplyLeading: false, // Remove the back arrow
        backgroundColor: Colors.green,
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
              'ReciTips',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Te invitamos a explorar nuestros Tips, aprende un poco más',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tip1Screen()),
                );
              },
              child: const Center(
                child: Text(
                  'Tip 1',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tip2Screen()),
                );
              },
              child: const Center(
                child: Text(
                  'Tip 2',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tip3Screen()),
                );
              },
              child: const Center(
                child: Text(
                  'Tip 3',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tip4Screen()),
                );
              },
              child: const Center(
                child: Text(
                  'Tip 4',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Color de texto
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Color de fondo
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tip5Screen()),
                );
              },
              child: const Center(
                child: Text(
                  'Tip 5',
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
            label: 'ReciPuntos',
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

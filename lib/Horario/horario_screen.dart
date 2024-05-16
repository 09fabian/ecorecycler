import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_database/firebase_database.dart';
import '../Inicio/home_screen.dart';
import '../Tips/tips_screen.dart';
import '../Puntos/puntog_screen.dart';
import '../Perfil/perfil_screen.dart';

class HorarioScreen extends StatefulWidget {
  const HorarioScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HorarioScreenState createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  int _selectedIndex = 1;
  String sector = '';
  String frecuencia = '';
  String horario = '';

  @override
  void initState() {
    super.initState();
    fetchSector();
    fetchHorario();
  }

  void fetchSector() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final ref = FirebaseDatabase.instance.ref().child('Usuarios/$userId');
      final snapshot = await ref.get();
      final data = snapshot.value as Map?;
      setState(() {
        sector = data?['Sector'] ?? 'No definido';
      });
    }
  }

  void fetchHorario() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Recoleccion')
        .doc('e7XYEfKnvslUumZuhhHZ')
        .get();
    final data = snapshot.data();
    setState(() {
      frecuencia = data?['Frecuencia'] ?? 'No definido';
      horario = data?['Horario'] ?? 'No definido';
    });
  }

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
        // Ya estamos en HorarioScreen, no hacemos nada
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
        title: const Text('Horario de Recolección'),
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
              '¡Ey!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Conoce el horario de recolección de desechos de tu sector',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            const Text(
              'Sector',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              sector,
              style:
                  const TextStyle(fontSize: 20), // Ajuste de tamaño de fuente
            ),
            const SizedBox(height: 20),
            const Text(
              'Frecuencia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              frecuencia,
              style:
                  const TextStyle(fontSize: 20), // Ajuste de tamaño de fuente
            ),
            const SizedBox(height: 20),
            const Text(
              'Horario',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              horario,
              style:
                  const TextStyle(fontSize: 20), // Ajuste de tamaño de fuente
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

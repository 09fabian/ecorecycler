import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Punto3Screen extends StatefulWidget {
  const Punto3Screen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Punto3ScreenState createState() => _Punto3ScreenState();
}

class _Punto3ScreenState extends State<Punto3Screen> {
  late Future<DocumentSnapshot> _puntoFuture;

  get url => null;

  @override
  void initState() {
    super.initState();
    _puntoFuture = FirebaseFirestore.instance
        .collection('Depositos')
        .doc(
            'NudwUYQbSkIbydeDiEjf') // ID del documento correspondiente a Punto #3
        .get();
  }

  void _launchURL(url) async {
    const url =
        'https://maps.app.goo.gl/gHAhGWaBVTaASuiN8'; // URL de ubicación para Punto #3
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punto #3'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _puntoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos.'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No se encontraron datos.'));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;
          String nombre = data['Nombre'];
          String ubicacion = data['Ubicacion'];
          String horarioAtencion = data['HorarioAtencion'];
          List<dynamic> residuosAceptados = data['ResiduosAceptados'] ?? [];
          String contacto = data['Contacto'];
          String nota = data['Nota'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Image.asset('assets/images/logo.png', height: 100),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nombre',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ubicación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  ubicacion,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Horario de atención',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  horarioAtencion,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Residuos Aceptados',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                ExpansionTile(
                  title: const Text('Tipo de Residuos Aceptados'),
                  children: residuosAceptados.map((residuo) {
                    return ListTile(
                      title: Text(residuo),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contacto',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  contacto,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nota',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  nota,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _launchURL(url),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: const Text(
                      'Ver Ubicación',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RaparatoseScreen extends StatefulWidget {
  const RaparatoseScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RaparatoseScreenState createState() => _RaparatoseScreenState();
}

class _RaparatoseScreenState extends State<RaparatoseScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Residuos RAAEEs'),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('Residuo')
            .doc('mcXzNwYIYKqRk2nRGRoh')
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;
          String descripcion = data['Descripcion'];
          List<dynamic> tipoResiduos = data['TipoResiduos'];

          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('Gestion')
                .doc('5O7i1l2uWY3E5tHuGgmS')
                .get(),
            builder: (context, gestionSnapshot) {
              if (!gestionSnapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              if (gestionSnapshot.data == null) {
                return const Center(
                    child: Text('No se encontraron datos de gestión.'));
              }

              var gestionData =
                  gestionSnapshot.data!.data() as Map<String, dynamic>;
              String bolsaColor =
                  gestionData['BolsaColor'] ?? 'No especificado';
              String instruccionesManejo =
                  gestionData['InstruccionesManejo'] ?? 'No especificado';

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.pink[100],
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Residuos RAAEEs',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Descripción',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(descripcion),
                    const SizedBox(height: 10),
                    Image.asset(
                        'assets/images/electronicos.png'), // Imagen desde los assets
                    const SizedBox(height: 10),
                    ExpansionTile(
                      title: const Text(
                        'Tipo de Residuos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      initiallyExpanded: _isExpanded,
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _isExpanded = expanded;
                        });
                      },
                      children: tipoResiduos.map<Widget>((residuo) {
                        return ListTile(
                          title: Text(residuo.toString()),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Instrucciones de Manejo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(instruccionesManejo),
                    const SizedBox(height: 10),
                    const Text(
                      'Color de Bolsa',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(bolsaColor),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RordinarioScreen extends StatefulWidget {
  const RordinarioScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RordinarioScreenState createState() => _RordinarioScreenState();
}

class _RordinarioScreenState extends State<RordinarioScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Residuos Ordinarios'),
        backgroundColor: Colors.green,
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
            .doc('qmG71TmdTBkApARYIw2a')
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
                .doc('aUCHkTUU0hiJw3tO6Bpw')
                .get(),
            builder: (context, gestionSnapshot) {
              if (!gestionSnapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              var gestionData =
                  gestionSnapshot.data!.data() as Map<String, dynamic>;
              String bolsaColor = gestionData['BolsaColor'];
              String instruccionesManejo = gestionData['InstruccionesManejo'];

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.green[100],
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Residuos Ordinarios',
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
                        'assets/images/ordinarios.png'), // Imagen desde los assets
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

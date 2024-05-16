import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

class RreciclableScreen extends StatefulWidget {
  const RreciclableScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RreciclableScreenState createState() => _RreciclableScreenState();
}

class _RreciclableScreenState extends State<RreciclableScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Residuos Reciclables'),
        backgroundColor: Colors.blue,
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
            .doc('xOP5fQ6Xh7SsiTD2eoeZ')
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
                .doc('c5hMw0HgfehlYj9m61nq')
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
                      color: Colors.blue[100],
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Residuos Reciclables',
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
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 450.0, // Ajusta la altura de las imágenes aquí
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                      ),
                      items: [
                        'assets/images/reciclables1.png',
                        'assets/images/reciclables2.png'
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              i,
                              fit: BoxFit
                                  .cover, // Ajusta cómo se muestran las imágenes
                            );
                          },
                        );
                      }).toList(),
                    ),
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

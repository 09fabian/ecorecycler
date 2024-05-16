import 'package:ecorecycler/Perfil/perfil_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'PantallaCarga/loading_screen.dart';
import 'InicioSesion/login_screen.dart';
import 'Registro/register_screen.dart';
import 'Inicio/home_screen.dart';
import 'Gestion/rordinario_screen.dart';
import 'Gestion/rreciclable_screen.dart';
import 'Gestion/raparatose_screen.dart';
import 'Horario/horario_screen.dart';
import 'Tips/tips_screen.dart';
import 'Detalle Tips/tip1_screen.dart';
import 'Detalle Tips/tip2_screen.dart';
import 'Detalle Tips/tip3_screen.dart';
import 'Detalle Tips/tip4_screen.dart';
import 'Detalle Tips/tip5_screen.dart';
import 'Puntos/puntog_screen.dart';
import 'Puntos Detalle/punto1_screen.dart';
import 'Puntos Detalle/punto2_screen.dart';
import 'Puntos Detalle/punto3_screen.dart';
import 'Puntos Detalle/punto4_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoRecycler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoadingScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/rordinario': (context) => const RordinarioScreen(),
        '/rreciclable': (context) => const RreciclableScreen(),
        '/raparatose': (context) => const RaparatoseScreen(),
        '/horario': (context) => const HorarioScreen(),
        '/recTips': (context) => const TipsScreen(),
        '/tip1': (context) => const Tip1Screen(),
        '/tip2': (context) => const Tip2Screen(),
        '/tip3': (context) => const Tip3Screen(),
        '/tip4': (context) => const Tip4Screen(),
        '/tip5': (context) => const Tip5Screen(),
        '/reciPuntos': (context) => const PuntoGScreen(),
        '/punto1': (context) => const Punto1Screen(),
        '/punto2': (context) => const Punto2Screen(),
        '/punto3': (context) => const Punto3Screen(),
        '/punto4': (context) => const Punto4Screen(),
        '/perfil': (context) => const PerfilScreen(),
      },
    );
  }
}

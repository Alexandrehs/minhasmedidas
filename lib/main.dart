import 'package:flutter/material.dart';
import 'package:minhasmedidas/src/models/medidas.dart';
import 'package:minhasmedidas/src/models/people.dart';
import 'package:minhasmedidas/src/pages/dashboard.dart';
import 'package:minhasmedidas/src/pages/initial.dart';
import 'package:minhasmedidas/src/pages/medidas/formulario_medidas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Medidas(),
        ),
        ChangeNotifierProvider(
          create: (context) => People(name: ''),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          secondaryHeaderColor: Colors.indigo.shade100),
      initialRoute: '/initial',
      routes: {
        '/initial': (context) => Initial(),
        '/dashboard': (context) => const Dashboard(),
        '/formularioMedidas': (context) => FormulariosMedidas(),
      },
    );
  }
}

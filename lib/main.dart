import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // per a que la aplicacio pugui iniciar amb les preferences
  await Preferences.init(); // inicialitzar preferences (tasca async)
  runApp(const MyApp());
}

String get _initialRoute {
  return Preferences.nom.isEmpty
      ? HomeScreen.routerName
      : PetScreen.routerName;
}

class MyApp extends StatelessWidget{

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pollito App",
      initialRoute: _initialRoute,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        PetScreen.routerName: (_) => const PetScreen()
      },
    );
  }
}
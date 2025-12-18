import 'package:flutter/material.dart';
import 'package:pollitoapp/screens/home_screen.dart';
import '../preferences/preferences.dart';

class PetScreen extends StatefulWidget {
  static const String routerName = 'pet_screen';

  const PetScreen({Key? key}) : super(key: key);

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  int pios = Preferences.pios;
  String pet_name = Preferences.nom;

  static const Color wiiBlue = Color(0xFF7EC8E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F1FA),
      appBar: AppBar(
        title: Text("$pet_name Screen"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      body: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: wiiBlue,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Este es tu pollito",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 6),
                Text(
                  pet_name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    Preferences.pios++;
                    setState(() {
                      pios = Preferences.pios;
                    });
                  },
                  child: Image.asset(
                    "resources/manolo.png",
                    width: 160, // 🐥 MÁS GRANDE
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Ha hecho $pios pios 🐥",
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 28),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: wiiBlue,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routerName,
                    );
                  },
                  child: const Text(
                    "Cambiar nombre",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

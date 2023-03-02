import 'package:basic_app/ui/screens/home.dart';
import 'package:flutter/material.dart';

// Dieser Screen (Bildschirm) wird beim start der App angezeigt. Hier können Daten im Hintergrund geladen werden.
class SplashScreen extends StatefulWidget {
  // Der Routenname wird zur navigation zwischen den Screens (Bildschirmansichten) verwendet.
  static const String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loadingData = true;
  @override
  void initState() {
    super.initState();
    // Hier kannst du Funktionen aufrufen, die beim aufrufen (anzeigen) des Screens (Bildschirms) ausgeführt werden sollen.
    _loadData();
  }

  Future<void> _loadData() async {
    // Setze den Wert _loadingData, zum überprüfen, ob gerade Daten geladen werden auf "true".
    setState(() {
      _loadingData = true;
    });

    // Hier wird einfach 1 Sekunde gewartet.
    await Future.delayed(const Duration(seconds: 3));

    // Wenn alle daten geladen wurden navigiere zum HomeScreen
    _navigateToHome();

    // Setze den Wert _loadingData, zum überprüfen, ob gerade Daten geladen werden auf "false".
    setState(() {
      _loadingData = false;
    });
  }

  // Funktion um zum HomeScreen zu navigieren
  void _navigateToHome() {
    // Wenn alle daten geladen wurden navigiere zum HomeScreen
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // Diese methode wird jedesmal ausgeführt, wenn setState() aufgerufen wird, weil es sich um den State (Status) eines StatefullWidget (Widget mit Status) handelt.

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          _loadingData ? const CircularProgressIndicator() : const SizedBox(),
        ],
      ),
    );
  }
}

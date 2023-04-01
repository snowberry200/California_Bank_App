import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homepage/homepage.dart';

void main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const CaliApp());
}

class CaliApp extends StatefulWidget {
  const CaliApp({super.key});

  @override
  State<CaliApp> createState() => _CaliAppState();
}

class _CaliAppState extends State<CaliApp> with TickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController animationController = AnimationController(
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

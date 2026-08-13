import 'package:flutter/material.dart';
import 'package:flutter_application_12/api/dio_handler.dart';
import 'package:flutter_application_12/controller/digimon_controller.dart';
import 'package:flutter_application_12/screens/digimon_screen.dart';
import 'package:provider/provider.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  
 
  DioHandler.setup();

  runApp(
    ChangeNotifierProvider(
      create: (context) => DigimonController()..fetchDigimons(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digimon App',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DigimonScreen(),
    );
  }
}
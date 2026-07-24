import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final greenColor = const Color(0xFF146C43);
  final whiteColor = const Color(0xFFE8F5EE);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tESTE',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF146C43),
          foregroundColor: Color(0xFFFFF),
          title: Text(
            'Configuração',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ),
          ],
          currentIndex: 1,
          fixedColor: greenColor,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Icon(Icons.notifications, color: greenColor),
                //PAREI AQUI ANTES DE REALIZAR A ROW DAS COLUNAS DE NOTIFICAÇÃO ETC
              ),
            ],
          ),
        ),
      ),
    );
  }
}

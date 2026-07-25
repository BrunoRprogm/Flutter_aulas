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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF146C43),
          foregroundColor: Colors.white,
          title: const Text(
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
          items: const [
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
          child: Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Card de notificações
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Notificações'),
                          Text('Gerencie seus alertas.'),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: BoxBorder.all(
                      width: 1,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.lock, color: Color(0xFF146C43)),
                      const SizedBox(width: 12),
                      Text('Privacidade e Segurança'),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: BoxBorder.all(
                      width: 1,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.help, color: Color(0xFF146C43)),
                      const SizedBox(width: 12),
                      Text('Ajuda e Suporte'),
                    ],
                  ),
                ),

                // Card do plano premium
                Container(
                  padding: const EdgeInsets.all(18),
                  margin: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.workspace_premium,
                            color: Color(0xFF146C43),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Plano Premium',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.shade50,
                            ),
                            child: Text(
                              'Ativo',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF146C43),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text('Armazenamento utilizado'),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.devices, color: Color(0xFF146C43)),
                                  Text(
                                    '13',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xFF146C43),
                                    ),
                                  ),
                                  Text(
                                    'Dispositivos',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: const Column(
                                children: [
                                  Icon(Icons.calendar_today),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xFF146C43),
                                    ),
                                  ),
                                  Text('Dispositivos'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(), // Pedir ao lucas a explicação do porque usar sizedbox para imprimir este OutlinedButtom
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Sair da Conta'),
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

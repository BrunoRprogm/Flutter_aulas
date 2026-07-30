import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Entregar em',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                'Rua das Flores, 128',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.greenAccent,
              ),
              child: Image.asset(
                'assets/images/IconSmile.png',
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels:
              true, //Necessariamente para mostrar a escrita da
          //bottom navegation quye não esta selecionada precisamos deixar esse cara em
          //true
          unselectedItemColor:
              Colors.grey, //E este para alterar a cor das labels
          //que por padrão vem quase como invísivel.
          unselectedLabelStyle: TextStyle(color: Colors.black),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.other_houses_sharp, color: Colors.green),
              label: 'Inicío',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps_outlined, color: Colors.green),
              label: 'Categoria',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded, color: Colors.green),
              label: 'Listas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.green),
              label: 'Carrinho',
            ),
          ],
          currentIndex:
              1, //serve para deixar marcado qual dos itens da app bar está ativo
          //selecionado!
          fixedColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              //Espaçamento fora do container "É oque não deixa
              // o objeto encostar nas bordas"
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(18),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Color(0xFF0B4729),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 2, 3, 3),
                        width: 110,
                        height: 23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Color(0xFFC2ED47),
                        ),
                        child: Text(
                          'OFERTA DO DIA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      Text(
                        'Hortifruti com até',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '30% OFF',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Ver ofertas  →',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.greenAccent.shade400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),
                      color: Color(0xFFF2BF2E),
                    ),
                    child: Image.asset(
                      'assets/images/iconSacola.png',
                      height: 38,
                      width: 38,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Categorias',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Spacer(),
                Text(
                  'Ver Todas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

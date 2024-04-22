import 'package:flutter/material.dart';
import 'package:recipes_app/components/video_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Novidades',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      VideoCard(
                        image: 'assets/images/thumbnails/food_1.png',
                        text: 'Espaguete com Ameijoas',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_2.png',
                        text: 'Cozido à Portuguesa',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_3.png',
                        text: 'Dessalgando Bacalhau',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_4.png',
                        text: 'Os Rumos do Canal',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Receitas Populares',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      VideoCard(
                        image: 'assets/images/thumbnails/food_12.png',
                        text: 'Hamburguer de Frango à Tunga',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_5.png',
                        text: 'Cozido à Portuguesa no Pão',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_6.png',
                        text: 'Polvo à Lagareiro',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_7.png',
                        text: 'Arroz Doce Cremoso',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 16.0,
              bottom: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Cozinha Portuguesa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      VideoCard(
                        image: 'assets/images/thumbnails/food_8.png',
                        text: 'Bacalhau à Brás',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_9.png',
                        text: 'Francesinha',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_10.png',
                        text: 'Bife com Molho de Natas de Cogumelos',
                      ),
                      VideoCard(
                        image: 'assets/images/thumbnails/food_11.png',
                        text: 'Alheira à Tuga',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

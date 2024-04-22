import 'package:flutter/material.dart';
import 'package:recipes_app/pages/recipe_page.dart';

class VideoCard extends StatelessWidget {
  String image;
  String text;
  VideoCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecipePage()),
        );
      },
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                image,
                width: 200,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 35,
              width: 200,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromARGB(255, 152, 39, 39),
              ),
              child: Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

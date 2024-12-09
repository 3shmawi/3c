import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_children_course/ui/home/view.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({required this.category, required this.img, super.key});

  final String category;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsHomeView(
                category: category,
                img: img,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(img),
            ),
            const SizedBox(height: 50),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  category.toUpperCase(),
                  speed: const Duration(milliseconds: 150),
                  textStyle: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: false,
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            ),
          ],
        ),
      ),
    );
  }
}

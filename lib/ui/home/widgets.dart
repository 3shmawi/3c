import 'package:flutter/material.dart';
import 'package:flutter_children_course/model/news.dart';

class NewHomeItem extends StatelessWidget {
  const NewHomeItem(this.article, {super.key});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  article.image.isEmpty
                      ? "https://i.pinimg.com/474x/a1/ac/35/a1ac35d16ceb5060c0d8ae167d671c3f.jpg"
                      : article.image,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Expanded(
                      child: Text(
                        article.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(child: Text(article.author)),
                        const SizedBox(width: 8),
                        Text(
                          article.date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('NewsApi'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.cyan,
                    ),
                    Text('Description', style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 16.0),
                    Text('Published At', style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

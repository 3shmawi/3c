import 'package:flutter/material.dart';

class Item {
  final String name;

  Item(this.name);
}

class ItemSearchList extends StatefulWidget {
  const ItemSearchList({super.key});

  @override
  ItemSearchListState createState() => ItemSearchListState();
}

class ItemSearchListState extends State<ItemSearchList> {
  final List<Item> items = List.generate(50, (index) => Item('Item $index'));
  final ScrollController _scrollController = ScrollController();
  String searchQuery = '';
  int highlightedIndex = -1;

  void scrollToItem(int index) {
    setState(() {
      highlightedIndex = index; // Set the highlighted index
    });

    // Animate to the item's position in the list
    _scrollController.animateTo(
      index * 50.0, // Assuming each item has a height of 50.0
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );

    // Remove the highlight after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        highlightedIndex = -1; // Reset highlight
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search...',
          ),
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
          onSubmitted: (v) {
            int index = 0;
            for (final item in items) {
              if (item.name == v) {
                index = items.indexOf(item);
                print(index);
                break;
              }
            }
            scrollToItem(index);
          },
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          bool isHighlighted = index ==
              highlightedIndex; // Check if this item should be highlighted

          return GestureDetector(
            onTap: () {
              final targetIndex = items.indexOf(item);
              scrollToItem(targetIndex);
            },
            child: Stack(
              children: [
                ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(
                      color: isHighlighted ? Colors.white : Colors.white60,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: isHighlighted ? 1 : 0,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    // Add a divider line if the item is highlighted
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

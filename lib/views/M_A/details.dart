import 'package:flutter/material.dart';

import 'chat.dart';

class DetailsChatView extends StatelessWidget {
  const DetailsChatView(this.chat, {super.key});

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(chat.avatar),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "last seen recently",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 75),
        itemCount: 20,
        itemBuilder: (context, index) => _ChatItem(
          message: "message",
          isSender: index.isEven,
          date: "$index:19",
        ),
      ),
      bottomSheet: Card(
        elevation: 5,
        color: Colors.grey.shade50,
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  const _ChatItem({
    required this.message,
    required this.isSender,
    required this.date,
  });

  final String message;
  final bool isSender;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isSender) const Expanded(child: SizedBox()),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Align(
                alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.blueAccent : Colors.grey.shade400,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          isSender ? const Radius.circular(10) : Radius.zero,
                      topRight:
                          !isSender ? const Radius.circular(10) : Radius.zero,
                      bottomLeft:
                          isSender ? Radius.zero : const Radius.circular(10),
                      bottomRight:
                          !isSender ? Radius.zero : const Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: isSender
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Text(
                        message,
                        style: TextStyle(
                          color: isSender ? Colors.white : Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: isSender ? Colors.white70 : Colors.black45,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isSender) const Expanded(child: SizedBox()),
      ],
    );
  }
}

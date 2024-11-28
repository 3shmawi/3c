import 'package:flutter/material.dart';

import 'details.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatModel> chatDummy = [
    ChatModel(
      name: 'Mohamed Ashmawi',
      lastMessage: 'Hello, how are you?',
      time: "08:19 PM",
      avatar:
          "https://images.unsplash.com/photo-1731351621470-8aebda14d242?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8",
      isPersonal: true,
      unreadMessages: 0,
    ),
    ChatModel(
      name: 'Mohamed Reda',
      lastMessage: 'Hello, how are you?',
      time: "01:19 PM",
      avatar:
          "https://images.unsplash.com/photo-1731491895205-efb4def35547?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw4fHx8ZW58MHx8fHx8",
      isPersonal: true,
      unreadMessages: 13,
    ),
    ChatModel(
      name: 'قَيدُ الخَاطِر',
      lastMessage: 'أي حاجة',
      time: "08:28 PM",
      avatar:
          "https://media.istockphoto.com/id/1421170573/photo/aspiration-for-change.webp?a=1&b=1&s=612x612&w=0&k=20&c=gTSai9vKmVYXoELah7TCwy0y4-O4L-K_PmWx-OwfL2w=",
      isPersonal: false,
      unreadMessages: 205,
    ),
    ChatModel(
      name: 'Abdullah Mohamed',
      lastMessage: 'Hello, how are you?',
      time: "07:19 AM",
      avatar:
          "https://i.pinimg.com/474x/97/8d/fe/978dfe2eed24660a344f07c8784065c8.jpg",
      isPersonal: true,
      unreadMessages: 20,
    ),
    ChatModel(
      name: 'Rehab Hamdi',
      lastMessage: 'Hello, how are you?',
      time: "08:19 PM",
      avatar:
          "https://images.unsplash.com/photo-1591271300850-22d6784e0a7f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D",
      isPersonal: true,
      unreadMessages: 0,
    ),
    ChatModel(
      name: 'A\'esha Mohamed',
      lastMessage: 'Hello, how are you?',
      time: "08:19 PM",
      avatar:
          "https://i.pinimg.com/474x/1e/cc/49/1ecc49ddd68502026ad250869a4b5868.jpg",
      isPersonal: true,
      unreadMessages: 5,
    ),
  ];

  List<ChatModel> results = [];

  List<int> unreadMessages = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      results = chatDummy;
      unreadMessages = [
        //all
        chatDummy.where((chat) => chat.unreadMessages > 0).toList().length,
        chatDummy
            .where((chat) => chat.isPersonal == true && chat.unreadMessages > 0)
            .toList()
            .length,
        chatDummy
            .where(
                (chat) => chat.isPersonal == false && chat.unreadMessages > 0)
            .toList()
            .length,
        chatDummy.where((chat) => chat.unreadMessages > 0).toList().length,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white60,
                ),
              ),
              SizedBox(width: 6),
              Text('1 Stories'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              switch (index) {
                case 0:
                  setState(() {
                    results = chatDummy;
                  });
                  break;
                case 1:
                  setState(() {
                    results = chatDummy
                        .where((chat) => chat.isPersonal == true)
                        .toList();
                  });
                  break;
                case 2:
                  setState(() {
                    results = chatDummy
                        .where((chat) => chat.isPersonal == false)
                        .toList();
                  });
                  break;
                case 3:
                  setState(() {
                    results = chatDummy
                        .where((chat) => chat.unreadMessages > 0)
                        .toList();
                  });
                  break;
              }
            },
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    const Text("All"),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 11,
                      child: Text(unreadMessages[0].toString()),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Text("Personal"),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 11,
                      child: Text(unreadMessages[1].toString()),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Text("Channels"),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 11,
                      child: Text(unreadMessages[2].toString()),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Text("Unread"),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 11,
                      child: Text(unreadMessages[3].toString()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: const Drawer(),
        body: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsChatView(results[index]),
                  ),
                );
              },
              child: _item(results[index])),
          itemCount: results.length,
        ),
      ),
    );
  }

  Widget _item(ChatModel chat) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(chat.avatar),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        chat.time,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (chat.unreadMessages != 0)
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "${chat.unreadMessages}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Divider(
                    color: Colors.cyanAccent,
                    height: 0,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

class ChatModel {
  String name;
  String lastMessage;
  int unreadMessages;
  String avatar;
  bool isPersonal;
  String time;

  ChatModel({
    required this.name,
    required this.lastMessage,
    required this.unreadMessages,
    required this.avatar,
    required this.isPersonal,
    required this.time,
  });
}

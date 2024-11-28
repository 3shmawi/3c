import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfilePersonalInformation extends StatefulWidget {
  const ProfilePersonalInformation({super.key});

  @override
  State<ProfilePersonalInformation> createState() =>
      _ProfilePersonalInformationState();
}

class _ProfilePersonalInformationState
    extends State<ProfilePersonalInformation> {
  final Dio _dio = Dio();

  Map<String, dynamic> usrData = {};

  void getUserData() {
    usrData.clear();
    setState(() {});
    _dio.get("https://randomuser.me/api/").then((response) {
      setState(() {
        usrData = response.data["results"].first;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      body: Stack(
      alignment: Alignment.topCenter,
      children: [

      ],
      )
       */
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1731351621470-8aebda14d242?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8",
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 7,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(60),
                    ),
                  ),
                ),
              ),
            ],
          ),
          usrData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 140,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              NetworkImage(usrData["picture"]["medium"]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _item("First Name", usrData["name"]["first"]),
                      _item("Last Name", usrData["name"]["last"]),
                      _item("Username", usrData["login"]["username"]),
                      _item("Email", usrData["email"]),
                      _item("Phone Number", usrData["cell"]),
                      _item("Location",
                          "${usrData["location"]["country"]}, ${usrData["location"]["city"]}, ${usrData["location"]["state"]}"),
                    ],
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getUserData,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _item(String title1, String title2) {
    final ctrl = TextEditingController();
    ctrl.text = title2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        ),
        TextField(
          enabled: false,
          controller: ctrl,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

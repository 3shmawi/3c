import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/ctrl/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCtrl()..getData(),
      child: BlocBuilder<UserCtrl, UserStates>(
        builder: (context, state) {
          final cubit = context.read<UserCtrl>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              title: const Text("Profile page"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {},
                ),
              ],
            ),
            body: Center(
              child: state is UserLoadingState
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.deepPurple,
                            child: CircleAvatar(
                              radius: 60,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "${cubit.user!.results![0].name!.title} ${cubit.user!.results![0].name!.first}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulputate, tortor non consectetur tincidunt, justo lectus eleifend felis, a tempor velit lectus sed ex. Donec viverra, neque ac vulputate mattis, mi nulla dictum urna, ac tristique arcu arcu nec velit. In non est in urna consectetur molestie. Nulla facilisi. Donec vel neque at ex placerat placerat",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.cyan,
                                ),
                              ),
                              Text(" Email address "),
                              Expanded(
                                  flex: 6,
                                  child: Divider(
                                    color: Colors.cyan,
                                  )),
                            ],
                          ),
                          Card(
                            child: ListTile(
                              title: Text("EMAIL ADDRESS"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.cyan,
                                ),
                              ),
                              Text(" Phone number "),
                              Expanded(
                                  flex: 6,
                                  child: Divider(
                                    color: Colors.cyan,
                                  )),
                            ],
                          ),
                          Card(
                            child: ListTile(
                              title: Text("PHONE NUMBER"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.cyan,
                                ),
                              ),
                              Text(" Country "),
                              Expanded(
                                  flex: 6,
                                  child: Divider(
                                    color: Colors.cyan,
                                  )),
                            ],
                          ),
                          Card(
                            child: ListTile(
                              title: Text("COUNTRY"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.cyan,
                                ),
                              ),
                              Text(" State "),
                              Expanded(
                                  flex: 6,
                                  child: Divider(
                                    color: Colors.cyan,
                                  )),
                            ],
                          ),
                          Card(
                            child: ListTile(
                              title: Text("STATE"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.cyan,
                                ),
                              ),
                              Text(" Street "),
                              Expanded(
                                  flex: 6,
                                  child: Divider(
                                    color: Colors.cyan,
                                  )),
                            ],
                          ),
                          Card(
                            child: ListTile(
                              title: Text("STREET"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

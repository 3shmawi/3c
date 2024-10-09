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
                  onPressed: () {
                    cubit.getData();
                  },
                ),
              ],
            ),
            body: Center(
              child: state is UserLoadingState
                  ? const Card(
                      elevation: 15,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            CircularProgressIndicator(),
                            SizedBox(height: 10),
                            Text("Loading data..."),
                          ],
                        ),
                      ),
                    )
                  : Builder(builder: (context) {
                      final user = cubit.user!.results!.first;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.deepPurple,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  user.picture!.medium!,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "${user.name!.title}: ${user.name!.first} ${user.name!.last}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              user.login!.username!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const Row(
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
                                title: Text(user.email!),
                                trailing: const Icon(Icons.arrow_right),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Row(
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
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              child: ListTile(
                                title: Text(user.phone!),
                                trailing: const Icon(Icons.arrow_right),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Row(
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
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              child: ListTile(
                                title: Text(cubit
                                    .user!.results!.first.location!.country!),
                                trailing: const Icon(Icons.arrow_right),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Row(
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
                                title: Text(cubit
                                    .user!.results!.first.location!.state!),
                                trailing: const Icon(Icons.arrow_right),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Row(
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
                                title: Text(
                                  user.location!.street!.name!,
                                ),
                                trailing: const Icon(Icons.arrow_right),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    }),
            ),
          );
        },
      ),
    );
  }
}

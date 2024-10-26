import 'package:flutter/material.dart';
import 'package:flutter_children_course/services/local_storage.dart';

import 'app/app.dart';

//MVVM  Model  View  VIEWMODEL
//MVC   Model  View  Controller

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

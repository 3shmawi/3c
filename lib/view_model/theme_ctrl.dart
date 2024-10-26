import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/services/local_storage.dart';

//int double String bool
class ThemeCtrl extends Cubit<bool> {
  ThemeCtrl() : super(SharedPref.getData("isDark") ?? false);

  void toggleTheme() {
    SharedPref.saveData("isDark", !state);

    emit(!state);
  }
}

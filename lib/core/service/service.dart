import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_test_app/core/model/model.dart';

class NotesService {
  static Box box = Hive.box<NotesModel>("notes");
}

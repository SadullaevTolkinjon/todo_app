import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';
 part 'model.g.dart';
@HiveType(typeId: 0)
class NotesModel {
  @HiveField(0)
  String? notes;
  @HiveField(1)
  Color? color;
  @HiveField(2)
  String? time;

  NotesModel(this.notes, this.color, this.time);
}

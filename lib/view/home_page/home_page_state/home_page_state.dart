import 'package:flutter/material.dart';
import 'package:to_do_test_app/core/model/model.dart';
import 'package:to_do_test_app/core/service/service.dart';

abstract class HomePageState {
  HomePageState();
}

class InitialState extends HomePageState {
  InitialState();
}

class BottomNavIndexState extends HomePageState {
  int val;
  BottomNavIndexState(this.val);
}

class DatasState extends HomePageState {
  List val;
  DatasState(this.val);
}

class ModalShetState extends HomePageState {
  ModalShetState();
}

class AddDataState extends HomePageState {
  String val;
  

  List lst;
  AddDataState(this.val, this.lst);
  add() {
    NotesService.box.add(NotesModel(val, Colors.amber, "07:00 AM"));
  }
}

class CheckBoxValState extends HomePageState {
  bool val;
  CheckBoxValState(this.val);
}
class TappedState extends HomePageState {
  int val;
  TappedState(this.val);
}

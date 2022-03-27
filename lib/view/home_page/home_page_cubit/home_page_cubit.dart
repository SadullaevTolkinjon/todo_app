import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_test_app/core/data/local_data/local_data.dart';
import 'package:to_do_test_app/view/adding_page/adding_page_view/adding_page_view.dart';
import 'package:to_do_test_app/view/home_page/home_page_view/notask.dart';
import 'package:to_do_test_app/view/home_page/home_page_view/task_have.dart';
import 'package:to_do_test_app/view/home_page/home_page_state/home_page_state.dart';
import 'package:to_do_test_app/view/task/task_view/task_view.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(InitialState());

  int indexOfNavBar = 0;
  bool checkBoxVal = false;
  List bodies = [
    data.isEmpty ? const NoTaskPage() : const TaskHave(),
    const AddingPage(),
    const TaskPage()
  ];
  List checkBoxValue = List.generate(data.length, ((index) => false));
  List tapped = [];

  // Functions
  void changeIndexOfNavBar(int val) {
    indexOfNavBar = val;
    if (val == 1) {
      emit(ModalShetState());
    }

    emit(BottomNavIndexState(val));
  }

  void addData(var text) {
    data.add(text);

    emit(AddDataState(text, bodies));
  }

  changeCheckboxVal(int index) {
    checkBoxValue[index] = !checkBoxValue[index];
    checkBoxVal = checkBoxValue[index];

    emit(CheckBoxValState(checkBoxVal));
  }

  void tappedFunction(int index) {
    if (tapped.contains(index)) {
      tapped.remove(index);
    } else {
      tapped.add(index);
      emit(TappedState(index));
    }
  }
}

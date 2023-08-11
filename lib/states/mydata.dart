import "package:riverpod/riverpod.dart";

class MyData extends StateNotifier<double> {
  MyData() : super(1.0);
  void changeState(state) => this.state = state;
}

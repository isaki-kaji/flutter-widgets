import "package:flutter_widgets_app/models/index.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part 'future_riverpod.g.dart';

@riverpod
class FutureRiverpodNotifier extends _$FutureRiverpodNotifier {
  @override
  Future<Hello> build() async {
    final hello = Hello(1, "こんにちは");
    const sec3 = Duration(seconds: 2);
    await Future.delayed(sec3);
    // 最初のデータ
    return hello;
  }

  void repeatHello() async {
    state = const AsyncValue.loading();
    const sec2 = Duration(seconds: 2);
    await Future.delayed(sec2);
    if (state is AsyncLoading<Hello>) {
      final currentHello = state.value;
      final newNum = currentHello!.num + 1;
      final newHello = Hello(newNum, "こんにちは"); // 新しいHelloオブジェクトを作成します
      state = AsyncValue.data(newHello); // 新しいHelloオブジェクトをstateにセットします
    } else {
      print("state is not AsyncData<Hello>");
    }
  }
}

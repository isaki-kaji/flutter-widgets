import "package:flutter_widgets_app/models/index.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part 'future_riverpod.g.dart';

@riverpod
class FutureRiverpodNotifier extends _$FutureRiverpodNotifier {
  @override
  Future<Hello> build() async {
    final hello = Hello(0, "こんにちは");
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // 最初のデータ
    return hello;
  }

  void repeatHello() async {
    state = const AsyncValue.loading();
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    if (state is AsyncData<Hello>) {
      final currentHello = (state as AsyncData<Hello>).value;
      final newNum = currentHello.num + 1;
      final newHello = Hello(newNum, "こんにちは"); // 新しいHelloオブジェクトを作成します
      state = AsyncValue.data(newHello); // 新しいHelloオブジェクトをstateにセットします
    }
  }
}

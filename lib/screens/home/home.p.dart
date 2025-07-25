import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.p.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;
  
  void increment() => state++;
  
  void decrement() => state--;
  
  void reset() => state = 0;
}
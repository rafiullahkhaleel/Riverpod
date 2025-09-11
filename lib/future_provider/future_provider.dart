import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<FutureMultiState>((ref)async{
  await Future.delayed(Duration(seconds: 3));
  return FutureMultiState(count: 3, name: ['Khan','Jan','Rafi']);
});



class FutureMultiState{
  final int count;
  final List<String> name;

  FutureMultiState({required this.count, required this.name});

}
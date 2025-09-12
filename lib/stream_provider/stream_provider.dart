import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 108.0;
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    currentPrice += random.nextDouble() * 4 - 2;
    //throw 'Internet issue';
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});

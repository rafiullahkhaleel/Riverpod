import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiStateProvider = StateProvider<MultiState>((ref) {
  return MultiState(slider: .4, showToggle: false);
});

class MultiState {
  double slider;
  bool showToggle;
  MultiState({required this.slider, required this.showToggle});

  MultiState copyWith({double? slider, bool? showToggle}) {
    return MultiState(
      slider: slider ?? this.slider,
      showToggle: showToggle ?? this.showToggle,
    );
  }
}

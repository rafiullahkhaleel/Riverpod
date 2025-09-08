import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/multi_state.dart';

class MultiStateScreen extends ConsumerStatefulWidget {
  const MultiStateScreen({super.key});

  @override
  ConsumerState<MultiStateScreen> createState() => _MultiStateScreenState();
}

class _MultiStateScreenState extends ConsumerState<MultiStateScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print('build Container');
                final  slider = ref.watch(multiStateProvider.select((state){
                  return state.slider;
                }));
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.green.withValues(alpha: slider),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print('build Slider');
                final slider = ref.watch(multiStateProvider.select((state){
                 return state.slider;
                }));
                return Slider(value: slider, onChanged: (value) {
                  final sliderState = ref.read(multiStateProvider.notifier);
                  sliderState.state = sliderState.state.copyWith(slider: value);
                });
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print('build toggle');
                final state = ref.watch(multiStateProvider.select((state){
                 return state.showToggle;
                }));
                return Switch(
                  value: state,
                  onChanged: (value) {
                    ref.read(multiStateProvider.notifier).state =
                        ref.read(multiStateProvider).copyWith(showToggle: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



/// Code for counter App
// Consumer(
//   builder: (context, ref, child) {
//     final provid = ref.watch(multiState);
//     print('build 2');
//     return Text(
//       provid.slider.toString(),
//       style: const TextStyle(fontSize: 20),
//     );
//   },
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     ElevatedButton(
//       onPressed: () {
//         final count = ref.read(multiState.notifier);
//         count.state = count.state.copyWith(
//           slider: count.state.slider + 1,
//         );
//       },
//       child: const Text('+', style: TextStyle(fontSize: 20)),
//     ),
//     ElevatedButton(
//       onPressed: () {
//         final count = ref.read(multiState.notifier);
//         count.state = count.state.copyWith(
//           slider: count.state.slider - 1,
//         );
//       },
//       child: const Text('-', style: TextStyle(fontSize: 20)),
//     ),
//   ],
// ),



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<double>((ref) {
  return 0.0;
});

final toggleState = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer(
              builder: (context, provider, child) {
                final provid = provider.watch(counter);
                print('build 2');
                return Text(
                  provid.toString(),
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Text('+', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    final updatedCounter = ref.read(counter.notifier);
                    updatedCounter.state = updatedCounter.state - 1.5;
                  },
                  child: Text('-', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Consumer(
              builder: (context, provider, child) {
                final toggleProvider = provider.watch(toggleState);
                print('build 3');
                return Switch(
                  value: toggleProvider,
                  onChanged: (value) {
                    ref.watch(toggleState.notifier).state = value;
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;
  void increment() => state++;
}

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(35, 35, 35, 0),
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Pokedex',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Raleway',
                        height: 1.5,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Search for a Pokemon by name or using its National Pokemon number',
                    style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.grey,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                        labelText: 'Type Pokemon name here'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 1.5),
                  children: List.generate(
                      100,
                      (index) => Center(
                            child: Container(
                              constraints: BoxConstraints
                                  .expand(), //this fills up the area of grid cell
                              color: Colors.red,
                              child: Text('$index'),
                              // height: 100,
                              // width: 150,
                            ),
                          ))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

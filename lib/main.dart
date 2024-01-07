import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int counter2 = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CounterProvider(
          counter: counter,
          counter2: counter2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text('Жми раз '),
              ),
              const TextWidget(),
              //
              const SizedBox(height: 50),
              //
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter2++;
                  });
                },
                child: const Text('Жми два'),
              ),
              const TextWidget2(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print('textWidget');
    return Text(
        '${context.dependOnInheritedWidgetOfExactType<CounterProvider>(aspect: 'one')?.counter}');
  }
}

class TextWidget2 extends StatelessWidget {
  const TextWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print('textWidget 2');
    return Text(
        '${context.dependOnInheritedWidgetOfExactType<CounterProvider>(aspect: 'two')?.counter2}');
  }
}

// Инхерит виджет

class CounterProvider extends InheritedNotifier {
  final int counter;
  final int counter2;
  const CounterProvider(
      {super.key,
      required this.counter,
      required this.counter2,
      required Widget child})
      : super(child: child);
  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.counter != counter || oldWidget.counter2 != counter2;
  }
}

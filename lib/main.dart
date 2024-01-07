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
  final _data = DataModel(firstValue: 0, secondValue: 0, summa: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: DataInherit(
            model: _data,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(),
                TextFieldWidget2(),
                SizedBox(height: 20),
                ButtonWidget(),
                ResiltatWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResiltatWidget extends StatelessWidget {
  const ResiltatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        'Результат : ${context.dependOnInheritedWidgetOfExactType<DataInherit>()?.model.summa}');
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        (context.getElementForInheritedWidgetOfExactType<DataInherit>()?.widget
                as DataInherit)
            .model
            .summ();
      },
      child: const Text('Получить результат'),
    );
  }
}

class TextFieldWidget2 extends StatelessWidget {
  const TextFieldWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('второе значение'),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          (context
                  .getElementForInheritedWidgetOfExactType<DataInherit>()
                  ?.widget as DataInherit)
              .model
              .secondValue = int.parse(value);
        }
      },
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text('первое значение'),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          (context
                  .getElementForInheritedWidgetOfExactType<DataInherit>()
                  ?.widget as DataInherit)
              .model
              .firstValue = int.parse(value);
        }
      },
    );
  }
}

class DataModel extends ChangeNotifier {
  int firstValue;
  int secondValue;
  int summa;
  DataModel(
      {required this.firstValue,
      required this.secondValue,
      required this.summa});

  void summ() {
    final oldSumma = summa;
    summa = firstValue + secondValue;
    if (oldSumma != summa) {
      notifyListeners();
    }
  }
}

class DataInherit extends InheritedNotifier<DataModel> {
  final DataModel model;
  const DataInherit({super.key, required this.model, required Widget child})
      : super(child: child, notifier: model);
}

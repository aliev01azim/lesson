import 'package:flutter/material.dart';

const Duration duration = Duration(milliseconds: 250);
void main() {
  runApp(const MyApp());
}

// 1 sec = 1000 ms;
// 1000/60 = 16.5 ms на 1 кадр
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
  bool switchValue = true;
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) {
  //       setState(() {
  //         switchValue = !switchValue;
  //       });
  //     },
  //   );
  //   super.initState();
  // }

  // void restart() {
  //   setState(() {
  //     switchValue = !switchValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AnimatedDefaultTextStyleWidget(switchValue, /*restart*/),
            // AnimatedAlignWidget(switchValue),
            // AnimatedCrossFadeWidget(switchValue),
            // AnimatedOpacityWidget(switchValue),
            // AnimatedPaddingWidget(switchValue),
            // AnimatedPhysicalModelWidget(switchValue),
            // AnimatedRotationWidget(switchValue),
            TweenAnimationBuilderWidget(switchValue),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            switchValue = !switchValue;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class AnimatedDefaultTextStyleWidget extends StatelessWidget {
  const AnimatedDefaultTextStyleWidget(
    this.switchValue,
    // this.restart,
    {
    super.key,
  });
  final bool switchValue;
  // final Function restart;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
              fontSize: switchValue ? 16 : 60,
              color: switchValue ? Colors.black : Colors.green),
          // onEnd: () => restart(),
          duration: duration,
          child: const Text(
            'asdasdaddd',
          ),
        ),
      ),
    );
  }
}

class AnimatedAlignWidget extends StatelessWidget {
  const AnimatedAlignWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedAlign(
          duration: duration,
          alignment:
              switchValue ? const Alignment(0, -1) : const Alignment(1, 0),
          child: const Text(
            'asdasdaddd',
          ),
        ),
      ),
    );
  }
}

class AnimatedCrossFadeWidget extends StatelessWidget {
  const AnimatedCrossFadeWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedCrossFade(
          duration: duration,
          alignment:
              switchValue ? const Alignment(0, -1) : const Alignment(1, 0),
          firstChild: const Text('asdsadasdsadasdad'),
          secondChild: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle, color: Colors.green),
          ),
          crossFadeState: switchValue
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}

class AnimatedOpacityWidget extends StatelessWidget {
  const AnimatedOpacityWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedOpacity(
          duration: duration,
          opacity: switchValue ? 1 : 0.5,
          child: const Text(
            'asdasdaddd',
          ),
        ),
      ),
    );
  }
}

class AnimatedPaddingWidget extends StatelessWidget {
  const AnimatedPaddingWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedPadding(
          duration: duration,
          padding: EdgeInsets.symmetric(horizontal: switchValue ? 0 : 20),
          child: Container(
            color: Colors.green,
            width: 50,
          ),
        ),
      ),
    );
  }
}

class AnimatedPhysicalModelWidget extends StatelessWidget {
  const AnimatedPhysicalModelWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedPhysicalModel(
          duration: duration,
          shape: switchValue ? BoxShape.circle : BoxShape.rectangle,
          elevation: switchValue ? 0 : 3,
          color: switchValue ? Colors.green : Colors.pink,
          shadowColor: switchValue ? Colors.lightGreen : Colors.pinkAccent,
          child: const Text(
            'asdasdaddd',
          ),
        ),
      ),
    );
  }
}

class AnimatedRotationWidget extends StatelessWidget {
  const AnimatedRotationWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: Center(
        child: AnimatedRotation(
          duration: duration,
          turns: switchValue ? 0 : 10,
          child: const Text(
            'asdasdaddd',
          ),
        ),
      ),
    );
  }
}

class TweenAnimationBuilderWidget extends StatelessWidget {
  const TweenAnimationBuilderWidget(
    this.switchValue, {
    super.key,
  });
  final bool switchValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: duration,
        tween: ColorTween(
            begin: switchValue ? Colors.yellow : Colors.red,
            end: switchValue ? Colors.red : Colors.yellow),
        builder: (BuildContext context, Color? value, Widget? child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(value!, BlendMode.color),
            child: child,
          );
        },
        child: Image.asset('assets/images/1.jpg'),
      ),
    );
  }
}

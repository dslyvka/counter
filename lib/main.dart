import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Counter",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: const AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Tap \"-\" to decrement",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        CounterButtons(),
        Text(
          "Tap \"+\" to decrement",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class CounterButtons extends StatefulWidget {
  const CounterButtons({
    super.key,
  });

  @override
  State<CounterButtons> createState() {
    return _CounterButtonsState();
  }
}

class _CounterButtonsState extends State<CounterButtons> {
  late int _value;

  @override
  void initState() {
    _value = 50;
    super.initState();
  }

  void _incrementValue() {
    setState(() {
      _value++;
    });
  }

  void _decrementValue() {
    setState(() {
      _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 192, 203, 207),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: _decrementValue,
              icon: const Icon(Icons.remove),
            ),
            CounterButtonsText(value: _value),
            IconButton(
              onPressed: _incrementValue,
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class CounterButtonsText extends StatelessWidget {
  const CounterButtonsText({
    super.key,
    required int value,
  }) : _value = value;

  final int _value;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_value",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

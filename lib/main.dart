
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget - головний віджет програми
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RGB Color Picker',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const RGBColorPage(),
    );
  }
}

// StatefulWidget - екран, на якому змінюється колір
class RGBColorPage extends StatefulWidget {
  const RGBColorPage({super.key});

  @override
  State<RGBColorPage> createState() => _RGBColorPageState();
}

class _RGBColorPageState extends State<RGBColorPage> {
  // Початкові значення RGB
  double red = 50;
  double green = 203;
  double blue = 248;

  @override
  Widget build(BuildContext context) {
    // Створюємо колір на основі значень RGB
    Color selectedColor = Color.fromARGB(
      255,
      red.round(),
      green.round(),
      blue.round(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFFD1B7F8),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 80),

          // Квадрат, колір якого змінюється
          Center(
            child: Container(
              width: 150,
              height: 150,
              color: selectedColor,
            ),
          ),

          const SizedBox(height: 100),

          // Повзунок червоного кольору
          buildSlider(
            'Red',
            red,
                (value) {
              setState(() {
                red = value;
              });
            },
          ),

          // Повзунок зеленого кольору
          buildSlider(
            'Green',
            green,
                (value) {
              setState(() {
                green = value;
              });
            },
          ),

          // Повзунок синього кольору
          buildSlider(
            'Blue',
            blue,
                (value) {
              setState(() {
                blue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Метод для створення повзунків
  Widget buildSlider(
      String label,
      double value,
      ValueChanged<double> onChanged,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ${value.round()}',
            style: const TextStyle(fontSize: 14),
          ),
          Slider(
            value: value,
            min: 0,
            max: 255,
            divisions: 255,
            activeColor: const Color(0xFF67508C),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

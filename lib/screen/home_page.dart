import 'package:flutter/material.dart';

import '../widget/home/home_card.dart';
import 'example1_page.dart';
import 'example2_page.dart';
import 'example3_page.dart';
import 'example4_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cards = [
      HomeCard(
        order: 0,
        title: 'Basic shape playground',
        description: 'Draw simple shapes using default drawing methods such as '
            'line, circle, rectangle, etc.',
        onTapped: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Example1Page()),
        ),
      ),
      HomeCard(
        order: 1,
        title: 'Drawing playground',
        description: 'Draw more complex shapes from simple shapes,'
            'with more fancy painter & advanced properties (semantic builder)',
        onTapped: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Example2Page()),
        ),
      ),
      HomeCard(
        order: 2,
        title: 'Painter',
        description: 'A simple implementation of painter app using CustomPaint',
        onTapped: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Example3Page()),
        ),
      ),
      HomeCard(
        order: 3,
        title: 'CustomPainter with simple animation',
        description: '',
        onTapped: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Example4Page()),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Drawing layer demo')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemBuilder: (_, index) => cards[index],
          separatorBuilder: (_, index) => const SizedBox(height: 4),
          itemCount: cards.length,
        ),
      ),
    );
  }
}

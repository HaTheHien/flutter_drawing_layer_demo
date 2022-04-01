import 'package:drawing/widget/custom_painter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget paintScreen(context) {
    return RepaintBoundary(
      child: SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: const Painter()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Icon(Icons.close)),
        ),
        title: Text(
          "Draw",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[paintScreen(context)],
      ),
    );
  }
}

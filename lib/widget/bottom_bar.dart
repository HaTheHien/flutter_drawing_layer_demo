import 'package:drawing/provider/painter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BottomToolBar extends StatefulWidget {
  @override
  _BottomToolBarState createState() => _BottomToolBarState();
}

class _BottomToolBarState extends State<BottomToolBar> {
  late PainterController painterController;
  Color selectedColor = Colors.black;

  @override
  void initState() {
    painterController = context.read<PainterController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.white,
            child: Slider(
              value: painterController.thickness,
              onChanged: (thickness) {
                setState(() {
                  painterController.thickness = thickness;
                });
              },
              min: 3.0,
              max: 25.0,
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.color_lens,
                color: selectedColor,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Color Chooser'),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: selectedColor,
                            onColorChanged: (color) {
                              setState(() {
                                selectedColor = color;
                                painterController.drawColor = color;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"))
                        ],
                      );
                    });
              }),
          IconButton(
              icon: const Icon(
                Icons.undo,
                color: Colors.blue,
              ),
              onPressed: () {
                painterController.undo();
              }),
          IconButton(
              icon: const Icon(
                Icons.layers_clear,
                color: Colors.blue,
              ),
              onPressed: () {
                painterController.clear();
              }),
        ],
      ),
    );
  }
}

import 'package:drawing/provider/painter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class BottomToolBar extends StatefulWidget {
  const BottomToolBar({Key? key}) : super(key: key);

  @override
  _BottomToolBarState createState() => _BottomToolBarState();
}

class _BottomToolBarState extends State<BottomToolBar> {
  static const iconSize = 32.0;

  late PainterController painterController;
  Color selectedColor = Colors.black;

  @override
  void initState() {
    painterController = context.read<PainterController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Thickness'),
                Expanded(
                  child: Slider.adaptive(
                    value: painterController.thickness,
                    onChanged: (thickness) => setState(() {
                      painterController.thickness = thickness;
                    }),
                    label: painterController.thickness.round().toString(),
                    min: 1,
                    max: 40,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            iconSize: iconSize,
            icon: Icon(
              Icons.color_lens_outlined,
              color: selectedColor,
              size: iconSize,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: buildChooseColourDialog,
            ),
          ),
          IconButton(
            iconSize: iconSize,
            icon: const Icon(
              Icons.undo_outlined,
              // color: theme.primaryColor,
            ),
            onPressed: () => painterController.undo(),
          ),
          IconButton(
            iconSize: iconSize,
            icon: const Icon(
              Icons.layers_clear_outlined,
              // color: theme.primaryColor,
            ),
            onPressed: () => painterController.clear(),
          ),
        ],
      ),
    );
  }

  Widget buildChooseColourDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose a colour'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: selectedColor,
          onColorChanged: (color) => setState(() {
            selectedColor = color;
            painterController.drawColor = color;
          }),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("OK"),
        ),
      ],
    );
  }
}

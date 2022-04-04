import 'package:flutter/material.dart';

import '../../model/enums/shape_option.dart';

class ShapeChooser extends StatelessWidget {
  final ShapeOption currentShape;
  final ValueChanged<ShapeOption>? onSelected;

  const ShapeChooser({
    Key? key,
    required this.currentShape,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ShapeOption>(
      key: key,
      onSelected: onSelected,
      itemBuilder: (context) {
        return ShapeOption.values
            .map(
              (shape) => PopupMenuItem<ShapeOption>(
                value: shape,
                child: ListTile(
                  leading: Icon(shape.toIcon()),
                  title: Text(shape.toOptionString()),
                  selected: shape == currentShape,
                ),
              ),
            )
            .toList();
      },
      child: Icon(
        currentShape.toIcon(),
        size: 32,
      ),
    );
  }
}

extension ShapeOptionX on ShapeOption {
  String toOptionString() {
    switch (this) {
      case ShapeOption.none:
        return 'None';
      case ShapeOption.line:
        return 'Line';
      case ShapeOption.circle:
        return 'Circle';
      case ShapeOption.oval:
        return 'Oval';
      case ShapeOption.rectangle:
        return 'Rectangle';
    }
  }

  IconData toIcon() {
    switch (this) {
      case ShapeOption.none:
        return Icons.gesture;
      case ShapeOption.line:
        return Icons.horizontal_rule;
      case ShapeOption.circle:
        return Icons.circle;
      case ShapeOption.oval:
        // TODO find icon for oval shape
        return Icons.circle;
      case ShapeOption.rectangle:
        return Icons.rectangle;
    }
  }
}

import 'package:flutter/material.dart';
import '../models/tackle_component.dart';

class HookComponent extends StatelessWidget {
  final TackleComponent component;

  HookComponent(this.component);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(component.name),
      subtitle: Text('\$${component.price.toStringAsFixed(2)}'),
    );
  }
}

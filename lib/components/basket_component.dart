import 'package:flutter/material.dart';
import '../models/tackle_component.dart';

class BasketComponent extends StatelessWidget {
  final TackleComponent component;

  BasketComponent(this.component);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(component.name),
      subtitle: Text('\$${component.price.toStringAsFixed(2)}'),
    );
  }
}

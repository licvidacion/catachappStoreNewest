import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../data/data_service.dart';
import '../models/tackle_component.dart';
import '../components/line_component.dart';
import '../components/hook_component.dart';
import '../components/basket_component.dart';

class FishingTackleForm extends StatefulWidget {
  @override
  _FishingTackleFormState createState() => _FishingTackleFormState();
}

class _FishingTackleFormState extends State<FishingTackleForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TackleComponent? selectedComponent;
  int itemCount = 1;
  List<TackleComponent> availableComponents = [];
  double totalCost = 0.0; // Initialize the total cost to 0.0

  @override
  void initState() {
    super.initState();
    availableComponents = DataService.getAvailableComponents();
  }

  // Function to calculate the total cost based on selected component and quantity
  void calculateTotalCost() {
    if (selectedComponent != null) {
      setState(() {
        totalCost = selectedComponent!.price * itemCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('Select Fishing Tackle Component:'),
              FormBuilderDropdown(
                name: 'component',
                items: availableComponents
                    .map((component) => DropdownMenuItem(
                          value: component,
                          child: Text(
                              '${component.name} (\$${component.price.toStringAsFixed(2)})'),
                        ))
                    .toList(),
                onChanged: (selected) {
                  setState(() {
                    selectedComponent = selected as TackleComponent?;
                    calculateTotalCost(); // Calculate the total cost when the component changes
                  });
                },
              ),
              if (selectedComponent != null)
                Column(
                  children: [
                    Text('Selected Component:'),
                    if (selectedComponent!.name == 'Fishing Line')
                      LineComponent(selectedComponent!),
                    if (selectedComponent!.name == 'Hook')
                      HookComponent(selectedComponent!),
                    if (selectedComponent!.name == 'Basket')
                      BasketComponent(selectedComponent!),
                    SizedBox(height: 20.0),
                    Text('Item Count: $itemCount'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (itemCount > 1) {
                                itemCount--;
                                calculateTotalCost(); // Recalculate the total cost
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              itemCount++;
                              calculateTotalCost(); // Recalculate the total cost
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                        'Total Price: \$${totalCost.toStringAsFixed(2)}'), // Display the total price
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

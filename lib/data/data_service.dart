import '../models/tackle_component.dart';

class DataService {
  static List<TackleComponent> getAvailableComponents() {
    return [
      TackleComponent(name: 'Fishing Line', price: 10.0),
      TackleComponent(name: 'Hook', price: 5.0),
      TackleComponent(name: 'Basket', price: 15.0),
    ];
  }
}

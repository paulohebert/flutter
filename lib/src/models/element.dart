import 'element_category.dart';

class ChemicalElement {
  final int atomicNumber;
  final String symbol;
  final String name;
  final int period;
  final int group;
  final ElementCategory category;

  const ChemicalElement(this.atomicNumber, this.symbol, this.name, this.period,
      this.group, this.category);
}

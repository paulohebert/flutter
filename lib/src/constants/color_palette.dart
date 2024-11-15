import 'package:flutter/material.dart';

import '../models/element_category.dart';

const Map<ElementCategory, List<Color>> colors = {
  ElementCategory.metal: [
    Color.fromRGBO(40, 190, 48, 1),
    Color.fromRGBO(75, 209, 104, 1),
  ],
  ElementCategory.nonmetal: [
    Color.fromRGBO(245, 149, 23, 1),
    Color.fromRGBO(240, 112, 20, 1),
  ],
  ElementCategory.semimetal: [
    Color.fromRGBO(240, 202, 34, 1),
    Color.fromRGBO(240, 178, 20, 1),
  ],
};

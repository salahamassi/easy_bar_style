import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class EasyStyle extends Nested {
  EasyStyle({
    Key? key,
    required List<SingleChildWidget> styles,
    required Widget child,
  }) : super(
          key: key,
          children: styles,
          child: child,
        );
}

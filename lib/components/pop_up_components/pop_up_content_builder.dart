import 'package:flutter/material.dart';

abstract class PopUpContentBuilder {

  /// The message the menu says
  late final Widget text;

  /// The options that the menu can take
  late final List<Widget> options;

  /// Whether the buildMenu method has been called
  bool isBuilt = false;

  /// The function that removes the menu
  late final VoidCallback removeMenu;

  /// Build the pop up text and options
  void buildMenu();
}
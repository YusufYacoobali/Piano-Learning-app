import 'package:flutter/material.dart';

import 'pop_up_content_builder.dart';
import 'pop_up_content.dart';

/// Controller to display an intermediate menu
class PopUpController {
  /// Makes the menu display over another screen
  late final OverlayEntry _menu;

  final BuildContext context;

  /// The menu to be displayed
  late final PopUpContent _intermediateMenu;

  /// Builds the menu
  PopUpContentBuilder menuBuilder;

  bool _isShown = false;

  PopUpController({required this.context, required this.menuBuilder});

  /// Builds the contents of the menu
  void _build() {
    if (!menuBuilder.isBuilt) {
      menuBuilder.isBuilt = true;
      menuBuilder.removeMenu = _remove;
      menuBuilder.buildMenu();
      _intermediateMenu = PopUpContent(
        text: menuBuilder.text,
        options: menuBuilder.options,
        removeMenu: _remove,
      );
      _menu = OverlayEntry(
        builder: (context) => _intermediateMenu,
      );
    }
  }

  /// Removes the menu from the screen
  void _remove() {
    _isShown = false;
    if (menuBuilder.isBuilt && _menu.mounted) {
      _menu.remove();
    }
  }

  /// Shows the menu
  void show() {
    if (!_isShown) {
      _isShown = true;
      _build();
      if (!_menu.mounted) {
        final overlay = Overlay.of(context)!;
        overlay.insert(_menu);
      }
    }
  }

  /// Gets rid of the overlay if visible
  void delete() {
    if (menuBuilder.isBuilt && _menu.mounted) {
      _menu.remove();
    }
  }
}

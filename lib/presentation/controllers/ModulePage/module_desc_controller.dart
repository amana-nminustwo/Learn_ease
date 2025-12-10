import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleDescController extends GetxController {
  // currently pinned section
  var pinnedSection = ''.obs;

  // scroll controller
  final ScrollController scrollController = ScrollController();

  // keys for sections
  final strengthsKey = GlobalKey();
  final librariesKey = GlobalKey();

  // toggle pin & scroll
  void togglePin(String section) {
    if (pinnedSection.value == section) {
      pinnedSection.value = '';
    } else {
      pinnedSection.value = section;
      scrollToSection(section);
    }
  }

  // helper to get key by name
  GlobalKey getKeyForSection(String section) {
    switch (section) {
      case 'strengths':
        return strengthsKey;
      case 'libraries':
        return librariesKey;
      default:
        return GlobalKey();
    }
  }

  // smooth scroll to section using ScrollController
  void scrollToSection(String section) {
    final key = getKeyForSection(section);
    final context = key.currentContext;
    if (context != null) {
      // get the widget position
      final box = context.findRenderObject() as RenderBox;
      final yPosition = box.localToGlobal(Offset.zero).dy +
          scrollController.offset; // current scroll offset

      scrollController.animateTo(
        yPosition - 20, // optional padding from top
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();

    // Auto-scroll to last pinned section when page opens
    if (pinnedSection.value.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToSection(pinnedSection.value);
      });
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';


class GettingStartedController {
  final PageController pageController = PageController();
  final int totalSlides = 3;
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextSlide() {
    if (currentIndex.value < totalSlides - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToExplore(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Explore Page ')),
    );
  }

  void dispose() {
    pageController.dispose();
    currentIndex.dispose();
  }
}

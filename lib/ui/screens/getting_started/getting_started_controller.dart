import 'package:flutter/material.dart';
import 'package:mp_app/ui/screens/explore/explore_page.dart';

class GettingStartedController {
  final PageController pageController = PageController();
  final int totalSlides = 3;
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  
  final String title = 'Podkes';
  final String description =
      'A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.';
  final String imagePath = 'assets/images/podkes_girl.png';

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) =>  const ExplorePage()),
    );
  }

  void dispose() {
    pageController.dispose();
    currentIndex.dispose();
  }
}

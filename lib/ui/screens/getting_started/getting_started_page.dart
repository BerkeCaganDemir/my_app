import 'package:flutter/material.dart';
import 'package:mp_app/ui/components/arrow_button.dart';
import 'package:mp_app/ui/components/progress_segments.dart';
import 'getting_started_controller.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  final GettingStartedController _controller = GettingStartedController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              itemCount: _controller.totalSlides,
              onPageChanged: _controller.onPageChanged,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Spacer(flex: 2),

                    
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                      child: Image.asset(
                        _controller.imagePath,
                        width: size.width * 0.6,
                        height: size.width * 0.6 * 1.3,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 24),

                    
                    Text(
                      _controller.title,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        _controller.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width * 0.038,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    
                    ValueListenableBuilder<int>(
                      valueListenable: _controller.currentIndex,
                      builder: (context, current, _) {
                        return ProgressSegments(
                          total: _controller.totalSlides,
                          active: current,
                        );
                      },
                    ),

                    const Spacer(flex: 3),
                  ],
                );
              },
            ),

            
            Positioned(
              bottom: size.height * 0.08,
              left: size.width / 2 - 30,
              child: ArrowButton(
                onPressed: () {
                  if (_controller.currentIndex.value ==
                      _controller.totalSlides - 1) {
                    _controller.goToExplore(context);
                  } else {
                    _controller.nextSlide();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

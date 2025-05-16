import 'package:flutter/material.dart';
import 'package:mp_app/ui/components/explore_app_bar.dart';
import 'package:mp_app/ui/components/explore_search_bar.dart';
import 'package:mp_app/ui/components/explore_filter_chips.dart';
import 'package:mp_app/ui/components/trending_card.dart';
import 'explore_controller.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final ExploreController _controller = ExploreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1F1D2B),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 20),

              const ExploreAppBar(),
              const SizedBox(height: 24),

              const ExploreSearchBar(),
              const SizedBox(height: 16),

              ExploreFilterChips(
                filters: _controller.filters,
                selectedIndex: _controller.selectedFilterIndex,
                onSelected: (index) {
                  setState(() => _controller.selectFilter(index));
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Trending',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              GridView.builder(
                itemCount: _controller.trendingItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = _controller.trendingItems[index];
                  return TrendingCard(
                    title: item['title'],
                    subtitle: item['subtitle'],
                    imagePath: item['image'],
                    color: item['color'],
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Opening "${item['title']}"... (NowPlayingPage)'),
                          duration: const Duration(seconds: 2)
                        ),
                      );
                    }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

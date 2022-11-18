import 'package:flutter/material.dart';
import 'package:netflix_sample/core/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: ((context, int newIndex, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            selectedItemColor: Colors.white,
            backgroundColor: backgroundColor,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.collections_outlined),
                label: "New & Hot",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                label: "Fast Laugh",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_downward_rounded),
                label: "Downloads",
              ),
            ],
          );
        }));
  }
}

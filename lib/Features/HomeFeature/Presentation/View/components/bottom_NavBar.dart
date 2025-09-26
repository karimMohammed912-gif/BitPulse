import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.selectedIndex, required this.onItemTapped});
 final int selectedIndex;
 final ValueChanged<int> onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_rounded),
            label: 'Exchange',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'settings',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed
      );
  }
}
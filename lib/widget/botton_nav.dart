import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return BottomNavigationBar(
      currentIndex: bottomNavProvider.index,
      onTap: (newIndex) => bottomNavProvider.setIndex(newIndex),
      items: const [
        BottomNavigationBarItem(
          label: '글 목록',
          icon: Icon(Icons.list),
        ),
        BottomNavigationBarItem(
          label: '설정',
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

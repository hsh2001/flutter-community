import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/articles.dart';
import 'package:flutter_application_1/widget/botton_nav.dart';
import 'package:flutter_application_1/widget/setting.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_nav_provider.dart';

class FAButton extends StatelessWidget {
  const FAButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {},
      child: const Icon(Icons.add),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    Widget? floatingActionButton;
    Widget body = const Center(child: Text('Error...'));

    switch (bottomNavProvider.index) {
      case 0:
        body = const Articles();
        floatingActionButton = const FAButton();
        break;

      case 1:
        body = const Setting();
        break;
    }

    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Articles extends StatelessWidget {
  const Articles({Key? key}) : super(key: key);

  Widget _buildArticle({
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(222, 222, 222, 1),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(content),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.user == null) {
      return Column(
        children: [
          SafeArea(
            child: Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/login'),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    '로그인하고 많은 기능을 사용하세요.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          const Divider(),
          // ListView.builder(
          //   itemBuilder: (ctx, _) => _buildArticle(
          //     title: '.........',
          //     content: '.................................',
          //   ),
          // ),
        ],
      );
    }

    return ListView.builder(itemBuilder: (context, index) {
      return Text('$index');
    });
  }
}

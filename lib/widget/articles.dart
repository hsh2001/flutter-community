import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Articles extends StatelessWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.user == null) {
      return Column(
        children: [
          SafeArea(
            child: Center(
              child: ElevatedButton(
                onPressed: userProvider.login,
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
        ],
      );
    }

    return ListView.builder(itemBuilder: (context, index) {
      return Text('$index');
    });
  }
}

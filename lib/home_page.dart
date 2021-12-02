import 'package:flutter/material.dart';
import 'package:jokes_app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage() : super(key: const Key('HomePage'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          ListTile(
            title: const Text('Tell me a joke'),
            leading: const Icon(Icons.emoji_emotions_sharp),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => router.to(Routes.jokes),
          ),
        ],
      ),
    );
  }
}

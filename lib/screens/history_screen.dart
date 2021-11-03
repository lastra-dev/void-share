import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('History', style: Theme.of(context).textTheme.headline4),
                const Text('Nothing here yet'),
              ],
            ),
            Image.asset(
              'assets/images/flat_characters.webp',
              height: MediaQuery.of(context).size.height / 2.5,
            ),
          ],
        ),
      ),
    );
  }
}

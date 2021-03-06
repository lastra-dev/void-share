import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/custom_snack_bars.dart';

/// File uploaded screen.
class UploadedScreen extends StatelessWidget {
  const UploadedScreen({Key? key}) : super(key: key);
  static const routeName = '/uploaded';

  @override
  Widget build(BuildContext context) {
    /// Url can't be obtained from constructor because screen is a named route.
    final url = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        tooltip: 'Go Back',
        child: const Icon(Icons.arrow_back_rounded),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Upload done!',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Image.asset(
                  'assets/images/success.png',
                  height: MediaQuery.of(context).size.height / 2.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        url,
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      color: Colors.blue,
                      onPressed: () =>
                          Clipboard.setData(ClipboardData(text: url)).then((_) {
                        CustomSnackBars.showCustomSnackBar(
                          context,
                          'Link copied to your clipboard.',
                        );
                      }),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      color: Colors.blue,
                      onPressed: () => Share.share(url),
                    ),
                  ],
                ),
                const Text('You can find this link in your history too.'),
              ],
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

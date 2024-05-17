import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techm_interview/main.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async => appState.getNextQuote(),
          child: const Text('Next'),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        ElevatedButton(
            onPressed: () async {
              await Share.share(
                  "${appState.currentQuote.quote} - ${appState.currentQuote.author}");
            },
            child: const Text('Share')),
      ],
    );
  }
}

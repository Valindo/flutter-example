import 'package:flutter/material.dart';
import 'package:techm_interview/main.dart';
import 'package:provider/provider.dart';
import 'package:techm_interview/widgets/action_widets.dart';
import 'package:techm_interview/widgets/rating_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);
    final quoteStyle = theme.primaryTextTheme.bodyMedium;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Quotes',
                style: style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                appState.currentQuote.quote,
                style: quoteStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: ActionWidget(
                key: Key('action_widget'),
              ),
            ),

            RatingWidget(
              key: const Key('rating_widget'),
            ),
          ],
        ),
      ),
    );
  }
}

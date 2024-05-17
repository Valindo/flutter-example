import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:techm_interview/main.dart';

enum RatingValues { one, two, three }

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Set<RatingValues> segementedButtonSelection = <RatingValues>{};
    var appState = context.watch<AppState>();
    final theme = Theme.of(context);
    final ratingTextStyle =
        theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.primary);
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => theme.colorScheme.onPrimary),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text('Rate', style: ratingTextStyle)),
        SegmentedButton<RatingValues>(
          style: buttonStyle,
          multiSelectionEnabled: false,
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          selected: segementedButtonSelection,
          onSelectionChanged: (rating) {
            segementedButtonSelection = rating;
            switch (rating.first) {
              case RatingValues.one:
                appState.rate(1);
                break;
              case RatingValues.two:
                appState.rate(2);
                break;
              case RatingValues.three:
                appState.rate(3);
                break;
            }
          },
          segments: const [
            ButtonSegment<RatingValues>(
                value: RatingValues.one, label: Text('1')),
            ButtonSegment<RatingValues>(
                value: RatingValues.two, label: Text('2')),
            ButtonSegment<RatingValues>(
                value: RatingValues.three, label: Text('3')),
          ],
        )
      ],
    );
  }
}

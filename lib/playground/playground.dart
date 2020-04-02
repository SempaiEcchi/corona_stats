

import 'package:flutter/material.dart';
import 'package:wamf_playground/wamf_playground.dart';

class MealTrackrPlayground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Playground(
      title: 'Coronastats Playground',
      toys: [
        Toy(
          title: 'Example',
          issue: 'i-GR-3',
          issueUrl: 'www.google.com',
          tags: ['example'],
          disableScaffold: true,
          builder: (context) => Container(),
        ),

        spacerFlexText
      ],
    );
  }
}


ToyBox spacerFlexText = ToyBox(
  issue: 'i-MT-test',
  tags: ['widget'],
  authorEmail: 'leo.radocaj2@gmail.com',
  title: 'test page',
  toys: [
    Toy(
      title: 'test',
      resizable: true,
      disableScaffold: true,
      builder: (context) {
        return TestPage();
      },
    ),
  ],
);

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container();
  }
}

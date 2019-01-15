import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 170.0,
              floating: true,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                title: Text("Eat that Frog!"),
                centerTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
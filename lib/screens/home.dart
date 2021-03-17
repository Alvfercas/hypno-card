import 'package:flutter/material.dart';

import 'package:hypno_card/components/block_title.dart';
import 'package:hypno_card/components/hypno_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.touch_app_outlined),
            ),
            Text('Hypno Card'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlockTitle(),
            HypnoCard(
              height: 400,
              borderRadius: BorderRadius.circular(15),
              force: 1.1,
              decorationImage: DecorationImage(
                image: AssetImage('assets/img/image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

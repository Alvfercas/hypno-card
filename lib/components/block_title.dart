import 'package:flutter/material.dart';

class BlockTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'TOUCH',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        backgroundColor: Color(0xff7492b4),
                        fontWeight: FontWeight.normal,
                      ),
                ),
                TextSpan(text: ' TEST!', style: Theme.of(context).textTheme.headline5),
              ],
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'press on the image and start ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextSpan(
                text: 'moving ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextSpan(
                text: 'your finger',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

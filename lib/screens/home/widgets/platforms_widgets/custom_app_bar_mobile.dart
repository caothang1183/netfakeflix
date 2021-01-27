import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netfakeflix/common/assets.dart';

class CustomAppBarMobile extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBarMobile({
    Key key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarTexButton(label: "TV Shows", onTap: () {}),
                  _AppBarTexButton(label: "Movies", onTap: () {}),
                  _AppBarTexButton(label: "My List", onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarTexButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const _AppBarTexButton({
    Key key,
    @required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
      onTap: onTap,
    );
  }
}

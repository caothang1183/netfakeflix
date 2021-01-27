import 'package:flutter/material.dart';
import 'package:netfakeflix/models/models.dart';
import 'package:netfakeflix/screens/home/widgets/widgets.dart';

class ContentHeaderContainerMobile extends StatelessWidget {
  final Content featuredContent;

  const ContentHeaderContainerMobile({
    Key key,
    this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(icon: Icons.add, title: "List", onTap: () {}),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline, title: "Info", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () {},
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      color: Colors.white,
      icon: const Icon(Icons.play_arrow),
      label: const Text(
        "Play",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

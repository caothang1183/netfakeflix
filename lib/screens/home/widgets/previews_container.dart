import 'package:flutter/material.dart';
import 'package:netfakeflix/models/models.dart';

class PreviewsContainer extends StatelessWidget {
  final String title;
  final List<Content> previews;

  const PreviewsContainer({
    Key key,
    @required this.title,
    @required this.previews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: previews.length,
            itemBuilder: (context, index) {
              final Content content = previews[index];
              return _PreviewsItem(content: content);
            },
          ),
        ),
      ],
    );
  }
}

class _PreviewsItem extends StatelessWidget {
  final Content content;

  const _PreviewsItem({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 130.0,
            width: 130.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(content.imageUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: content.color, width: 4.0),
            ),
          ),
          Container(
            height: 130.0,
            width: 130.0,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black45,
                  Colors.black87,
                ],
                stops: [0, 0.25, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: content.color, width: 4.0),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 60.0,
              child: Image.asset(content.titleImageUrl),
            ),
          )
        ],
      ),
    );
  }
}

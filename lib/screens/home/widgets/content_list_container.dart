import 'package:flutter/material.dart';
import 'package:netfakeflix/models/models.dart';

class ContentListContainer extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentListContainer({
    Key key,
    @required this.title,
    @required this.contentList,
    this.isOriginals = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
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
            height: isOriginals ? 500.0 : 220.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final Content content = contentList[index];
                return _ContentListItem(
                  content: content,
                  isOriginals: isOriginals,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentListItem extends StatelessWidget {
  final Content content;
  final bool isOriginals;

  const _ContentListItem({
    Key key,
    @required this.content,
    @required this.isOriginals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: isOriginals ? 400.0 : 200.0,
        width: isOriginals ? 200.0 : 130.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(content.imageUrl),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}

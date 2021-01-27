import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfakeflix/cubits/cubits.dart';
import 'package:netfakeflix/data/fake_data.dart';
import 'package:netfakeflix/screens/home/widgets/widgets.dart';
import 'package:netfakeflix/screens/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        BlocProvider.of<AppBarCubit>(context)
            .setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, state) {
            return Responsive(
              mobile: CustomAppBarMobile(
                scrollOffset: state,
              ),
              desktop: CustomAppBarDesktop(
                scrollOffset: state,
              ),
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Responsive(
                mobile: ContentHeaderContainerMobile(
                  featuredContent: sintelContent,
                ),
                desktop: ContentHeaderContainerDesktop(
                  featuredContent: sintelContent,
                )),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: PreviewsContainer(
                key: PageStorageKey("previewsContainerKey"),
                title: "Previews",
                previews: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentListContainer(
              key: PageStorageKey("myListKey"),
              title: "My List",
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentListContainer(
              key: PageStorageKey("originalsKey"),
              title: "Netfakeflix Originals",
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentListContainer(
                key: PageStorageKey("trendingKey"),
                title: "Trending",
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 80,
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Icon(Icons.menu),
                    )
                  ],
                  bottom: PreferredSize(
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    preferredSize: Size.fromHeight(10),
                  ),
                  backgroundColor: Color(0xff1C1F2E),
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/item1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getProfileHeader(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarViewDelegate(
                    TabBar(
                      indicatorColor: Color(0xffF35383),
                      indicatorWeight: 3,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(child: Image.asset('images/icon_tab_posts.png')),
                        Tab(child: Image.asset('images/icon_tab_bookmark.png')),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('images/item$index.png'),
                          ),
                        );
                      }, childCount: 10),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('images/item$index.png'),
                          ),
                        );
                      }, childCount: 10),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ])),
      ),
    );
  }

  Widget _getProfileHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffF35383),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/profile.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Arsham Rezakhani",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "GB",
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "arsham123",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "GB",
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png')
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
      height: _tabBar.preferredSize.height,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

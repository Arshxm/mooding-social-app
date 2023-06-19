import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getSearchBar(),
          ),
          SliverToBoxAdapter(
            child: _getCategoryList(),
          ),
          SliverGrid(
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
          )
        ],
      )),
    );
  }

  Widget _getSearchBar() {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
        left: 18,
        right: 18,
      ),
      height: 46,
      decoration: BoxDecoration(
          color: Color(0xff272840), borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset('images/icon_search.png'),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GR',
                ),
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontFamily: 'GR',
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset("images/icon_scan.png")
          ],
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      height: 23,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xff272840),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: Text(
                    "Salam bar to",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "GM",
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

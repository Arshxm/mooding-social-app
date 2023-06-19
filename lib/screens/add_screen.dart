import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      EdgeInsets.only(left: 17, right: 17, bottom: 15, top: 80),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      width: 394,
                      height: 375,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                              fit: BoxFit.cover, 'images/moon_image.jpg')),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 17,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                              fit: BoxFit.cover, "images/item$index.png"),
                        ),
                      );
                    }, childCount: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3,
                    ),
                  ),
                )
              ],
            ),
            _getAppbarContent(),
            _getFooter(),
          ],
        ),
      ),
    );
  }

  Widget _getFooter() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xff272B40),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Draft",
                style: TextStyle(
                    fontFamily: "GB", color: Color(0xffF35383), fontSize: 16),
              ),
              Text(
                "Gallery",
                style: TextStyle(
                    fontFamily: "GB", color: Colors.white, fontSize: 16),
              ),
              Text(
                "Take",
                style: TextStyle(
                    fontFamily: "GB", color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAppbarContent() {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Color(0xff1C1F2E)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                Text(
                  "Post",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "GB",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset("images/icon_arrow_down.png")
              ],
            ),
            Row(
              children: [
                Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "GB",
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset("images/icon_arrow_right_box.png"),
                SizedBox(
                  width: 17,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

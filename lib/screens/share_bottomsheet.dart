import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.6,
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                height: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: _getContent(scrollController),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getContent(ScrollController scrollController) {
    // return GridView.builder(
    //     controller: scrollController,
    //     itemCount: 28,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisSpacing: 20,
    //       mainAxisSpacing: 20,
    //       crossAxisCount: 4,
    //     ),
    //     itemBuilder: (BuildContext context, index) {
    //       return Container(
    //         color: Colors.black,
    //       );
    //     });
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Share",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'GB',
                        ),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png')
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 46,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        borderRadius: BorderRadius.circular(13)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset('images/icon_search.png'),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search...",
                                hintStyle: TextStyle(
                                  fontFamily: 'GR',
                                  color: Colors.white,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 100,
                (context, index) {
                  return _getGridItems();
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 120),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 90),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 13,
              ),
              child: Text(
                "Send",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getGridItems() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            child: Image.asset('images/profile.png'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Arsham Rezakhani",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "GB",
          ),
        )
      ],
    );
  }
}

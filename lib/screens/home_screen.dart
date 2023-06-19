import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff1C1F2E),
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 4,
                (context, index) {
                  return _getPost(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 100,
        child: Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: ((context, index) {
                return SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      index == 0 ? _getAddStory() : _getStoryPicture()
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }

  Widget _getPostList() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getPost(context);
            },
            childCount: 4,
          ),
        )
      ],
    );
  }

  Widget _getPost(context) {
    return Column(
      children: [
        _getPostHeader(),
        SizedBox(
          height: 24,
        ),
        Container(
          width: 394,
          height: 440,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(
                      'images/post_cover.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Image.asset('images/icon_video.png'),
              ),
              Positioned(
                bottom: 15,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
                    child: Container(
                      width: 340,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5),
                            Color.fromRGBO(255, 255, 255, 0.2)
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset('images/icon_hart.png'),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '2.6 K',
                                style: TextStyle(
                                    fontFamily: 'GB',
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 42,
                              ),
                              Image.asset('images/icon_comments.png'),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '1.5 K',
                                style: TextStyle(
                                    fontFamily: 'GB',
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 42,
                          ),
                          InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ShareBottomSheet();
                                  },
                                );
                              },
                              child: Image.asset('images/icon_share.png')),
                          SizedBox(
                            width: 42,
                          ),
                          Image.asset('images/icon_save.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _getAddStory() {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Image.asset('images/icon_plus.png'),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Your Story',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _getProfilePicture() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      dashPattern: [40, 10],
      strokeWidth: 2,
      color: Color(0xffF35383),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryPicture() {
    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(17),
          padding: EdgeInsets.all(4),
          dashPattern: [40, 10],
          strokeWidth: 2,
          color: Color(0xffF35383),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: Container(
              height: 58,
              width: 58,
              child: Image.asset('images/profile.png'),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text('test', style: TextStyle(color: Colors.white))
      ],
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18, top: 12),
      child: Row(
        children: [
          _getProfilePicture(),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ArshamRezakhani',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'software developer',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'GR', fontSize: 12),
                )
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }
}

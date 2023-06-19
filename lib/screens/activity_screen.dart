import 'package:flutter/material.dart';
import 'package:instagram_clone/model/enums/activity_status.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: "GB",
                ),
                indicatorColor: Color(0xffF35383),
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSample(),
                  _getSample(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration:
                BoxDecoration(color: Color(0xffF35383), shape: BoxShape.circle),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/item8.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "ArshamRezakhani",
                    style: TextStyle(
                      fontFamily: "GB",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Started Following",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "You",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "7 min",
                    style: TextStyle(
                      fontFamily: "GB",
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getSample(){
    return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 30,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            "New",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return _getRow(ActivityStatus.likes);
                        }, childCount: 2),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 30,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            "Today",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return _getRow(ActivityStatus.followBack);
                        }, childCount: 3),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 30,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            "This Week",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return _getRow(ActivityStatus.following);
                        }, childCount: 10),
                      )
                    ],
                  );
  }
  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item4.png'),
            ),
          ),
        );
      case ActivityStatus.followBack:
        return ElevatedButton(
          onPressed: () {},
          child: Text("Follow"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(fontFamily: 'GB', fontSize: 16),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            "Message",
            style: TextStyle(
              fontSize: 12,
              fontFamily: "GB",
              color: Color(0xffC5C5C5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            "Message",
            style: TextStyle(
              fontSize: 12,
              fontFamily: "GB",
              color: Color(0xffC5C5C5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
            ),
          ),
        );
    }
  }
}

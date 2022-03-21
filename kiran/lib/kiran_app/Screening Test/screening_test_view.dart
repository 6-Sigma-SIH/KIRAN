import 'package:kiran/kiran_app/ui_view/test_screen_card.dart';
import 'package:kiran/kiran_app/ui_view/glass_view.dart';
import 'package:kiran/kiran_app/ui_view/mediterranean_diet_view.dart';
import 'package:kiran/kiran_app/ui_view/title_view.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/kiran_app/Screening Test/meals_list_view.dart';
import 'package:kiran/kiran_app/Screening Test/water_view.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 9;

    // listViews.add(
    //   TitleView(
    //     titleTxt: 'Mediterranean diet',
    //     subTxt: 'Details',
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController!,
    //         curve: const Interval((1 / count) * 0, 1.0,
    //             curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController!,
    //   ),
    // );
    // listViews.add(
    //   MediterranesnDietView(
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController!,
    //         curve: const Interval((1 / count) * 1, 1.0,
    //             curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController!,
    //   ),
    // );
    // listViews.add(
    //   TitleView(
    //     titleTxt: 'Meals today',
    //     subTxt: 'Customize',
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController!,
    //         curve: const Interval((1 / count) * 2, 1.0,
    //             curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController!,
    //   ),
    // );

    // listViews.add(
    //   MealsListView(
    //     mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
    //         CurvedAnimation(
    //             parent: widget.animationController!,
    //             curve: const Interval((1 / count) * 3, 1.0,
    //                 curve: Curves.fastOutSlowIn))),
    //     mainScreenAnimationController: widget.animationController,
    //   ),
    // );

    listViews.add(
      TitleView(
        titleTxt: 'Anxiety',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 4, 1.0,
                curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/anxiety');
        },
        child: TestScreenCardView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: widget.animationController!,
              curve: const Interval((1 / count) * 5, 1.0,
                  curve: Curves.fastOutSlowIn),
            ),
          ),
          animationController: widget.animationController!,
          testTitle: 'Anxiety',
          minTime: 20,
          testStatus: 70,
          lastOpened: '18/03/2022 14:50',
          score: 90,
          questions: 7,
        ),
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Depression',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 6, 1.0,
                curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/depression');
        },
        child: TestScreenCardView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: widget.animationController!,
              curve: const Interval((1 / count) * 5, 1.0,
                  curve: Curves.fastOutSlowIn),
            ),
          ),
          animationController: widget.animationController!,
          testTitle: 'Depression',
          minTime: 30,
          testStatus: 100,
          lastOpened: 'Today 14:50',
          score: 40,
          questions: 9,
        ),
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'ADHD',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 6, 1.0,
                curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adhd');
        },
        child: TestScreenCardView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: widget.animationController!,
              curve: const Interval((1 / count) * 5, 1.0,
                  curve: Curves.fastOutSlowIn),
            ),
          ),
          animationController: widget.animationController!,
          testTitle: 'ADHD',
          minTime: 10,
          testStatus: 100,
          lastOpened: 'Today 14:50',
          score: 20,
          questions: 18,
        ),
      ),
    );
    // listViews.add(
    //   WaterView(
    //     mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
    //         CurvedAnimation(
    //             parent: widget.animationController!,
    //             curve: const Interval((1 / count) * 7, 1.0,
    //                 curve: Curves.fastOutSlowIn))),
    //     mainScreenAnimationController: widget.animationController!,
    //   ),
    // );
    // listViews.add(
    //   GlassView(
    //       animation: Tween<double>(begin: 0.0, end: 1.0).animate(
    //           CurvedAnimation(
    //               parent: widget.animationController!,
    //               curve: const Interval((1 / count) * 8, 1.0,
    //                   curve: Curves.fastOutSlowIn))),
    //       animationController: widget.animationController!),
    // );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KiranAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: KiranAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: KiranAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10, right: 10, bottom: 15),
                                child: Text(
                                  'Screening Test',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: KiranAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: KiranAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              // child: InkWell(
                              //   highlightColor: Colors.transparent,
                              //   borderRadius: const BorderRadius.all(
                              //       Radius.circular(32.0)),
                              //   onTap: () {},
                              //   child: const Center(
                              //     child: Icon(
                              //       Icons.keyboard_arrow_left,
                              //       color: KiranAppTheme.grey,
                              //     ),
                              //   ),
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 7, right: 0),
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/calendar');
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.calendar_today,
                                          color: KiranAppTheme.grey,
                                          size: 19,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text(
                                  //   'Book',
                                  //   textAlign: TextAlign.left,
                                  //   style: TextStyle(
                                  //     fontFamily: KiranAppTheme.fontName,
                                  //     fontWeight: FontWeight.normal,
                                  //     fontSize: 18,
                                  //     letterSpacing: -0.2,
                                  //     color: KiranAppTheme.darkerText,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              // child: InkWell(
                              //   highlightColor: Colors.transparent,
                              //   borderRadius: const BorderRadius.all(
                              //       Radius.circular(32.0)),
                              //   onTap: () {},
                              //   child: const Center(
                              //     child: Icon(
                              //       Icons.keyboard_arrow_right,
                              //       color: KiranAppTheme.grey,
                              //     ),
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

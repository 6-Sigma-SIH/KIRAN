import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:kiran/kiran_app/ui_view/title_view.dart';
import 'package:kiran/kiran_app/ui_view/contact_card_view.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
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

    listViews.add(
      TitleView(
        titleTxt: 'Contact Doctors and Helplines',
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
      ContactView(
        titleTxt: 'KIRAN',
        subTxt:
            'A national 24/7 toll free helpline launched by the Ministry of Social Justice and Empowerment to help people with suicidal thoughts, depression and other mental health issues.',
        phone: '1800-599-0019',
        availability: '24/7 Helpline',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ContactView(
        titleTxt: 'SUMAITRI',
        subTxt:
            'A crisis intervention centre for the depressed, distressed and suicidal. The Helpline provides unconditional and unbiased emotional support to callers, visitors or those who write in.',
        phone: '1800-599-0019',
        availability: '24/7 Helpline',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ContactView(
        titleTxt: 'SAHAI',
        subTxt:
            'A service by Medico Pastoral Association (MPA) run by trained active volunteers. For face to face counselling, they are referred to MPA counsellors who are fully trained.',
        phone: '1800-599-0019',
        availability: '24/7 Helpline',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ContactView(
        titleTxt: 'EXAM HELPLINE',
        subTxt:
            'The number is for students or parents with queries related to stress, mental wellbeing, exam tips or even to consult a team of experts and behavioral psychologists.',
        phone: '1800-599-0019',
        availability: '24/7 Helpline',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ContactView(
        titleTxt: 'NIMHANS',
        subTxt:
            'This is a helpline for anyone experiencing mental health distress during the COVID 19 crisis by National Institute of Mental Health & Neuro Sciences Bengaluru.',
        phone: '1800-599-0019',
        availability: '24/7 Helpline',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: widget.animationController,
      ),
    );
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
                                    left: 10.0, top: 6, right: 10, bottom: 6),
                                child: Text(
                                  'Contact',
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

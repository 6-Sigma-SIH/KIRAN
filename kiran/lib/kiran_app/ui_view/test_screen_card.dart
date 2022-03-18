// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';

class TestScreenCardView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  var testTitle = "";
  int score = 0;
  int questions = 0;
  int minTime = 0;
  var testStatus = 0;
  var lastOpened = "";
  // last opened date and time

  TestScreenCardView({
    required this.testTitle,
    required this.score,
    required this.questions,
    required this.minTime,
    required this.testStatus,
    required this.lastOpened,
    this.animationController,
    this.animation,
  });

  // const TestScreenCardView({Key? key, this.animationController, this.animation})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: KiranAppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: KiranAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 4, bottom: 8, top: 16),
                            child: Text(
                              testTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: KiranAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.1,
                                  color: KiranAppTheme.darkText),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4, bottom: 3),
                                    child: Text(
                                      '$score',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        color: KiranAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8, bottom: 8),
                                    child: Text(
                                      'out of $score',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        letterSpacing: -0.2,
                                        color: KiranAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color:
                                            KiranAppTheme.grey.withOpacity(0.5),
                                        size: 16,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Text(
                                          lastOpened,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: KiranAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            color: KiranAppTheme.grey
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4, bottom: 14),
                                    child: Text(
                                      'Last Opened',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: KiranAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: KiranAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '$questions',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: KiranAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                    color: KiranAppTheme.darkText,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    'Questions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: KiranAppTheme.fontName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color:
                                          KiranAppTheme.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '$minTime',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: KiranAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Text(
                                        'minutes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: KiranAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: KiranAppTheme.grey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '$testStatus %',
                                      style: TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.2,
                                        color: KiranAppTheme.darkText,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Test Status',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: KiranAppTheme.fontName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: KiranAppTheme.grey
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

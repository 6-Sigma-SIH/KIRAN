// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';

class PrevAssessmentCard extends StatelessWidget {
  // final AnimationController? animationController;
  // final Animation<double>? animation;

  var testTitle = "";
  int? score = 0;
  String? result = "";
  String? interpretation = "";
  var testTaken = "";

  // last opened date and time

  PrevAssessmentCard({
    required this.testTitle,
    this.score,
    this.result,
    this.interpretation,
    required this.testTaken,
  });

  // const PrevAssessmentCard({Key? key, this.animationController, this.animation})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    var questions;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 8, top: 14),
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
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: Text(
                                  'Score: $score',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: KiranAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32,
                                    color: KiranAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       EdgeInsets.only(left: 8, bottom: 8, top: 8),
                              //   child: Text(
                              //     'Something here',
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //       fontFamily: KiranAppTheme.fontName,
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 18,
                              //       letterSpacing: -0.2,
                              //       color: KiranAppTheme.nearlyDarkBlue,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    color: KiranAppTheme.grey.withOpacity(0.5),
                                    size: 16,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Text(
                                      testTaken,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        color:
                                            KiranAppTheme.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: EdgeInsets.only(top: 4, bottom: 14),
                                child: Text(
                                  'Date',
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
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: KiranAppTheme.background,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$result',
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
                                'Indicates: $interpretation',
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: KiranAppTheme.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: KiranAppTheme.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

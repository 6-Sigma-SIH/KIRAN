// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kiran/kiran_app/kiran_app_theme.dart';
import '../ui_view/contact_card_view.dart';
import 'pa_card_view.dart';

class PreviousAssessment extends StatefulWidget {
  const PreviousAssessment({Key? key}) : super(key: key);

  @override
  State<PreviousAssessment> createState() => _PreviousAssessmentState();
}

class _PreviousAssessmentState extends State<PreviousAssessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Previous Assessment',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: KiranAppTheme.fontName,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  thickness: 0.5,
                  height: 20,
                  color: KiranAppTheme.nearlyDarkBlue,
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                child: PrevAssessmentCard(
                  testTitle: 'Anxiety Assessment',
                  score: 10,
                  testTaken: '10/10/2020',
                  interpretation:
                      'Slight Anxiety includes occasional feelings of a sense of uneasiness or nervousness which are considered normal.',
                  result: 'Minimum to Null Anxiety',
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: PrevAssessmentCard(
                  testTitle: 'Depression Assessment',
                  score: 9,
                  testTaken: '10/07/2020',
                  interpretation:
                      'Watch out for the signs of depression. Depression is a condition in which the mind feels unhappy, depressed, or hopeless. Watch out for the signs of depression. Depression is a condition in which the mind feels unhappy, depressed, or hopeless.',
                  result: 'Mild Depression',
                ),
              ),
              SizedBox(width: 16),

              //   Padding(
              //     padding: const EdgeInsets.only(left: 18, right: 18),
              //     child: Column(
              //       children: [
              //         Padding(
              //             padding: const EdgeInsets.only(
              //                 left: 24, right: 24, bottom: 16, top: 6),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 color: KiranAppTheme.white,
              //                 borderRadius: const BorderRadius.only(
              //                     topLeft: Radius.circular(12.0),
              //                     bottomLeft: Radius.circular(12.0),
              //                     bottomRight: Radius.circular(12.0),
              //                     topRight: Radius.circular(12.0)),
              //                 boxShadow: <BoxShadow>[
              //                   BoxShadow(
              //                       color: KiranAppTheme.grey.withOpacity(0.4),
              //                       offset: const Offset(1.1, 1.1),
              //                       blurRadius: 10.0),
              //                 ],
              //               ),
              //               child: Material(
              //                 color: Colors.transparent,
              //                 child: InkWell(
              //                   focusColor: Colors.transparent,
              //                   highlightColor: Colors.transparent,
              //                   hoverColor: Colors.transparent,
              //                   borderRadius:
              //                       const BorderRadius.all(Radius.circular(8.0)),
              //                   splashColor:
              //                       KiranAppTheme.nearlyDarkBlue.withOpacity(0.2),
              //                   onTap: () {
              //                     // UrlLauncher.launch("tel:$phone");
              //                   },
              //                   child: Expanded(
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(10),
              //                       child: Column(
              //                         children: <Widget>[
              //                           Padding(
              //                             padding: const EdgeInsets.only(
              //                                 top: 8, left: 6, right: 6),
              //                             child: Text(
              //                               "ABC",
              //                               textAlign: TextAlign.center,
              //                               style: const TextStyle(
              //                                 fontFamily: KiranAppTheme.fontName,
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: 18,
              //                                 letterSpacing: 0.1,
              //                                 color: KiranAppTheme.nearlyDarkBlue,
              //                               ),
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding: const EdgeInsets.only(
              //                                 top: 8, left: 6, right: 6),
              //                             child: Text(
              //                               "ABC",
              //                               textAlign: TextAlign.center,
              //                               style: const TextStyle(
              //                                 fontFamily: KiranAppTheme.fontName,
              //                                 fontWeight: FontWeight.w300,
              //                                 fontSize: 14,
              //                                 letterSpacing: 0.1,
              //                                 color: KiranAppTheme.darkerText,
              //                               ),
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding: const EdgeInsets.only(
              //                                 top: 8, left: 6, right: 6),
              //                             child: Text(
              //                               "ABC",
              //                               textAlign: TextAlign.center,
              //                               style: const TextStyle(
              //                                 fontFamily: KiranAppTheme.fontName,
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: 14,
              //                                 fontStyle: FontStyle.italic,
              //                                 letterSpacing: 0.1,
              //                                 color: KiranAppTheme.nearlyDarkBlue,
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             )),
              //       ],
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

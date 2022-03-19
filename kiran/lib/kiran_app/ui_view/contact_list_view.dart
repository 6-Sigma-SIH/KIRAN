// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../kiran_app_theme.dart';

class AreaListView extends StatefulWidget {
  const AreaListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<String> areaListTitle = <String>[
    'KIRAN',
    'SUMAITRI',
    'SAHAI',
    'EXAM HELPLINE',
    'NIMHANS',
  ];
  List<String> areaListDescription = <String>[
    'A national 24/7 toll free helpline launched by the Ministry of Social Justice and Empowerment to help people with suicidal thoughts, depression and other mental health issues.',
    'A crisis intervention centre for the depressed, distressed and suicidal. The Helpline provides unconditional and unbiased emotional support to callers, visitors or those who write in.',
    'A service by Medico Pastoral Association (MPA) run by trained active volunteers. For face to face counselling, they are referred to MPA counsellors who are fully trained.',
    'The number is for students or parents with queries related to stress, mental wellbeing, exam tips or even to consult a team of experts and behavioral psychologists.',
    'This is a helpline for anyone experiencing mental health distress during the COVID 19 crisis by National Institute of Mental Health & Neuro Sciences Bengaluru.',
  ];
  List<String> areaListAvailability = <String>[
    '24/7 Helpline',
    '24/7 Helpline',
    '24/7 Helpline',
    '24/7 Helpline',
    '24/7 Helpline',
  ];
  List<String> areaListNumber = <String>[
    '1800-599-0019',
    '+91 1234567890',
    '+91 1234567890',
    '+91 1234567890',
    '+91 1234567890',
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              30 * (1.0 - widget.mainScreenAnimation!.value),
              0.0,
            ),
            child: Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8,
                  ),
                  child: GridView(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 12,
                      bottom: 12,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(
                      areaListTitle.length,
                      (int index) {
                        animationController?.forward();
                        return AreaView(
                          title: areaListTitle[index],
                          description: areaListDescription[index],
                          phone_number: areaListNumber[index],
                          availability: areaListAvailability[index],
                        );
                      },
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 0.7,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView({
    Key? key,
    this.title,
    this.description,
    this.phone_number,
    this.availability,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? phone_number;
  final String? availability;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: KiranAppTheme.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: KiranAppTheme.grey.withOpacity(0.4),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            splashColor: KiranAppTheme.nearlyDarkBlue.withOpacity(0.2),
            onTap: () {
              UrlLauncher.launch("tel:$phone_number");
            },
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: KiranAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.1,
                        color: KiranAppTheme.darkerText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                    child: Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: KiranAppTheme.fontName,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 0.1,
                        color: KiranAppTheme.darkerText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                    child: Text(
                      availability!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: KiranAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.1,
                        color: KiranAppTheme.darkerText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

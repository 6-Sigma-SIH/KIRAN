import 'package:kiran/main.dart';
import 'package:flutter/material.dart';
import '../kiran_app_theme.dart';

class DiaryView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String subheading;
  final String heading;
  final Function()? onClick;

  const DiaryView(
      {Key? key,
      required this.onClick,
      this.animationController,
      this.animation,
      required this.subheading,
      required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    KiranAppTheme.nearlyDarkBlue,
                    HexColor("#6F56E8")
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: KiranAppTheme.grey.withOpacity(0.6),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: InkWell(
                  onTap: onClick,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '$subheading',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: KiranAppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            color: KiranAppTheme.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            '$heading',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: KiranAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              color: KiranAppTheme.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // const Padding(
                              //   padding: EdgeInsets.only(left: 4),
                              //   child: Icon(
                              //     Icons.timer,
                              //     color: KiranAppTheme.white,
                              //     size: 16,
                              //   ),
                              // ),
                              // const Padding(
                              //   padding: EdgeInsets.only(left: 4.0),
                              //   child: Text(
                              //     '68 min',
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //       fontFamily: KiranAppTheme.fontName,
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 14,
                              //       letterSpacing: 0.0,
                              //       color: KiranAppTheme.white,
                              //     ),
                              //   ),
                              // ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: KiranAppTheme.nearlyWhite,
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: KiranAppTheme.nearlyBlack
                                            .withOpacity(0.4),
                                        offset: const Offset(8.0, 8.0),
                                        blurRadius: 8.0),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: HexColor("#6F56E8"),
                                    size: 44,
                                  ),
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
            ),
          ),
        );
      },
    );
  }
}

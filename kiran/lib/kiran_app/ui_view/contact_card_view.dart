import 'package:kiran/kiran_app/kiran_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final String phone;
  final String availability;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ContactView(
      {Key? key,
      this.titleTxt = "",
      this.subTxt = "",
      this.phone = "",
      this.availability = "",
      this.animationController,
      this.animation})
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
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 16, top: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: KiranAppTheme.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topRight: Radius.circular(12.0)),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            splashColor:
                                KiranAppTheme.nearlyDarkBlue.withOpacity(0.2),
                            onTap: () {
                              UrlLauncher.launch("tel:$phone");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 6, right: 6),
                                    child: Text(
                                      titleTxt,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        letterSpacing: 0.1,
                                        color: KiranAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 6, right: 6),
                                    child: Text(
                                      subTxt,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        letterSpacing: 0.1,
                                        color: KiranAppTheme.darkerText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 6, right: 6),
                                    child: Text(
                                      availability,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: KiranAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 0.1,
                                        color: KiranAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

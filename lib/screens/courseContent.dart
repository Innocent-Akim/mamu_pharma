import 'package:flutter/material.dart';
import 'package:mamusoft/util/constants.dart';

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 1, bottom: 1),
      child: Material(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            children: <Widget>[
              Text(
                number,
                style: kHeadingextStyle.copyWith(
                  color: kTextColor.withOpacity(.15),
                  fontSize: 32,
                ),
              ),
              SizedBox(width: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$duration mins\n",
                      style: TextStyle(
                        color: kTextColor.withOpacity(.5),
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: kSubtitleTextSyule.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kGreenColor.withOpacity(isDone ? 1 : .5),
                  ),
                  child: Icon(Icons.play_arrow, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalButton extends StatelessWidget {
  final String? text;
  final int textColor;
  final int? fillColor;
  final Function? callback;
  final double textSize;
  CalButton(
      {Key? key,
      this.text,
      this.textColor = 0xffffffff,
      this.fillColor,
      this.textSize = 24,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(
          color: fillColor != null ? Color(fillColor!) : null,
          textColor: Color(textColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text!,
            style: GoogleFonts.rubik(
              fontSize: textSize,
            ),
          ),
          onPressed: () {
            callback!(text);
          },
        ),
      ),
    );
  }
}

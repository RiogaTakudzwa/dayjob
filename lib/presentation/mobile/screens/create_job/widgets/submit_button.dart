import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constraints/colour_scheme.dart';
import '../../../../../common/constraints/screen_constraits.dart';
import '../../../../../common/widgets/text/title_text.dart';

class SubmitButton extends StatefulWidget {
  final String text;
  final Function() submit;

  const SubmitButton({
    super.key,
    required this.text,
    required this.submit,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        widget.submit;
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: screenWidth * ScreenConstraints().screenPaddingSides,
          right: screenWidth * ScreenConstraints().screenPaddingSides,
        ),
        height: screenHeight * ScreenConstraints().buttonHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          color: ColourScheme.mainAppTheme,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
         widget.text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            fontFamily: "NanumGothic"
          ),
        ),
      ),
    );
  }
}

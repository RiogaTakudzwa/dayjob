import 'package:flutter/cupertino.dart';

import '../../constraints/colour_scheme.dart';

class TitleText extends StatefulWidget {
  final String text;
  const TitleText({
    super.key,
    required this.text
  });

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: ColourScheme.mainAppTheme,
        fontWeight: FontWeight.bold,
        wordSpacing: 2,
        fontSize: 20,
        fontFamily: "NanumGothic"
      )
    );
  }

}

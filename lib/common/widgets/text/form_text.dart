import 'package:flutter/cupertino.dart';

import '../../constraints/colour_scheme.dart';

class FormText extends StatefulWidget {
  final String text;

  const FormText({
    super.key,
    required this.text
  });

  @override
  State<FormText> createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: ColourScheme.mainAppTheme,
          fontSize: 12,
          fontFamily: "NanumGothic"
      )
    );
  }

}

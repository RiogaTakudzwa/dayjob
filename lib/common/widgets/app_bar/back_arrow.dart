import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constraints/colour_scheme.dart';

class BackArrow extends StatefulWidget {
  final Function() onTap;
  final bool active;

  const BackArrow({
    super.key,
    required this.onTap,
    required this.active
  });

  @override
  State<BackArrow> createState() => _BackArrowState();
}

class _BackArrowState extends State<BackArrow> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onTap,
      icon: Icon(
        size: 15,
        Icons.arrow_back_outlined,
        color: widget.active ? ColourScheme.mainAppTheme : Colors.white,
      )
    );
  }
}

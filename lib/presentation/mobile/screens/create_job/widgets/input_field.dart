import 'package:dayjob/domain/process_jobs/process_jobs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool canBeEmpty;
  final String hintText;

  const TextInputField({
    super.key,
    required this.textEditingController,
    required this.canBeEmpty,
    required this.hintText,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessJobsBloc, ProcessJobsState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black),
          controller: widget.textEditingController,
          obscureText: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
            //Before Text field Clicked
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            //After text-field Clicked
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (textController) =>
          textController != null && textController.isEmpty && widget.canBeEmpty ?
          "This field cannot be Empty" : null,
        );
      },
    );
  }
}

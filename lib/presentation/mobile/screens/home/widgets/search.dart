import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchArea extends StatefulWidget {
  final TextEditingController searchTextEditingController;

  const SearchArea({
    super.key,
    required this.searchTextEditingController
  });

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value){

      },
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.black),
      controller: widget.searchTextEditingController,
      obscureText: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: "Search",
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
    );
  }
}

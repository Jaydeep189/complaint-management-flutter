import 'dart:ffi';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownSearch extends StatefulWidget {
  List items = [];
  String lableText = "";
  String stateVar = "";
  final Function(String val) changeFunction;
  DropDownSearch(
      {super.key,
      required this.items,
      required this.lableText,
      required this.changeFunction});

  @override
  State<DropDownSearch> createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<dynamic>(
      items: widget.items,
      onChanged: (value) => widget.changeFunction(value!),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(labelText: widget.lableText),
      ),
      popupProps: const PopupProps.modalBottomSheet(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
      ),
    );
  }
}

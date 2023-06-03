import 'dart:core';
import 'package:flutter/material.dart';

class BaseDropdownFormField<T> extends StatefulWidget {
  final void Function(T?)? onChanged;
  final T? initialValue;
  final InputDecoration? decoration;
  final List<DropdownMenuItem<T>> items;

  const BaseDropdownFormField({
    Key? key,
    this.initialValue,
    this.decoration,
    this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  State<BaseDropdownFormField<T>> createState() => _BaseDropdownFormField<T>();
}

class _BaseDropdownFormField<T> extends State<BaseDropdownFormField<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    try {
      return DropdownButtonFormField<T>(
        decoration: widget.decoration,
        icon: const Icon(Icons.arrow_drop_down),
        items: widget.items,
        onChanged: (T? value) {
          setState(() {
            selectedValue = value;
          });
          if (widget.onChanged != null) widget.onChanged!(value);
        },
        value: selectedValue,
      );
    } catch (error) {
      return Text(error.toString());
    }
  }
}

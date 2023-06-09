import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextFormField extends StatefulWidget {
  final void Function(String?, bool)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final int maxLines;
  final int? minLines;
  final String? initialValue;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;
  final TextEditingController? controller;
  final int? maxLength;
  final Widget? widget;

  const BaseTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.decoration,
    this.maxLines = 1,
    this.minLines,
    this.initialValue,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.enabled = true,
    this.controller,
    this.widget,
    this.maxLength,
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormField();
}

class _BaseTextFormField extends State<BaseTextFormField> {
  late final TextEditingController _controller;
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.initialValue ?? '';
    _controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: _controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: widget.decoration == null
          ? InputDecoration(errorText: _validator(_controller.text))
          : widget.decoration!.copyWith(
              errorText: _validator(_controller.text),
            ),
      validator: _validator,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  void _onChanged() {
    setState(() {
      _touched = true;
      String value = _controller.text;
      if (widget.onChanged != null) widget.onChanged!(value, _isValid());
    });
  }

  bool _isValid() => null == _validator(_controller.text);

  String? _validator(String? value) {
    if (!_touched) return null;
    if (widget.validator == null) {
      return null;
    } else {
      return widget.validator!(value);
    }
  }
}

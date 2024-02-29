import 'package:flutter/material.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/infrastructure/utils/styles.dart';

class CTextField extends StatefulWidget {
  const CTextField({
    super.key,
    this.fillColor = AppColors.greyDark,
    this.focusColor = AppColors.focusedField,
    this.hintText,
    this.cursorColor = Colors.white,
    required this.controller,
    required this.onChanged,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.errorTextStyle,
    this.prefix = const SizedBox(width: 16),
    this.style,
  });
  final ValueChanged<String>? onChanged;
  final Color? fillColor;
  final Color? focusColor;
  final String? hintText;
  final Color? cursorColor;
  final TextEditingController controller;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextStyle? errorTextStyle;
  final Widget prefix;
  final TextStyle? style;
  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  late FocusNode _myFocusNode;
  final ValueNotifier<bool> _myFocusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _myFocusNode = FocusNode();
    _myFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _myFocusNode.removeListener(_onFocusChange);
    _myFocusNode.dispose();
    _myFocusNotifier.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    _myFocusNotifier.value = _myFocusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _myFocusNotifier,
      builder: (_, isFocus, child) {
        return TextFormField(
          controller: widget.controller,
          style: widget.style??TextStyles.textButton(),
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          obscuringCharacter: '*',
          validator:
              widget.validator != null ? (_) => widget.validator!(_) : null,
          focusNode: _myFocusNode,
          decoration: InputDecoration(
          
            prefix: widget.prefix,
            errorStyle: widget.errorTextStyle,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            filled: true,
            fillColor: isFocus ? widget.focusColor : widget.fillColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            contentPadding:
                const EdgeInsets.only(right: 16, top: 11, bottom: 11),
          ),
          onChanged: widget.onChanged,
        );
      },
    );
  }
}

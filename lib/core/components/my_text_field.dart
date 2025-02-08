import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String textHint;
  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final bool isBorder;
  final String? Function(String?)? validator;
  final Color textColor;
  final Color hintColor;
  final ValueChanged<String>? onChange;
  final bool filledColor;
  final bool isDense;
  final Color fillColor;
  final Color? fillColor2;
  final double fontSize;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool readOnly;
  final Widget? suffixWidget;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color colorBorder;
  final Function()? onTap;
  final Widget? prefixIcon;
  final bool isError;
  final bool isBorderUnderLine;
  final int? maxLength;

  const MyTextField({
    required this.textHint,
    this.obscureText = false,
    super.key,
    this.controller,
    this.maxLines,
    this.minLines,
    this.validator,
    this.isBorder = false,
    this.onTap,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.filledColor = false,
    this.fillColor = Colors.transparent,
    this.fillColor2 = Colors.white,
    this.onChange,
    this.isDense = false,
    this.fontSize = 16,
    this.paddingHorizontal = 20,
    this.paddingVertical = 0,
    this.autofocus = false,
    this.readOnly = false,
    this.suffixWidget,
    this.focusNode,
    this.colorBorder = Colors.grey,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.isError = false,
    this.isBorderUnderLine = false,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      controller: controller,
      minLines: minLines,
      textInputAction: TextInputAction.done,
      maxLines: maxLines,
      validator: validator,
      readOnly: readOnly,
      maxLength: maxLength,
      onChanged: onChange,
      onTap: onTap,
      autofocus: autofocus,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        hintText: textHint,
        isDense: isDense,
        fillColor: fillColor2 ??
            (focusNode != null
                ? focusNode!.hasFocus
                    ? fillColor.withOpacity(.05)
                    : Colors.transparent
                : null),
        filled: filledColor,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: hintColor,
          fontFamily: 'Poppins',
        ),
        suffixIcon: suffixWidget,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(),
        enabledBorder: isBorder
            ? isBorderUnderLine
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: isError ? Colors.red : colorBorder),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: isError ? Colors.red : colorBorder),
                  )
            : InputBorder.none,
        focusedBorder: isBorder
            ? isBorderUnderLine
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: isError ? Colors.red : Colors.blue))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: isError ? Colors.red : Colors.blue))
            : InputBorder.none,
        focusedErrorBorder: isBorder
            ? isBorderUnderLine
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue))
            : InputBorder.none,
        errorBorder: isBorder
            ? isBorderUnderLine
                ? const UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  )
            : InputBorder.none,
      ),
    );
  }
}

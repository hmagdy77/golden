import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      this.sufIcon,
      this.label,
      this.hint,
      this.controller,
      required this.hidePassword,
      this.keyboard,
      this.readOnly,
      this.maxLines,
      required this.validate,
      required this.onSubmite,
      this.preIcon})
      : super(key: key);
  final TextEditingController? controller;
  final Widget? sufIcon; //sufIcon
  final Widget? preIcon; //
  final String? label;
  final String? hint;
  final bool hidePassword;
  final int? maxLines;

  final bool? readOnly;
  final Function? validate;
  final TextInputType? keyboard;
  final Function(String) onSubmite;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate!(value),
      onFieldSubmitted: onSubmite,
      style: context.textTheme.displayMedium!
          .copyWith(color: AppColorManger.backdark),
      controller: controller,
      cursorColor: Get.theme.primaryColor,
      maxLines: maxLines ?? 1,
      autocorrect: true,
      keyboardType: keyboard,
      readOnly: readOnly == null ? false : true,
      obscureText: hidePassword,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: maxLines == null
            ? const EdgeInsets.all(1)
            : const EdgeInsets.symmetric(vertical: 8),
        errorStyle: const TextStyle(fontSize: 12, color: AppColorManger.red),
        label: Text(label!,
            style: context.textTheme.displayMedium!
                .copyWith(color: AppColorManger.black)),
        floatingLabelStyle: context.textTheme.displaySmall,
        hintText: hint,
        hintStyle: context.textTheme.displaySmall!
            .copyWith(color: AppColorManger.grey),
        suffixIcon: IconButton(
          onPressed: () {
            if (controller!.text.isNotEmpty) {
              controller!.clear();
            }
          },
          icon: const Icon(
            Icons.clear,
            color: AppColorManger.primary,
          ),
        ),
        prefixIcon: preIcon ?? const Text(''),
        suffixIconColor: Get.theme.primaryColor,
        prefixIconColor: Get.theme.primaryColor,
        filled: true,
        fillColor: AppColorManger.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.w01),
          borderSide: BorderSide(color: Get.theme.primaryColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.w01),
          borderSide: BorderSide(color: Get.theme.primaryColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.w01),
          borderSide: BorderSide(color: Get.theme.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.w01),
          borderSide: BorderSide(color: Get.theme.primaryColor, width: 2),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.w01),
          borderSide: const BorderSide(color: AppColorManger.red, width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.w01),
          borderSide: const BorderSide(color: AppColorManger.red, width: 2),
        ),
      ),
    );
  }
}

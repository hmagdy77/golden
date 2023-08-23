import '../../../libraries.dart';

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
      required this.validate,
      required this.onSubmite,
      this.preIcon,
      this.maxLines})
      : super(key: key);
  final TextEditingController? controller;
  final Widget? sufIcon; //sufIcon
  final Widget? preIcon; //
  final int? maxLines;
  final String? label;
  final String? hint;
  final bool hidePassword;
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
      autocorrect: true,
      cursorHeight: double.maxFinite,
      keyboardType: keyboard,
      readOnly: readOnly == null ? false : true,
      obscureText: hidePassword,
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(1),
        errorStyle:
            context.textTheme.displaySmall!.copyWith(color: AppColorManger.red),
        label: Text(label!,
            style: context.textTheme.displayMedium!
                .copyWith(color: AppColorManger.black)),
        floatingLabelStyle: context.textTheme.displaySmall,
        hintText: hint,
        hintStyle: context.textTheme.displaySmall!
            .copyWith(color: AppColorManger.grey),
        suffixIcon: preIcon,
        prefixIcon: sufIcon ?? const Text(''),
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

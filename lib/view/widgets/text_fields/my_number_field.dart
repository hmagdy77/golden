import '../../../libraries.dart';

class MyNumberField extends StatelessWidget {
  const MyNumberField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.onChange,
    this.onSubmit,
    this.readOnly,
    this.value,
    this.sufIcon,
    this.validate,
    required this.keyBoard,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool? readOnly;
  final String? value;
  final Widget? sufIcon;
  final Function? validate;
  final TextInputType keyBoard;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      controller: controller,
      validator: (value) => validate!(value),
      keyboardType: keyBoard,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      style: context.textTheme.displayMedium!
          .copyWith(color: AppColorManger.backdark),
      cursorColor: Get.theme.primaryColor,
      autocorrect: true,
      cursorHeight: double.maxFinite,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(1),
        errorStyle:
            context.textTheme.displaySmall!.copyWith(color: AppColorManger.red),
        label: Text(
          label!,
          style: context.textTheme.displayMedium!
              .copyWith(color: AppColorManger.backdark),
        ),
        floatingLabelStyle: context.textTheme.displaySmall,
        hintText: hint,
        hintStyle: context.textTheme.displaySmall!
            .copyWith(color: AppColorManger.grey),
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

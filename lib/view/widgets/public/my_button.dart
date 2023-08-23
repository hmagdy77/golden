import '../../../libraries.dart';

class MyButton extends GetView<OnBoardingImp> {
  const MyButton(
      {Key? key, this.widget, this.text, this.onPressed, this.minWidth})
      : super(key: key);
  final String? text;
  final bool? minWidth;
  final void Function()? onPressed;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppSizes.h06,
        //width: AppSizes.w25,
        margin: const EdgeInsets.all(12),
        child: MaterialButton(
          minWidth: minWidth == true ? AppSizes.w25 : 0,
          onPressed: onPressed,
          color: AppColorManger.primary,
          hoverColor: AppColorManger.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget ??
              Text(
                text!,
                style: context.textTheme.displayMedium!.copyWith(
                  color: AppColorManger.backdark,
                ),
              ),
        ),
      ),
    );
  }
}


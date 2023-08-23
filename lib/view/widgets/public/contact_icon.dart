import '../../../libraries.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({
    super.key,
    required this.host,
    required this.path,
    required this.color,
    this.iconColor,
    required this.icon,
    required this.kind,
  });
  final Color color;
  final Color? iconColor;
  final IconData icon;
  final String host;
  final String path;

  final int kind;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (kind) {
          case 1:
            makePhoneCall(AppStrings.phoneNumber);
            break;
          case 2:
            launchInBrowser(host: host, path: path);
            break;
          case 3:
            launchUrlStr(url: host);
            break;
          case 4:
            launchGoogleMaps(url: host);
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: AppSizes.h05,
        width: AppSizes.h05,
        child: Center(
          child: Icon(
            icon,
            size: 25,
            color: iconColor ?? AppColorManger.backlight,
          ),
        ),
      ),
    );
  }
}

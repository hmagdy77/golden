import '../../../libraries.dart';

class ContactGroup extends StatelessWidget {
  const ContactGroup({super.key, required this.phone});
  final bool phone;

  @override
  Widget build(BuildContext context) {
    return ContainerMi(
      color: AppColorManger.primary,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              ContactIcon(
                color: Colors.blue[900]!,
                icon: Icons.facebook,
                host: AppStrings.faceBookHost,
                path: AppStrings.instgramAndFaceBookPath,
                kind: 2,
              ),
              const Spacer(),
              ContactIcon(
                color: Colors.orange[900]!,
                icon: FontAwesomeIcons.instagram,
                host: AppStrings.instgramHost,
                path: AppStrings.instgramAndFaceBookPath,
                kind: 2,
              ),
              const Spacer(),
              ContactIcon(
                host: AppStrings.youTubeHost,
                path: AppStrings.youTubePath,
                color: Colors.red[900]!,
                icon: FontAwesomeIcons.youtube,
                kind: 2,
                // Icons.ondemand_video_sharp,
              ),
              const Spacer(),
              const ContactIcon(
                host: AppStrings.whatsappLink,
                path: 'AppStrings.whatsappPath',
                icon: FontAwesomeIcons.whatsapp,
                color: Colors.green,
                kind: 3,
              ),
              phone == true ? const Spacer() : const SizedBox(),
              phone == true
                  ? Expanded(
                      flex: phone == true ? 2 : 1,
                      child: const Row(
                        children: [
                          Spacer(),
                          ContactIcon(
                            color: Colors.blue,
                            icon: FontAwesomeIcons.phone,
                            path: AppStrings.phoneNumber,
                            host: '',
                            kind: 1,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              const Spacer(),
              // : const ContactIcon(
              //     color: Colors.black,
              //     icon: FontAwesomeIcons.locationDot,
              //     path: AppStrings.googleMapsPath,
              //     host: AppStrings.googleMapsLink,
              //     kind: 4,
              //   ),
            ],
          )
        ],
      ),
    );
  }
}

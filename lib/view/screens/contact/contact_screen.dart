import '../../../libraries.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.contactUs),
      ),
      body: ListView(
        children: [
          // for height
          SizedBox(
            height: AppSizes.h02,
          ),
          const ContainerMi(
            color: AppColorManger.backlight,
            content: MyLogo(),
          ),
          // for height
          SizedBox(
            height: AppSizes.h02,
          ),
          // locationDot
          ContainerMi(
            color: AppColorManger.backdark,
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        FontAwesomeIcons.locationDot,
                        size: 28,
                        color: AppColorManger.primary,
                      ),
                    ),
                    Text(
                      AppStrings.accademyMakr,
                      style: context.textTheme.displayLarge!
                          .copyWith(color: AppColorManger.primary),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.address,
                      style: context.textTheme.displayMedium!
                          .copyWith(color: AppColorManger.white),
                    ),
                    const Spacer(),
                    MyButton(
                      text: '',
                      widget: const Icon(FontAwesomeIcons.locationDot),
                      onPressed: () {
                        launchGoogleMaps(url: AppStrings.googleMapsLink);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          // for height
          SizedBox(
            height: AppSizes.h02,
          ),
          // workTimes
          ContainerMi(
            color: AppColorManger.backdark,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        FontAwesomeIcons.clock,
                        size: 28,
                        color: AppColorManger.primary,
                      ),
                    ),
                    Text(
                      AppStrings.workTimes,
                      style: context.textTheme.displayLarge!
                          .copyWith(color: AppColorManger.primary),
                    ),
                  ],
                ),
                Text(
                  AppStrings.from8To11,
                  style: context.textTheme.displayMedium!
                      .copyWith(color: AppColorManger.white),
                ),
              ],
            ),
          ),
          // for height
          SizedBox(
            height: AppSizes.h02,
          ),
          ContainerMi(
            color: AppColorManger.backdark,
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.support_agent,
                        size: 28,
                        color: AppColorManger.primary,
                      ),
                    ),
                    Text(
                      AppStrings.talkToAgentService,
                      style: context.textTheme.displayLarge!
                          .copyWith(color: AppColorManger.primary),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.avialbleAllWeek,
                      style: context.textTheme.displayMedium!
                          .copyWith(color: AppColorManger.white),
                    ),
                    const Spacer(),
                    MyButton(
                      text: AppStrings.phone,
                      onPressed: () {
                        makePhoneCall(AppStrings.phoneNumber);
                      },
                      widget: const Icon(Icons.phone),
                    ),
                  ],
                ),

                //
              ],
            ),
          ),
          // for height
          SizedBox(
            height: AppSizes.h02,
          ),
          const ContactGroup(
            phone: false,
          ),
          // for height
          SizedBox(
            height: AppSizes.h02,
          ),

          // GestureDetector(
          //   onTap: () {
          //     launchGoogleMaps(url: AppStrings.googleMapsLink);
          //   },
          //   child: Container(
          //     margin: EdgeInsets.symmetric(
          //       horizontal: AppSizes.h05,
          //     ),
          //     height: AppSizes.h5,
          //     width: double.infinity,
          //     child:

          //         const WebView(url: AppStrings.googleMapsLink),
          //   ),
          // )
        ],
      ),
    );
  }
}

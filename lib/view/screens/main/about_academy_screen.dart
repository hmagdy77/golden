import '../../../libraries.dart';

class AboutAcademyScreen extends StatelessWidget {
  const AboutAcademyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: AppSizes.h02,
            ),
            const ContainerMi(
              color: AppColorManger.backlight,
              content: MyLogo(),
            ),
            SizedBox(
              height: AppSizes.h02,
            ),
            ContainerMi(
              color: AppColorManger.backdark,
              content: Column(
                children: [
                  // ContainerMi(
                  //   color: AppColorManger.white,
                  //   content: Image(
                  //     image: AssetImage(AppImageAssets.logo),
                  //   ),
                  // ),
                  Text(
                    AppStrings.helloAndWelcome,
                    style: context.textTheme.displayLarge!
                        .copyWith(color: AppColorManger.white),
                  ),
                  Text(
                    AppStrings.golden,
                    style: context.textTheme.displayLarge!
                        .copyWith(color: AppColorManger.primary),
                  ),
                  Text(
                    AppStrings.about1,
                    style: context.textTheme.displayMedium!
                        .copyWith(color: AppColorManger.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.h02,
            ),
            ContainerMi(
              color: AppColorManger.backdark,
              content: Column(
                children: [
                  Text(
                    AppStrings.about2,
                    style: context.textTheme.displayMedium!
                        .copyWith(color: AppColorManger.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.h02,
            ),
            ContainerMi(
              color: AppColorManger.backdark,
              content: Column(
                children: [
                  Text(
                    AppStrings.about3,
                    style: context.textTheme.displayMedium!
                        .copyWith(color: AppColorManger.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.h02,
            ),
            // ro2ya
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
                          FontAwesomeIcons.lightbulb,
                          size: 28,
                          color: AppColorManger.primary,
                        ),
                      ),
                      Text(
                        AppStrings.ro2yaLabel,
                        style: context.textTheme.displayLarge!
                            .copyWith(color: AppColorManger.primary),
                      ),
                    ],
                  ),
                  Text(
                    AppStrings.ro2ya,
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
            // resala
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
                          FontAwesomeIcons.heart,
                          size: 28,
                          color: AppColorManger.primary,
                        ),
                      ),
                      Text(
                        AppStrings.resalaLabel,
                        style: context.textTheme.displayLarge!
                            .copyWith(color: AppColorManger.primary),
                      ),
                    ],
                  ),
                  Text(
                    AppStrings.resala,
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
            // goal
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
                          FontAwesomeIcons.star,
                          size: 28,
                          color: AppColorManger.primary,
                        ),
                      ),
                      Text(
                        AppStrings.goalLabel,
                        style: context.textTheme.displayLarge!
                            .copyWith(color: AppColorManger.primary),
                      ),
                    ],
                  ),
                  Text(
                    AppStrings.theGoal,
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
            ContainerMi(
              color: AppColorManger.backdark,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Row(
                    children: [
                      Text(
                        AppStrings.from8To11,
                        style: context.textTheme.displayMedium!
                            .copyWith(color: AppColorManger.white),
                        textAlign: TextAlign.start,
                      ),
                    ],
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
                ],
              ),
            ),
            // for height
            SizedBox(
              height: AppSizes.h01,
            ),
          ],
        ),
      ],
    );
  }
}

/*



ContainerMi(
                color: backdark,
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextLabel(
                            text: 'للحجز والاستفسار',
                            size: 26,
                            color: Colors.orange)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextLabel(
                            text: 'سيبلنا اسمك ورقمك وهنتواصل معاك',
                            size: 18,
                            color: Colors.white)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    text_feild(
                      hint: 'الاسم',
                      icon: Icons.person,
                      keyboard: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    text_feild(
                      hint: 'رقم التليفون',
                      icon: Icons.phone,
                      keyboard: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.orange,
                      child: Center(
                        child: TextLabel(
                            text: 'ارسال', size: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        text_button(
                            url: '',
                            text: 'الاتصال بنا',
                            size: 18,
                            color: Colors.white),
                        TextLabel(
                            text: 'لديك سؤال قم بزيارة صفحة',
                            size: 16,
                            color: Colors.grey),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            
 */

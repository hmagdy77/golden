import '../../../libraries.dart';

class ActivtiySignScreen extends StatelessWidget {
  ActivtiySignScreen({super.key});
  final Post post = Get.arguments[0];
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.golden),
        ),
        body: Obx(
          () {
            if (agentsController.isLoading.value) {
              return const MyLottieLoading();
            } else {
              return InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                child: Form(
                  key: agentsController.addSignKey,
                  child: ContainerMi(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.h01),
                    padding: const EdgeInsets.all(0),
                    content: ListView(
                      children: [
                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        // label
                        post.kind == '1'
                            ? Text(
                                '${AppStrings.activtySign} ${post.title}',
                                style: context.textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                'حجز ${post.title}',
                                style: context.textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),

                        // name
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppSizes.w01),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: MyTextField(
                            controller: agentsController.name,
                            hidePassword: false,
                            validate: (val) {
                              return validInput(
                                max: 35,
                                min: 1,
                                type: AppStrings.validateAdmin,
                                val: val,
                              );
                            },
                            sufIcon: const Icon(Icons.person),
                            label: AppStrings.name,
                            onSubmite: (v) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                          ),
                        ),
                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        // phone
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppSizes.w01),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: MyNumberField(
                            controller: agentsController.phone,
                            validate: (val) {
                              return validInput(
                                max: 20,
                                min: 8,
                                type: AppStrings.validateAdmin,
                                val: val,
                              );
                            },
                            sufIcon: const Icon(Icons.phone),
                            label: AppStrings.phone,
                            keyBoard: TextInputType.number,
                            onSubmit: (v) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                          ),
                        ),
                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        // age
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppSizes.w01),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: MyNumberField(
                            controller: agentsController.age,
                            validate: (val) {
                              return validInput(
                                max: 3,
                                min: 1,
                                type: AppStrings.validateAdmin,
                                val: val,
                              );
                            },
                            sufIcon: const Icon(Icons.calendar_month),
                            label: AppStrings.age,
                            keyBoard: TextInputType.number,
                            onSubmit: (v) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                          ),
                        ),

                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        // gender
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.gender,
                              style: context.textTheme.displayMedium,
                            ),
                            const Spacer(),
                            CheckGroup(
                              groupController:
                                  agentsController.genderController,
                              values: const [AppStrings.boy, AppStrings.girl],
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                        // signed
                        Text(
                          AppStrings.signed,
                          style: context.textTheme.displayMedium,
                        ),
                        CheckGroup(
                          groupController: agentsController.signedController,
                          values: const [AppStrings.yes, AppStrings.no],
                        ),
                        // played
                        Text(
                          AppStrings.played,
                          style: context.textTheme.displayMedium,
                        ),
                        CheckGroup(
                          groupController: agentsController.playedController,
                          values: const [AppStrings.yes, AppStrings.no],
                        ),
                        // borthers
                        Text(
                          AppStrings.borthers,
                          style: context.textTheme.displayMedium,
                        ),
                        CheckGroup(
                          groupController: agentsController.borthersController,
                          values: const [AppStrings.yes, AppStrings.no],
                        ),
                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),
                        // sign MyButton
                        MyButton(
                          minWidth: true,
                          text: AppStrings.sign,
                          onPressed: () {
                            if (agentsController.genderController.selectedItem == null ||
                                agentsController
                                        .borthersController.selectedItem ==
                                    null ||
                                agentsController
                                        .signedController.selectedItem ==
                                    null ||
                                agentsController
                                        .playedController.selectedItem ==
                                    null) {
                              agentsController.showSnack(
                                  context: context,
                                  title: AppStrings.pleaseEnterAllWanted);
                            } else {
                              agentsController.addSign(
                                  activty: post.title, context: context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }
}

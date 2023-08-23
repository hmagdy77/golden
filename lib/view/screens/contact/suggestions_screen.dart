import '../../../libraries.dart';

class SuggestionsScreen extends StatelessWidget {
  SuggestionsScreen({super.key});
  final AgentsControllerImp agentsController = Get.find<AgentsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.suggestions),
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
                  key: agentsController.addSuggestKey,
                  child: ContainerMi(
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.h01),
                    padding: const EdgeInsets.all(0),
                    content: ListView(
                      children: [
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
                            label: AppStrings.theName,
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
                        // name
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppSizes.w01),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: MyTextField(
                            controller: agentsController.sug,
                            maxLines: 5,
                            hidePassword: false,
                            validate: (val) {
                              return validInput(
                                max: 500,
                                min: 1,
                                type: AppStrings.validateAdmin,
                                val: val,
                              );
                            },
                            sufIcon: const Icon(Icons.notes),
                            label: AppStrings.suggestions,
                            onSubmite: (v) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                          ),
                        ),

                        // for height
                        SizedBox(
                          height: AppSizes.h02,
                        ),

                        // sign MyButton
                        MyButton(
                          minWidth: true,
                          text: AppStrings.send,
                          onPressed: () {
                            agentsController.addSuggest(context: context);
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

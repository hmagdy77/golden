import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/signs/signs_controller.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../routes.dart';
import '../../widgets/lottie/empty.dart';
import '../../widgets/lottie/loading.dart';
import '../../widgets/signs/sign_item.dart';

class SignstsScreen extends StatelessWidget {
  SignstsScreen({super.key});
  final SignsControllerImp signsController = Get.put(SignsControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signs),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.mainScreen);
          },
          icon: const Icon(
            Icons.home,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.h01),
        child: Obx(
          () {
            if (signsController.isLoading.value) {
              return const MyLottieLoading();
            } else if (signsController.signsList.isEmpty) {
              return const MyLottieEmpty();
            } else {
              return Column(
                children: [
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        AppStrings.notSeen,
                        style: context.textTheme.displayLarge,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        AppStrings.seen,
                        style: context.textTheme.displayLarge,
                      ),
                      const Spacer(),
                    ],
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              var sing =
                                  signsController.signsListNotSeen[index];
                              return SignItem(
                                sign: sing,
                              );
                            },
                            itemCount: signsController.signsListNotSeen.length,
                            separatorBuilder: (context, _) =>
                                const SizedBox(height: 10.0),
                          ),
                        ),
                        SizedBox(
                          width: AppSizes.w02,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              var sing = signsController.signsListSeen[index];
                              return SignItem(
                                sign: sing,
                              );
                            },
                            itemCount: signsController.signsListSeen.length,
                            separatorBuilder: (context, _) =>
                                const SizedBox(height: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/service/services.dart';
import '../../../core/functions/crud.dart';
import '../../../data/remote/api.dart';
import '../../core/constants/app_color_manger.dart';
import '../../core/constants/app_sizes.dart';
import '../../data/models/signs_model.dart';
import '../../data/models/status_model.dart';
import '../../routes.dart';

abstract class SignsController extends GetxController {
  getSigns();
  sortSigns();
  makeSeen({required Sign sign});
  deletSign({required Sign sign});
}

class SignsControllerImp extends SignsController {
  MyService myService = Get.find();
  var signsList = <Sign>[].obs;
  var signsListSeen = <Sign>[].obs;
  var signsListNotSeen = <Sign>[].obs;
  var isLoading = false.obs;
  late GroupController seen;
  late TextEditingController name;
  GlobalKey<FormState> addSignKey = GlobalKey<FormState>();
  @override
  void onInit() {
    name = TextEditingController();
    seen = GroupController();
    getSigns();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  getSigns() async {
    isLoading(true);
    try {
      var signs = await Crud.postRequest(
        Api.getSigns,
        {},
        signsModelFromJson,
      );
      if (signs.status == 'fail') {
        isLoading(false);
        update();
      } else if (signs.status == 'suc') {
        signsList.addAll(signs.data);
        sortSigns();
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }

  @override
  sortSigns() {
    signsListNotSeen.value = signsList
        .where(
          (sign) {
            var signKind = sign.seen;
            return signKind == '0';
          },
        )
        .toList()
        .reversed
        .toList();
    signsListSeen.value = signsList
        .where(
          (sign) {
            var signKind = sign.seen;
            return signKind == '1';
          },
        )
        .toList()
        .reversed
        .toList();
  }

  void showSnack({required context, required String title}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.displayMedium!
              .copyWith(color: AppColorManger.lightScaffold),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.w02,
          vertical: AppSizes.h05,
        ),
        padding: EdgeInsets.all(AppSizes.h01),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  makeSeen({required Sign sign}) async {
    isLoading(true);
    try {
      var signs = await Crud.postRequest(
        Api.editSigns,
        {
          'id': sign.id.toString(),
          'seen': sign.seen == '0' ? '1' : '0',
        },
        statusModelFromJson,
      );
      if (signs.status == 'fail') {
        isLoading(false);
        update();
      } else if (signs.status == 'suc') {
        Get.offAllNamed(
          AppRoutes.loadingScreen,
          arguments: [AppRoutes.signstsScreen],
        );
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }

  @override
  deletSign({required Sign sign}) async {
    isLoading(true);
    try {
      var signs = await Crud.postRequest(
        Api.deleteSigns,
        {
          'id': sign.id.toString(),
        },
        statusModelFromJson,
      );
      if (signs.status == 'fail') {
        isLoading(false);
        update();
      } else if (signs.status == 'suc') {
        Get.offAllNamed(
          AppRoutes.loadingScreen,
          arguments: [AppRoutes.signstsScreen],
        );
        isLoading(false);
        update();
      }
    } catch (_) {
      isLoading(false);
      update();
    }
  }
}

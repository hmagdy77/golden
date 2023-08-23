import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_color_manger.dart';
import '../../../routes.dart';
import 'taps/add_act_tap.dart';
import 'taps/add_alert_tap.dart';
import 'taps/add_news_tap.dart';
import 'taps/add_offer_tap.dart';

class AddPostsScreen extends StatelessWidget {
  const AddPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.mainScreen);
          },
          icon: const Icon(
            Icons.home,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  TabBar(
                    overlayColor: MaterialStatePropertyAll(AppColorManger.grey),
                    tabs: [
                      Tab(
                        child: FaIcon(FontAwesomeIcons.percent,
                            color: Colors.black),
                      ),
                      Tab(
                        child: FaIcon(FontAwesomeIcons.noteSticky,
                            color: Colors.black),
                      ),
                      Tab(
                        child: FaIcon(FontAwesomeIcons.football,
                            color: Colors.black),
                      ),
                      Tab(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              AddOfferTap(),
              AddNewsTap(),
              AddActTap(),
              AddAlertTap(),
            ],
          ),
        ),
      ),
    );
  }
}

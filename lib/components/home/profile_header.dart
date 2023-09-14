import 'package:flutter/material.dart';

import 'package:partice_project/components/gap.dart';

import 'package:partice_project/screens/account_location_screen.dart';

import 'package:partice_project/screens/signup_screen.dart';
import 'package:partice_project/utils/route_name.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: RouteSettings(name: RoutesName.accountLocationScreen),
              screen: AccountLocationScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.location_on,
              //   size: 20,
              //   color: AppColors.whiteColor,
              // ),
              const Gap(isWidth: true, isHeight: false, width: 5),
              Padding(
                padding: const EdgeInsets.only(left: 160, top: 10),
                child: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              // const Icon(
              //   Icons.arrow_drop_down,
              //   size: 20,
              //   color: AppColors.whiteColor,
              // ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                // PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                //   context,
                //   settings: RouteSettings(name: RoutesName.promotionScreem),
                //   screen: PromotionScreen(),
                //   withNavBar: false,
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
              },
              child: Container(
                width: 100,
                height: 50,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     border: Border.all(color: AppColors.primaryColor)),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    // color: Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: Image.asset('lib/assets/icons/Setting.png'),
                ),
              ),
            ),
            // Gap(isWidth: true, isHeight: false, width: width * 0.03),
            // const LocationBottomSheet(),
          ],
        )
      ],
    );
  }
}

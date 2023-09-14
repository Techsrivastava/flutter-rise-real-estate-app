import 'package:flutter/material.dart';
import 'package:partice_project/components/app_button.dart';
import 'package:partice_project/components/gap.dart';
import 'package:partice_project/constant/colors.dart';
import 'package:partice_project/utils/route_name.dart';
import 'package:partice_project/utils/storage.dart';

class BottomSheetSucess extends StatelessWidget {
  final String title;
  final double height;
  final bool condition;
  const BottomSheetSucess(
      {Key? key, this.title = '', this.height = 50, this.condition = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Center(
      child: AppButton(
          title: title,
          height: height,
          textColor: AppColors.whiteColor,
          onPress: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: appHeight / 0.75,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                          width: 150,
                          image: AssetImage("lib/assets/icons/success.png"),
                          fit: BoxFit.cover,
                        ),
                        Gap(
                          isWidth: false,
                          isHeight: true,
                          height: appHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Your  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                            ),
                            Text(
                              "listing is now",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "published ",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                        ),
                        Gap(
                          isWidth: false,
                          isHeight: true,
                          height: appHeight * 0.02,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur.",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                        ),
                        Gap(
                          isWidth: false,
                          isHeight: true,
                          height: appHeight * 0.02,
                        ),
                        // AppButton(
                        //   onPress: () {
                        //     // final prefs = await myStroage();
                        //     // prefs.setBool("isLogin", true);
                        //     Navigator.pushNamed(context, RoutesName.authScreen);
                        //   },
                        //   title: "Finsh",
                        //   textColor: AppColors.whiteColor,
                        //   radius: 15,
                        //   height: 65,
                        //   width: width / 1.20,
                        // )
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 65,
                              width: 158,
                              decoration: BoxDecoration(
                                color: const Color(0xFF8BC83F),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'Finish',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.48,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 65,
                              width: 158,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F4F7),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'Close',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.48,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

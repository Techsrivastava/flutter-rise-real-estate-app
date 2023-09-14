import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partice_project/components/app_input.dart';
import 'package:partice_project/components/gap.dart';
import 'package:partice_project/components/home/explore_card.dart';
import 'package:partice_project/components/home/featured_card.dart';
import 'package:partice_project/components/home/home_category.dart';
import 'package:partice_project/components/home/home_header.dart';
import 'package:partice_project/components/home/property_card.dart';
import 'package:partice_project/components/home/row_title_home.dart';
import 'package:partice_project/components/home/top_agent.dart';
import 'package:partice_project/components/home/top_location.dart';
import 'package:partice_project/components/shared/screen.dart';
import 'package:partice_project/constant/colors.dart';
import 'package:partice_project/screens/featured/featured_screen.dart';
import 'package:partice_project/utils/route_name.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchInput = TextEditingController();
  final searchFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    searchInput.dispose();
    searchFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Screen(
      isBackButton: false,
      isBottomTab: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          Row(
            children: [
              Text(
                "Hey",
                style: Theme.of(context).textTheme.headline1,
              ),
              Gap(isWidth: true, isHeight: false, width: width * 0.03),
              Text(
                "User!",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
            ],
          ),
          Text(
            "Let's start exploring",
            style: Theme.of(context).textTheme.headline3,
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          AppInput(
              myController: searchInput,
              focusNode: searchFocus,
              onFiledSubmitedValue: (value) {},
              keyBoardType: TextInputType.text,
              leftIcon: true,
              icon: const Icon(Icons.search),
              isFilled: true,
              obscureText: false,
              hinit: "Find location...",
              onValidator: (value) {
                if (value.isEmpty) return;
              }),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          // Container(
          //   height: height / 12,
          //   width: double.infinity,
          //   child: ListView(scrollDirection: Axis.horizontal, children: [
          //     const HomeCategory(title: "All", active: true),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //     const HomeCategory(title: "House", active: false),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //     const HomeCategory(title: "Townhouse", active: false),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //     const HomeCategory(title: "Apparment", active: false),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //     const HomeCategory(title: "Condo", active: false),
          //   ]),
          // ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          Container(
            height: height / 4,
            width: double.infinity,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              const PropertyCard(
                  title: "Halloween\nSale!",
                  subtitle: "All discount up to 60%",
                  path: "lib/assets/images/property.jpg"),
              Gap(isWidth: true, isHeight: false, width: width * 0.05),
              const PropertyCard(
                  title: "Townhouse\nSale!",
                  subtitle: "All discount up to 60%",
                  path: "lib/assets/images/property1.jpg"),
              Gap(isWidth: true, isHeight: false, width: width * 0.05),
              const PropertyCard(
                  title: "Summer\nVacation",
                  subtitle: "All discount up to 60%",
                  path: "lib/assets/images/property2.jpg"),
              Gap(isWidth: true, isHeight: false, width: width * 0.05),
            ]),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          // RowTitleHome(
          //   title: "Featured Estates",
          //   subtitle: "view all",
          //   onPress: () {},
          // ),
          // Gap(isWidth: false, isHeight: true, height: height * 0.02),
          // Container(
          //   height: height / 4,
          //   width: double.infinity,
          //   child: ListView(scrollDirection: Axis.horizontal, children: [
          //     const FeaturedCard(
          //         path: "lib/assets/images/property2.jpg",
          //         category: "Appartment",
          //         title: "Sky Dandelions\nApartment",
          //         rating: "4.9",
          //         location: "Pabna, Bangladesh",
          //         payment: "10"),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.05),
          //     const FeaturedCard(
          //         path: "lib/assets/images/property1.jpg",
          //         category: "Appartment",
          //         title: "Sky Dandelions\nApartment",
          //         rating: "4.9",
          //         location: "Pabna, Bangladesh",
          //         payment: "10"),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.05),
          //     const FeaturedCard(
          //         path: "lib/assets/images/property.jpg",
          //         category: "Appartment",
          //         title: "Sky Dandelions\nApartment",
          //         rating: "4.9",
          //         location: "Pabna, Bangladesh",
          //         payment: "10"),
          //     Gap(isWidth: true, isHeight: false, width: width * 0.05),
          //   ]),
          // ),
          // Gap(isWidth: false, isHeight: true, height: height * 0.02),
          // RowTitleHome(
          //   title: "Top Locations",
          //   subtitle: "explore",
          //   onPress: () {},
          // ),
          // Gap(isWidth: false, isHeight: true, height: height * 0.02),
          // Container(
          //   height: height / 15,
          //   width: double.infinity,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       const TopLocation(
          //         path: "lib/assets/images/property.jpg",
          //         location: "Bali",
          //       ),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopLocation(
          //         path: "lib/assets/images/property1.jpg",
          //         location: "Jakartha",
          //       ),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopLocation(
          //         path: "lib/assets/images/property2.jpg",
          //         location: "Yogartha",
          //       ),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopLocation(
          //         path: "lib/assets/images/property.jpg",
          //         location: "Bali",
          //       ),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopLocation(
          //         path: "lib/assets/images/property1.jpg",
          //         location: "Jakartha",
          //       ),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopLocation(
          //         path: "lib/assets/images/property2.jpg",
          //         location: "Yogartha",
          //       ),
          //     ],
          //   ),
          // ),
          // Gap(isWidth: false, isHeight: true, height: height * 0.03),
          // RowTitleHome(
          //   title: "Top Estate Agent",
          //   subtitle: "explore",
          //   onPress: () {},
          // ),
          // Gap(isWidth: false, isHeight: true, height: height * 0.02),
          // Container(
          //   height: height / 8.5,
          //   width: double.infinity,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       const TopAgent(
          //           path: "lib/assets/images/profile.png", name: "Amanda"),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopAgent(
          //           path: "lib/assets/images/profile1.png", name: "Andserson"),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopAgent(
          //           path: "lib/assets/images/profile2.png", name: "Samtha"),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopAgent(
          //           path: "lib/assets/images/profile4.png", name: "Nice"),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopAgent(
          //           path: "lib/assets/images/profile2.png", name: "Samtha"),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //       const TopAgent(
          //           path: "lib/assets/images/profile4.png", name: "Nice"),
          //       Gap(isWidth: true, isHeight: false, width: width * 0.03),
          //     ],
          //   ),
          // ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          RowTitleHome(
            title: "----",
            subtitle: "view all",
            onPress: (() => ""),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.02),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings:
                          const RouteSettings(name: RoutesName.featuredScreen),
                      screen: const FeaturedScreen(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Container(
                    width: 168,
                    height: 106,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F4F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Positioned widget for the top-left container
                        Positioned(
                          left: 59,
                          top: -30,
                          child: Container(
                            width: 45,
                            height: 60,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Nested container within the top-left container
                                Container(
                                  width: 45,
                                  height: 60,
                                  decoration: ShapeDecoration(
                                    color: const Color(0x14874AF6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Positioned widget for the text "Total Properties Posted"
                        Container(
                          child: const Positioned(
                            left: 12,
                            top: 35,
                            child: SizedBox(
                              width: 166,
                              child: Text(
                                'Total Properties Posted',
                                style: TextStyle(
                                  color: Color(0xFF242B5C),
                                  fontSize: 12,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                  height: 1.50,
                                  letterSpacing: 0.36,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Positioned widget for the bottom-left container with text
                        Positioned(
                          left: 53,
                          top: 58,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: ShapeDecoration(
                              color: const Color(0xAF3F467C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text widget with the text "XXX"
                                Text(
                                  'XXX',
                                  style: TextStyle(
                                    color: Color(0xFF242B5C),
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(isWidth: true, isHeight: false, width: width * 0.03),
                Container(
                  width: 168,
                  height: 106,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Positioned widget for the top-left container
                      Positioned(
                        left: 59,
                        top: -30,
                        child: Container(
                          width: 45,
                          height: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Nested container within the top-left container
                              Container(
                                width: 45,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: const Color(0x14874AF6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned widget for the text "Total Properties Posted"
                      const Positioned(
                        left: 12,
                        top: 35,
                        child: SizedBox(
                          width: 166,
                          child: Text(
                            'Total Properties Posted',
                            style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 1.50,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ),
                      ),
                      // Positioned widget for the bottom-left container with text
                      Positioned(
                        left: 53,
                        top: 58,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: ShapeDecoration(
                            color: const Color(0xAF3F467C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text widget with the text "XXX"
                              Text(
                                'XXX',
                                style: TextStyle(
                                  color: Color(0xFF242B5C),
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.02),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  width: 168,
                  height: 106,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Positioned widget for the top-left container
                      Positioned(
                        left: 59,
                        top: -30,
                        child: Container(
                          width: 45,
                          height: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Nested container within the top-left container
                              Container(
                                width: 45,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: const Color(0x14874AF6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned widget for the text "Total Properties Posted"
                      const Positioned(
                        left: 12,
                        top: 35,
                        child: SizedBox(
                          width: 166,
                          child: Text(
                            'Total Properties Posted',
                            style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 1.50,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ),
                      ),
                      // Positioned widget for the bottom-left container with text
                      Positioned(
                        left: 53,
                        top: 58,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: ShapeDecoration(
                            color: const Color(0xAF3F467C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text widget with the text "XXX"
                              Text(
                                'XXX',
                                style: TextStyle(
                                  color: Color(0xFF242B5C),
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(isWidth: true, isHeight: false, width: width * 0.03),
                Container(
                  width: 168,
                  height: 106,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Positioned widget for the top-left container
                      Positioned(
                        left: 59,
                        top: -30,
                        child: Container(
                          width: 45,
                          height: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Nested container within the top-left container
                              Container(
                                width: 45,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: const Color(0x14874AF6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned widget for the text "Total Properties Posted"
                      const Positioned(
                        left: 12,
                        top: 35,
                        child: SizedBox(
                          width: 166,
                          child: Text(
                            'Total Properties Posted',
                            style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 1.50,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ),
                      ),
                      // Positioned widget for the bottom-left container with text
                      Positioned(
                        left: 53,
                        top: 58,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: ShapeDecoration(
                            color: const Color(0xAF3F467C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text widget with the text "XXX"
                              Text(
                                'XXX',
                                style: TextStyle(
                                  color: Color(0xFF242B5C),
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:partice_project/components/gap.dart';
import 'package:partice_project/components/home/explore_card.dart';

import 'package:partice_project/components/home/profile_header.dart';
import 'package:partice_project/components/shared/screen.dart';
import 'package:partice_project/screens/notification.dart';
import 'package:partice_project/screens/post_property.dart';

class AccountProfileScreen extends StatefulWidget {
  const AccountProfileScreen({super.key});

  @override
  State<AccountProfileScreen> createState() => _AccountProfileScreenState();
}

class _AccountProfileScreenState extends State<AccountProfileScreen> {
  int _currentIndex = 0; // Keep track of the selected tab index.
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Screen(
        isBackButton: false,
        isBottomTab: true,
        child: Column(children: [
          const ProfileHeader(),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Adarsh'),
              // Spacer(),
              Container(
                width: 100,
                height: 100,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/100x100"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              // Spacer(),
              Container(
                width: 45,
                height: 45,
                decoration: const ShapeDecoration(
                  color: Color(0xFF234F68),
                  shape: OvalBorder(),
                ),
                child: Image.asset('lib/assets/icons/edit.png'),
              ),
            ],
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 102.33,
                height: 70,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 102.33,
                        height: 70,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFECEDF3)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 42.33,
                      top: 16,
                      child: Text(
                        '30',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF242B5C),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.42,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 33.45,
                      top: 40,
                      child: Text(
                        'Listings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF53577A),
                          fontSize: 10,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 102.33,
                height: 70,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 102.33,
                        height: 70,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFECEDF3)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 42.33,
                      top: 16,
                      child: Text(
                        '30',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF242B5C),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.42,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 15.45,
                      top: 40,
                      child: Text(
                        'Active Listings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF53577A),
                          fontSize: 10,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 102.33,
                height: 70,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 102.33,
                        height: 70,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFECEDF3)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 42.33,
                      top: 16,
                      child: Text(
                        '30',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF242B5C),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.42,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 5.45,
                      top: 40,
                      child: Text(
                        'unseen Notification',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF53577A),
                          fontSize: 10,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          Container(
            height: 60,
            width: 350,
            decoration: ShapeDecoration(
              color: const Color(0xFFF5F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => NotificationPage())));
                    }),
                    child: Text(
                      'Notification',
                      style: TextStyle(
                        color: _currentIndex == 0 ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Text(
                    'Listings',
                    style: TextStyle(
                      color: _currentIndex == 1 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Text(
                    'Active Listing',
                    style: TextStyle(
                      color: _currentIndex == 2 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.02),
          Container(
            height: 60,
            width: 350,
            decoration: ShapeDecoration(
              color: const Color(0xFFF5F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Text(
                    'Tab 4',
                    style: TextStyle(
                      color: _currentIndex == 0 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Text(
                    'Tab 5',
                    style: TextStyle(
                      color: _currentIndex == 1 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Text(
                    'Tab 6',
                    style: TextStyle(
                      color: _currentIndex == 2 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.width / 8,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Listing"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('lib/assets/icons/grid.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              // Navigate to the second screen when the button is pressed.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostProperty()),
                              );
                            },
                            child: Image.asset('lib/assets/icons/plus.png')),
                      ],
                    )
                  ]),
            ),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.001),
          // Content for the selected tab
          _currentIndex == 0
              ? Container(
                  height: 980,
                  width: 370,
                  decoration: const ShapeDecoration(
                    // color: Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(),
                  ),
                  child: Text('tab1'))
              : _currentIndex == 1
                  ? Container(
                      height: 980,
                      width: 370,
                      decoration: ShapeDecoration(
                        // color: const Color(0xFFF5F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ExploreCard(
                                  title: "Win The Tower",
                                  rating: "4.9",
                                  location: "Pabna Sadar",
                                  isHeart: false,
                                  path:
                                      "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=800",
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: 20,
                                ),
                                ExploreCard(
                                  title: "Win The Tower",
                                  rating: "4.9",
                                  location: "Pabna Sadar",
                                  isHeart: false,
                                  path:
                                      "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=800",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ExploreCard(
                                  title: "Win The Tower",
                                  rating: "4.9",
                                  location: "Pabna Sadar",
                                  isHeart: false,
                                  path:
                                      "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=800",
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: 20,
                                ),
                                ExploreCard(
                                  title: "Win The Tower",
                                  rating: "4.9",
                                  location: "Pabna Sadar",
                                  isHeart: false,
                                  path:
                                      "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=800",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ExploreCard(
                                  title: "Win The Tower",
                                  rating: "4.9",
                                  location: "Pabna Sadar",
                                  isHeart: false,
                                  path:
                                      "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=800",
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: 20,
                                ),
                                ExploreCard(
                                  title: "Win The Tower",
                                  rating: "4.9",
                                  location: "Pabna Sadar",
                                  isHeart: false,
                                  path:
                                      "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=800",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 200,
                      width: 350,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF5F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Center(child: Text('Tab 3 Content')),
                    )
        ]));
  }
}

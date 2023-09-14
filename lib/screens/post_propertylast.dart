import 'package:flutter/material.dart';
import 'package:partice_project/components/app_input.dart';
import 'package:partice_project/components/bottom_sheet.dart';
import 'package:partice_project/components/bottom_sheetsuccess.dart';
import 'package:partice_project/components/comman_header.dart'; // Import the CommonHeader widget.
import 'package:partice_project/components/gap.dart'; // Import the Gap widget.
import 'package:partice_project/constant/colors.dart';

class PropertyPostingLast extends StatefulWidget {
  const PropertyPostingLast({Key? key}) : super(key: key);

  @override
  State<PropertyPostingLast> createState() => _PropertyPostingLastState();
}

class _PropertyPostingLastState extends State<PropertyPostingLast> {
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController balconyController = TextEditingController();
  int totalRooms = 4;

  Map<String, int> propertyFeatures = {
    'Bedroom': 3,
    'Bathroom': 2,
    'Balcony': 2,
  };

  List<String> environmentFacilities = [
    'Parking Lot',
    'Pet Allowed',
    'Garden',
    'Gym',
    'Park',
    'Home theatre',
    'Kid’s Friendly',
  ];

  List<bool> selectedFacilities =
      List.generate(7, (index) => false); // Initialize with all false

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Commonheader(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Almost finish',
                          style: TextStyle(
                            color: Color(0xFF1F4C6B),
                            fontSize: 25,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w800,
                            height: 1.60,
                            letterSpacing: 0.75,
                          ),
                        ),
                      ],
                    ),
                    // const Text(
                    //   ', complete\nthe listing',
                    //   style: TextStyle(
                    //     color: Color(0xFF242B5C),
                    //     fontSize: 25,
                    //     fontFamily: 'Lato',
                    //     fontWeight: FontWeight.w500,
                    //     height: 1.60,
                    //     letterSpacing: 0.75,
                    //   ),
                    // ),
                    const SizedBox(height: 16),
                    const Text(
                      'Sell Price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppInput(
                      myController: sellPriceController,
                      focusNode: FocusNode(),
                      onFiledSubmitedValue: (_) {},
                      onValidator: (value) {
                        // Add your validation logic here
                        return null;
                      },
                      keyBoardType: TextInputType.number,
                      obscureText: false,
                      hinit: 'Enter sell price',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppInput(
                      myController: sizeController,
                      focusNode: FocusNode(),
                      onFiledSubmitedValue: (_) {},
                      onValidator: (value) {
                        // Add your validation logic here
                        return null;
                      },
                      keyBoardType: TextInputType.number,
                      obscureText: false,
                      hinit: 'Enter size (sqfeet)',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Property Features',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        for (var feature in propertyFeatures.keys)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(feature),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (propertyFeatures[feature]! > 0) {
                                          propertyFeatures[feature];
                                        }
                                      });
                                    },
                                  ),
                                  Text(propertyFeatures[feature].toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        propertyFeatures[feature]!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Total Rooms',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (totalRooms > 0) {
                                totalRooms--;
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        Text(
                          totalRooms.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              totalRooms++;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Environment / Facilities',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children:
                          environmentFacilities.asMap().entries.map((entry) {
                        int index = entry.key;
                        String facility = entry.value;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFacilities[index] =
                                  !selectedFacilities[index];
                            });
                          },
                          child: Chip(
                            label: Text(
                              facility,
                              style: TextStyle(
                                color: selectedFacilities[index]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            backgroundColor: selectedFacilities[index]
                                ? const Color(0xFF234F68)
                                : const Color(0xFFF5F4F7),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // Handle form submission here
                    //       String sellPrice = sellPriceController.text;
                    //       String size = sizeController.text;
                    //       String bedrooms = bedroomController.text;
                    //       String bathrooms = bathroomController.text;
                    //       String balconies = balconyController.text;

                    //       // Do something with the form data, e.g., submit to an API or database
                    //     },
                    //     child: Container(
                    //         width: 190,
                    //         height: 54,
                    //         decoration: ShapeDecoration(
                    //           color: const Color(0xFF8BC83F),
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //         ),
                    //         child: const Center(child: Text('Finish'))),
                    //   ),
                    // ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          //       // Handle form submission here
                          String sellPrice = sellPriceController.text;
                          String size = sizeController.text;
                          String bedrooms = bedroomController.text;
                          String bathrooms = bathroomController.text;
                          String balconies = balconyController.text;

                          // Do something with the form data, e.g., submit to an API or database
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => BottomSheetModal())));
                        },
                        child: Container(
                          width: 190,
                          height: 54,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF8BC83F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const BottomSheetSucess(
                              title: "Next", height: 75),
                        ),

                        // child: const Center(child: Text('Finish'))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

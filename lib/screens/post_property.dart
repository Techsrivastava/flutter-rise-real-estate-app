import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:partice_project/components/comman_header.dart';
import 'package:partice_project/screens/post_propertylast.dart';

void main() {
  runApp(MaterialApp(
    home: PostProperty(),
  ));
}

class PostProperty extends StatefulWidget {
  const PostProperty({Key? key}) : super(key: key);

  @override
  State<PostProperty> createState() => _PostPropertyState();
}

class _PostPropertyState extends State<PostProperty> {
  String selectedCity = '';
  String selectedListingType = '';
  String selectedCategory = '';
  List<File> selectedPhotos = [];

  Widget buildCityContainer(String cityName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCity = cityName;
        });
      },
      child: CityContainer(
        cityName: cityName,
        isSelected: selectedCity == cityName,
      ),
    );
  }

  Widget buildListingTypeRadio(String type) {
    return RadioListTile<String>(
      title: Text(type),
      value: type,
      groupValue: selectedListingType,
      onChanged: (value) {
        setState(() {
          selectedListingType = value!;
        });
      },
    );
  }

  Widget buildCategoryContainer(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: CategoryContainer(
        category: category,
        isSelected: selectedCategory == category,
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedPhotos.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Commonheader(),
                ),
                Text(
                  'Select Your City:',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCityContainer('Lucknow'),
                    buildCityContainer('Indore'),
                    buildCityContainer('Banaras'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Select Listing Type:',
                  style: TextStyle(fontSize: 18),
                ),
                buildListingTypeRadio('Buy'),
                buildListingTypeRadio('Sell'),
                SizedBox(height: 20),
                Text(
                  'Property Category:',
                  style: TextStyle(fontSize: 18),
                ),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    buildCategoryContainer('House'),
                    buildCategoryContainer('Apartment'),
                    buildCategoryContainer('Hotel'),
                    buildCategoryContainer('Villa'),
                    buildCategoryContainer('Cottage'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Add Photos:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: _pickImage,
                //   child: Text('Select Photos'),
                // ),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF5F4F7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(125),
                      ),
                    ),
                    child: Image.asset('lib/assets/icons/plus.png'),
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: selectedPhotos.map((File image) {
                    return Image.file(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Go back to the previous step or screen
                      },
                      child: Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the next step or screen with the selected data
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PropertyPostingLast())));
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CityContainer extends StatelessWidget {
  final String cityName;
  final bool isSelected;

  CityContainer({
    required this.cityName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.blue : const Color(0xFFF5F4F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Text(
          cityName,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final String category;
  final bool isSelected;

  CategoryContainer({
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.blue : const Color(0xFFF5F4F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

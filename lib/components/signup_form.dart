import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partice_project/components/app_button.dart';
import 'package:partice_project/components/app_input.dart';
import 'package:partice_project/components/gap.dart';
import 'package:partice_project/constant/colors.dart';
import 'package:partice_project/utils/helper.dart';
import 'package:partice_project/utils/route_name.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final whatsappNumber = TextEditingController();
  final propertyLocation = TextEditingController();
  final altMobileNumber = TextEditingController();
  final companyName = TextEditingController();
  final companyAddress = TextEditingController();
  final profilePhoto = TextEditingController();

  final focusNodeEmail = FocusNode();
  final focusNodePassword = FocusNode();
  final focusNodeUser = FocusNode();
  final focusNodeWhatsapp = FocusNode();
  final focusNodePropertyLocation = FocusNode();
  final focusNodeAltMobile = FocusNode();
  final focusNodeCompany = FocusNode();
  final focusNodeCompanyAddress = FocusNode();
  final focusNodeProfilePhoto = FocusNode();

  String? imagePath; // Stores the selected image path

  // Function to open image picker
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    whatsappNumber.dispose();
    propertyLocation.dispose();
    altMobileNumber.dispose();
    companyName.dispose();
    companyAddress.dispose();
    profilePhoto.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeUser.dispose();
    focusNodeWhatsapp.dispose();
    focusNodePropertyLocation.dispose();
    focusNodeAltMobile.dispose();
    focusNodeCompany.dispose();
    focusNodeCompanyAddress.dispose();
    focusNodeProfilePhoto.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    Helper helper = Helper();
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name Field
              AppInput(
                myController: username,
                focusNode: focusNodeUser,
                onFiledSubmitedValue: (value) {
                  print(value);
                },
                keyBoardType: TextInputType.text,
                obscureText: false,
                isFilled: true,
                hinit: "Enter fullname",
                leftIcon: true,
                icon: const Icon(Icons.person),
                onValidator: (value) {
                  if (value.isEmpty)
                    return 'Enter fullname';
                  else if (value.length < 3)
                    return "Full name should have at least 3 characters";
                },
              ),

              Gap(isWidth: false, isHeight: true, height: height * 0.019),

              // WhatsApp Mobile Number Field
              AppInput(
                myController: whatsappNumber,
                focusNode: focusNodeWhatsapp,
                onFiledSubmitedValue: (value) {
                  print(value);
                },
                keyBoardType: TextInputType.phone,
                obscureText: false,
                isFilled: true,
                hinit: "Enter WhatsApp Mobile No.",
                leftIcon: true,
                icon: const Icon(Icons.phone),
                onValidator: (value) {
                  if (value.isEmpty) return 'Enter WhatsApp Mobile No.';
                  // Add more validation as needed
                },
              ),

              Gap(isWidth: false, isHeight: true, height: height * 0.019),

              // Property Location Field
              AppInput(
                myController: propertyLocation,
                focusNode: focusNodePropertyLocation,
                onFiledSubmitedValue: (value) {
                  print(value);
                },
                keyBoardType: TextInputType.text,
                obscureText: false,
                isFilled: true,
                hinit: "Enter Property Location",
                leftIcon: true,
                icon: const Icon(Icons.location_on),
                onValidator: (value) {
                  if (value.isEmpty) return 'Enter Property Location';
                  // Add more validation as needed
                },
              ),

              Gap(isWidth: false, isHeight: true, height: height * 0.019),

              // Alt Mobile Number Field
              AppInput(
                myController: altMobileNumber,
                focusNode: focusNodeAltMobile,
                onFiledSubmitedValue: (value) {
                  print(value);
                },
                keyBoardType: TextInputType.phone,
                obscureText: false,
                isFilled: true,
                hinit: "Enter Alt Mobile No.",
                leftIcon: true,
                icon: const Icon(Icons.phone),
                onValidator: (value) {
                  if (value.isEmpty) return 'Enter Alt Mobile No.';
                  // Add more validation as needed
                },
              ),

              Gap(isWidth: false, isHeight: true, height: height * 0.019),

              // Company Name Field
              AppInput(
                myController: companyName,
                focusNode: focusNodeCompany,
                onFiledSubmitedValue: (value) {
                  print(value);
                },
                keyBoardType: TextInputType.text,
                obscureText: false,
                isFilled: true,
                hinit: "Enter Company Name",
                leftIcon: true,
                icon: const Icon(Icons.business),
                onValidator: (value) {
                  if (value.isEmpty) return 'Enter Company Name';
                  // Add more validation as needed
                },
              ),

              Gap(isWidth: false, isHeight: true, height: height * 0.019),

              // Company Address Field
              AppInput(
                myController: companyAddress,
                focusNode: focusNodeCompanyAddress,
                onFiledSubmitedValue: (value) {
                  print(value);
                },
                keyBoardType: TextInputType.text,
                obscureText: false,
                isFilled: true,
                hinit: "Enter Company Address",
                leftIcon: true,
                icon: const Icon(Icons.location_on),
                onValidator: (value) {
                  if (value.isEmpty) return 'Enter Company Address';
                  // Add more validation as needed
                },
              ),

              Gap(isWidth: false, isHeight: true, height: height * 0.019),

              // Upload Profile Photo Field

              GestureDetector(
                onTap: _pickImage, // Open image picker when tapped
                child: DottedBorder(
                  color: Colors.green, // Border color
                  strokeWidth: 2, // Border width
                  child: Container(
                    width: double.infinity,
                    height: 127,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Add your image here, or ',
                                style: TextStyle(
                                  color: Color(0xFFA1A1A1),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  height: 1.67,
                                ),
                              ),
                              TextSpan(
                                text: 'browse',
                                style: TextStyle(
                                  color: Color(0xFF29AAE1),
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  height: 1.67,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(isWidth: false, isHeight: true, height: height * 0.03),
        AppButton(
          onPress: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushNamed(context, RoutesName.otpScreen,
                  arguments: {"email": email.text});
              _formKey.currentState!.reset();
            }
          },
          title: "Register",
          height: 63,
          textColor: AppColors.whiteColor,
        )
      ],
    );
  }
}

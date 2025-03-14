import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'dialoug_page.dart';

class NumregisPage extends StatefulWidget {
  const NumregisPage({super.key});

  @override
  State<NumregisPage> createState() => _NumregisPageState();
}

class _NumregisPageState extends State<NumregisPage> {
  String countryCode = '+880';
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEyePressed = false;

  String phoneError = '';
  String passwordError = '';

  void _validateForm(BuildContext context) {
    String phoneNumber = phoneController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      phoneError = '';
      passwordError = '';
    });

    if (phoneNumber.isEmpty && password.isEmpty) {
      setState(() {
        phoneError = 'Please complete your phone number';
        passwordError = 'Please complete your password';
      });
    } else if (phoneNumber.isEmpty) {
      setState(() {
        phoneError = 'Please complete your phone number';
      });
    } else if (password.isEmpty) {
      setState(() {
        passwordError = 'Please complete your password';
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => DialougPage(
          countryCode: countryCode,
          phoneNumber: phoneNumber,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.arrow_back_ios,
              size: 22,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter your mobile number to verify your account',
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 40),
              Text(
                'Phone',
                style: GoogleFonts.poppins(color: Colors.black87, fontSize: 15),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 212, 212, 212)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CountryCodePicker(
                      onChanged: (CountryCode code) {
                        setState(() {
                          countryCode = code.dialCode!;
                        });
                      },
                      initialSelection: 'BD',
                      favorite: const ['+880', 'BD'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      showFlag: true,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 212, 212, 212)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mobile number',
                            hintStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 212, 212, 212),
                              fontSize: 13,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (phoneError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    phoneError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: GoogleFonts.poppins(color: Colors.black87, fontSize: 15),
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 212, 212, 212)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/lock.png',
                        fit: BoxFit.cover,
                        height: 15,
                        width: 15,
                        color: Color.fromARGB(255, 212, 212, 212),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: !isEyePressed,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (_) {
                          setState(() {
                            isEyePressed = true;
                          });
                        },
                        onTapUp: (_) {
                          setState(() {
                            isEyePressed = false;
                          });
                        },
                        onTapCancel: () {
                          setState(() {
                            isEyePressed = false;
                          });
                        },
                        child: Icon(
                          isEyePressed
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromARGB(255, 212, 212, 212),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (passwordError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    passwordError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 280),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _validateForm(context);
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(255, 0, 93, 207),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:apps_coin/screen/account_setup_page/add_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAddressPage extends StatefulWidget {
  const HomeAddressPage({super.key});

  @override
  State<HomeAddressPage> createState() => _HomeAddressPageState();
}

class _HomeAddressPageState extends State<HomeAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();

  String _addressError = '';
  String _cityError = '';
  String _postcodeError = '';
  String _generalError = '';
  bool _isLoading = false;

  void _validateFields() {
    setState(() {
      _addressError = '';
      _cityError = '';
      _postcodeError = '';
      _generalError = '';

      if (_addressController.text.trim().isEmpty &&
          _cityController.text.trim().isEmpty &&
          _postcodeController.text.trim().isEmpty) {
        _generalError = 'Please complete this step';
      } else {
        if (_addressController.text.trim().isEmpty) {
          _addressError = 'Please complete your address';
        }
        if (_cityController.text.trim().isEmpty) {
          _cityError = 'Please enter your city';
        }
        if (_postcodeController.text.trim().isEmpty) {
          _postcodeError = 'Please enter your postcode';
        }
      }
    });

    if (_generalError.isEmpty &&
        _addressError.isEmpty &&
        _cityError.isEmpty &&
        _postcodeError.isEmpty) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPersonalInfo()));
        });
      });
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
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home address',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'This info needs to be accurate with your ID document.',
                style: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Address Line',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _addressError.isNotEmpty ? Colors.red : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Mr. Jhon Doe',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: -5),
                    ),
                  ),
                ),
              ),
              if (_addressError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    _addressError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 15),
              Text(
                'City',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _cityError.isNotEmpty ? Colors.red : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText: 'City, State',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: -5),
                    ),
                  ),
                ),
              ),
              if (_cityError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    _cityError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 15),
              Text(
                'Postcode',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _postcodeError.isNotEmpty ? Colors.red : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _postcodeController,
                    decoration: InputDecoration(
                      hintText: 'Ex: 00000',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: -5),
                    ),
                  ),
                ),
              ),
              if (_postcodeError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    _postcodeError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 180),
              if (_generalError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _generalError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _validateFields,
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
                  child: _isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : Text(
                          'Continue',
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

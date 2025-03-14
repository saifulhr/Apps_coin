import 'package:apps_coin/screen/account_setup_page/country_off_residence_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apps_coin/screen/account_setup_page/date_off_birth_page.dart';

class AddPersonalInfo extends StatefulWidget {
  const AddPersonalInfo({super.key});

  @override
  State<AddPersonalInfo> createState() => _AddPersonalInfoState();
}

class _AddPersonalInfoState extends State<AddPersonalInfo> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();

    _fullnameController.addListener(_validateFields);
    _usernameController.addListener(_validateFields);
    _dateOfBirthController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _fullnameController.removeListener(_validateFields);
    _usernameController.removeListener(_validateFields);
    _dateOfBirthController.removeListener(_validateFields);
    super.dispose();
  }

  void _validateFields() {
    if (_fullnameController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _dateOfBirthController.text.isNotEmpty) {
      setState(() {
        _errorMessage = '';
      });
    }
  }

  void _onContinuePressed() {
    if (_fullnameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _dateOfBirthController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please complete all the data';
      });
    } else {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CountryOffResidencePage()));
      });
    }
  }

  void _showDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DateOffBirthPage(
          onDateSelected: (selectedDate) {
            setState(() {
              _dateOfBirthController.text =
                  '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
            });
          },
        );
      },
    );
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
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add your personal info',
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
              SizedBox(height: 15),
              Text(
                'Full Name',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _fullnameController,
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
              SizedBox(height: 15),
              Text(
                'Username',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 212, 212, 212)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        '@',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 93, 207),
                            fontSize: 15),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _usernameController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: 'username',
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 15),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: -6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Date of Birth',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _showDatePicker(context);
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          _dateOfBirthController.text.isEmpty
                              ? 'MM/DD/YYYY'
                              : _dateOfBirthController.text,
                          style: GoogleFonts.poppins(
                            color: _dateOfBirthController.text.isEmpty
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _errorMessage,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              SizedBox(
                height: 220,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onContinuePressed,
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
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
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

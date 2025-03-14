import 'package:apps_coin/screen/account_setup_page/add_email.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apps_coin/screen/authentication/signup_page/horizontal_line_verification.dart';

class NumVerifyPage extends StatefulWidget {
  final String phoneNumber;

  const NumVerifyPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<NumVerifyPage> createState() => _NumVerifyPageState();
}

class _NumVerifyPageState extends State<NumVerifyPage> {
  final List<TextEditingController> _textControllers =
      List.generate(6, (index) => TextEditingController());
  final List<bool> _hasInput = List.generate(6, (index) => false);
  bool _showError = false;
  bool _isVerifying = false;

  void _onChanged(String value, int index) {
    setState(() {
      if (value.length > 1) {
        _textControllers[index].text = value.substring(0, 1);
        _textControllers[index].selection = TextSelection.collapsed(offset: 1);
      }
      _hasInput[index] = value.isNotEmpty;
      _showError = false;
    });

    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).nextFocus();
    }

    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  void _onVerifyPressed() async {
    bool isComplete =
        _textControllers.every((controller) => controller.text.isNotEmpty);

    if (!isComplete) {
      setState(() {
        _showError = true;
      });
    } else {
      setState(() {
        _isVerifying = true;
      });

     
      await Future.delayed(Duration(seconds: 3));

      setState(() {
        _isVerifying = false;
      });

      
      for (var controller in _textControllers) {
        controller.clear();
      }
      setState(() {
        _hasInput.fillRange(0, _hasInput.length, false);
        _showError = false;
      });

      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddEmail()),
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
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm your phone',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'We sent a 6-digit code to',
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.phoneNumber,
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return HorizontalLineVerification(
                      isInputted: _hasInput[index],
                      controller: _textControllers[index],
                      index: index,
                      onChanged: _onChanged,
                    );
                  }),
                ),
              ),
              if (_showError)
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(
                    child: Text(
                      'Please complete your 6-digit code',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t get a code?',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'Resend',
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 0, 93, 207),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 360),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isVerifying ? null : _onVerifyPressed,
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      _isVerifying
                          ? Color.fromARGB(255, 0, 93, 207).withOpacity(0.7)
                          : Color.fromARGB(255, 0, 93, 207),
                    ),
                    side: WidgetStateProperty.all(
                      BorderSide(
                        color: Color.fromARGB(255, 0, 93, 207),
                        width: 1,
                      ),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: _isVerifying
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Verify Your Number',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
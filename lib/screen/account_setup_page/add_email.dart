import 'package:apps_coin/screen/account_setup_page/home_address_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmail extends StatefulWidget {
  const AddEmail({super.key});

  @override
  State<AddEmail> createState() => _AddEmailState();
}

class _AddEmailState extends State<AddEmail> {
  final TextEditingController _emailController = TextEditingController();
  String _emailError = '';
  bool _isLoading = false;

  void _validateEmail() {
    String email = _emailController.text.trim();

    if (!email.contains('@') || !email.endsWith('.com')) {
      setState(() {
        _emailError = 'Invalid email, please check your email';
      });
    } else {
      setState(() {
        _emailError = '';
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });

        _emailController.clear();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeAddressPage(),
          ),
        );
      });
    }
  }

  void _clearErrorOnType(String email) {
    if (_emailError.isNotEmpty &&
        email.contains('@') &&
        email.endsWith('.com')) {
      setState(() {
        _emailError = '';
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
                'Add your email',
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
                'Email',
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
                    color: _emailError.isNotEmpty
                        ? Colors.red
                        : Color.fromARGB(255, 212, 212, 212),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/email.png',
                        fit: BoxFit.cover,
                        height: 16,
                        width: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _emailController,
                        onChanged: (value) {
                          _clearErrorOnType(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'name@example.com',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.only(top: -6),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_emailError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _emailError,
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 380),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _validateEmail,
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

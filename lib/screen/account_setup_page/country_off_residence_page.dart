import 'package:apps_coin/screen/pin_setup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';

class CountryOffResidencePage extends StatefulWidget {
  const CountryOffResidencePage({super.key});

  @override
  State<CountryOffResidencePage> createState() =>
      _CountryOffResidencePageState();
}

class _CountryOffResidencePageState extends State<CountryOffResidencePage> {
  Country? _selectedCountry;
  bool _isLoading = false;

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  Future<void> _confirmAndNavigate() async {
    if (_selectedCountry == null) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const PinSetupPage()));
    });
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
                'Country of residence',
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
              const SizedBox(height: 20),
              Text(
                'Country',
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _showCountryPicker,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      if (_selectedCountry != null)
                        Row(
                          children: [
                            Text(
                              _selectedCountry!.flagEmoji,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _selectedCountry!.name,
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 380),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedCountry == null || _isLoading
                      ? null
                      : _confirmAndNavigate,
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
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : Text(
                          'Confirm',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
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

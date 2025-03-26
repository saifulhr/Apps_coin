import 'package:apps_coin/screen/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PinSetupPage extends StatefulWidget {
  const PinSetupPage({super.key});

  @override
  State<PinSetupPage> createState() => _PinSetupPageState();
}

class _PinSetupPageState extends State<PinSetupPage> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  String _enteredPin = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _pinController.addListener(_updatePin);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_pinFocusNode);
    });
  }

  void _updatePin() {
    setState(() {
      _enteredPin = _pinController.text;
    });
  }

  Future<void> _handleConfirmation() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
    });
  }

  @override
  void dispose() {
    _pinController.removeListener(_updatePin);
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
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
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(_pinFocusNode),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create passcode',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'This info needs to be accurate with your ID document.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 0,
                height: 0,
                child: TextField(
                  controller: _pinController,
                  focusNode: _pinFocusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 4,
                  onChanged: (value) {
                    setState(() {
                      _enteredPin = value;
                    });
                  },
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 0),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < _enteredPin.length
                              ? Colors.black
                              : Colors.grey.withOpacity(0.3),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              const Spacer(),
              if (_enteredPin.length == 4)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleConfirmation,
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
                            width: 20,
                            height: 20,
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
                              color: Colors.white,
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

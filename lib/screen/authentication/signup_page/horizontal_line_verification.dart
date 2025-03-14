import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class HorizontalLineVerification extends StatelessWidget {
  final bool isInputted;
  final TextEditingController controller;
  final int index;
  final Function onChanged;

  const HorizontalLineVerification({
    super.key,
    required this.isInputted,
    required this.controller,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 65,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 50,
            child: Container(
              height: 1,
              width: 32,
              color:
                  isInputted ? Color.fromARGB(255, 0, 93, 207) : Colors.black26,
            ),
          ),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color:
                  isInputted ? Color.fromARGB(255, 0, 93, 207) : Colors.black,
              fontSize: 20,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              onChanged(value, index);
            },
          ),
        ],
      ),
    );
  }
}

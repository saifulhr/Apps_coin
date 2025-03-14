import 'package:apps_coin/screen/authentication/signup_page/numregis_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/images02.png',
              fit: BoxFit.cover,
              height: 100,
              width: 250,
            ),
            SizedBox(height: 70),
            Text(
              'Create your Coinpay account',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Coinpay is a powerful tool that allows you to easily send, receive, and track all your transactions.',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NumregisPage()));
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
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                  ),
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  side: WidgetStateProperty.all(
                    BorderSide(
                      color: Color.fromARGB(255, 0, 93, 207),
                      width: 1,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  'Log in',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 93, 207),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By continuing you accept our',
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Terms off Service',
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 0, 93, 207),
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 0, 93, 207)),
                    ),
                    Text(
                      ' and ',
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      'Privecy Policy',
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 0, 93, 207),
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 0, 93, 207)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

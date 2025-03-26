import 'package:flutter/material.dart';

class AddingCard extends StatefulWidget {
  const AddingCard({super.key});

  @override
  State<AddingCard> createState() => _AddingCardState();
}

class _AddingCardState extends State<AddingCard> {
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
    );
  }
}
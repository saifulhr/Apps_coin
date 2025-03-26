import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateOffBirthPage extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DateOffBirthPage({super.key, required this.onDateSelected});

  @override
  _DateOffBirthPageState createState() => _DateOffBirthPageState();
}

class _DateOffBirthPageState extends State<DateOffBirthPage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(9),
      content: SizedBox(
        height: 350,
        width: 400,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_getMonthName(_currentDate.month)} ',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showYearPicker(context);
                        },
                        child: Text(
                          '${_currentDate.year}',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 28),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left, size: 20),
                      onPressed: () {
                        setState(() {
                          _currentDate = DateTime(
                              _currentDate.year, _currentDate.month - 1, 1);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right, size: 20),
                      onPressed: () {
                        setState(() {
                          _currentDate = DateTime(
                              _currentDate.year, _currentDate.month + 1, 1);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                    .map((day) => Expanded(
                          child: Center(
                            child: Text(
                              day,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: _getDaysInMonth(_currentDate) +
                    _getFirstDayOfMonth(_currentDate),
                itemBuilder: (context, index) {
                  final int dayOffset = _getFirstDayOfMonth(_currentDate);
                  if (index < dayOffset) {
                    return Container();
                  }
                  final int day = index - dayOffset + 1;
                  final DateTime currentDay =
                      DateTime(_currentDate.year, _currentDate.month, day);

                  final bool isSelected =
                      currentDay.year == _selectedDate.year &&
                          currentDay.month == _selectedDate.month &&
                          currentDay.day == _selectedDate.day;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = currentDay;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color.fromARGB(255, 0, 93, 207)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$day',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onDateSelected(_selectedDate);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 93, 207),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  void _showYearPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          title: Text(
            'Year',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          content: SizedBox(
            height: 200,
            width: 150,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final int year = DateTime.now().year - index;
                return ListTile(
                  title: Text(
                    '$year',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _currentDate = DateTime(year, _currentDate.month, 1);
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  int _getFirstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday % 7;
  }

  int _getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }
}

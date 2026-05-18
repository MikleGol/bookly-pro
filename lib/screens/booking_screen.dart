import 'package:bookly_pro/bookly_colors.dart';
import 'package:bookly_pro/widgets/filter_chip_button.dart';
import 'package:bookly_pro/widgets/primary_button.dart';
import '../models/service.dart';
import 'package:flutter/material.dart';

final times = ['Morning', 'Afternoon', 'Evening'];

class BookingScreen extends StatefulWidget {
  final Service service;

  const BookingScreen({super.key, required this.service});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final continueNode = FocusNode();
  int selectedTimePartIndex = 0;
  int selectedTimeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final calendarHeight = screenHeight * 0.42;
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      appBar: AppBar(
        backgroundColor: BooklyColors.primary100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('Select Date & Time'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_outlined)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: calendarHeight,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(2100),
                onDateChanged: (dateTime) {},
              ),
            ),
            SizedBox(height: 12),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Available Times',
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Row(
                children: List.generate(3, (index) {
                  final isSelected = selectedTimePartIndex == index;
                  return FilterChipButton(
                    text: times[index],
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedTimePartIndex = index;
                      });
                    },
                    selectedColor: BooklyColors.neutral900,
                  );
                }),
              ),
            ),
            SizedBox(height: 12),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  final isSelected = selectedTimeIndex == index;
                  return ChoiceChip(
                    label: Text(widget.service.availableTimes[index]),
                    selected: isSelected,
                  );
                },
              ),
            ),

            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 100,
                    child: Image.asset(widget.service.imagePath),
                  ),
                  Column(
                    children: [
                      Text(widget.service.title, style: TextStyle(color: BooklyColors.neutral900, fontSize: 14, fontWeight: FontWeight.bold),),
                      Text(widget.service.shortDescription),
                    ],
                  ),
                  PrimaryButton(
                    text: 'Continue',
                    onPressed: () {},
                    focusNode: continueNode,
                    height: 56,
                    width: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/widgets/filter_chip_button.dart';
import 'package:bookly_pro/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../models/service.dart';
import 'booking_confirmation_screen.dart';

const timeParts = ['Morning', 'Afternoon', 'Evening'];

class BookingScreen extends StatefulWidget {
  final Service service;

  const BookingScreen({super.key, required this.service});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final continueNode = FocusNode();

  DateTime selectedDate = DateTime.now();
  int selectedTimePartIndex = 0;
  int? selectedTimeIndex;
  String selectedTime = '';

  @override
  void dispose() {
    continueNode.dispose();
    super.dispose();
  }

  List<String> get filteredTimes {
    final times = widget.service.availableTimes;

    if (selectedTimePartIndex == 0) {
      return times.where(_isMorning).toList();
    }

    if (selectedTimePartIndex == 1) {
      return times.where(_isAfternoon).toList();
    }

    return times.where(_isEvening).toList();
  }

  bool _isMorning(String time) {
    final hour = _hourFromTime(time);
    return hour < 12;
  }

  bool _isAfternoon(String time) {
    final hour = _hourFromTime(time);
    return hour >= 12 && hour < 17;
  }

  bool _isEvening(String time) {
    final hour = _hourFromTime(time);
    return hour >= 17;
  }

  int _hourFromTime(String time) {
    final trimmed = time.trim();

    if (trimmed.contains('AM') || trimmed.contains('PM')) {
      final parts = trimmed.split(' ');
      final hourMinute = parts[0];
      final period = parts[1];

      int hour = int.parse(hourMinute.split(':')[0]);

      if (period == 'PM' && hour != 12) {
        hour += 12;
      }

      if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      return hour;
    }

    return int.parse(trimmed.split(':')[0]);
  }

  @override
  Widget build(BuildContext context) {
    final times = filteredTimes;

    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      appBar: AppBar(
        backgroundColor: BooklyColors.primary100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: BooklyColors.neutral900),
        ),
        title: Text(
          'Select Date & Time',
          style: TextStyle(
            color: BooklyColors.neutral900,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_outlined,
              color: BooklyColors.neutral900,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CalendarCard(
                    selectedDate: selectedDate,
                    onDateChanged: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Available Times',
                    style: TextStyle(
                      color: BooklyColors.neutral900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(timeParts.length, (index) {
                      final isSelected = selectedTimePartIndex == index;

                      return FilterChipButton(
                        text: timeParts[index],
                        isSelected: isSelected,
                        selectedColor: BooklyColors.neutral900,
                        onTap: () {
                          setState(() {
                            selectedTimePartIndex = index;
                            selectedTimeIndex = null;
                            selectedTime = '';
                          });
                        },
                      );
                    }),
                  ),

                  const SizedBox(height: 16),

                  if (times.isEmpty)
                    _EmptyTimesMessage()
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: times.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 44,
                          ),
                      itemBuilder: (context, index) {
                        final isSelected = selectedTimeIndex == index;

                        return _TimeChip(
                          text: times[index],
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              selectedTimeIndex = index;
                              selectedTime = times[index];
                            });
                          },
                        );
                      },
                    ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          _BottomBookingBar(
            service: widget.service,
            focusNode: continueNode,
            selectedDate: selectedDate,
            selectedTime: selectedTime,
            onPressed: () {
              if (selectedTimeIndex == null || selectedTime.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a time')),
                );
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookingConfirmation(
                    service: widget.service,
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CalendarCard extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const _CalendarCard({
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Theme(
        data: baseTheme.copyWith(
          colorScheme: baseTheme.colorScheme.copyWith(
            primary: BooklyColors.primary400,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: BooklyColors.neutral900,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: BooklyColors.primary400,
            ),
          ),
        ),
        child: CalendarDatePicker(
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          onDateChanged: onDateChanged,
        ),
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeChip({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? BooklyColors.primary400 : Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isSelected
                  ? BooklyColors.primary400
                  : BooklyColors.neutral200,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : BooklyColors.neutral900,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyTimesMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        'No available times for this period',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: BooklyColors.neutral500,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BottomBookingBar extends StatelessWidget {
  final Service service;
  final FocusNode focusNode;
  final VoidCallback onPressed;
  final DateTime selectedDate;
  final String selectedTime;

  const _BottomBookingBar({
    required this.service,
    required this.focusNode,
    required this.onPressed,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.sizeOf(context).width < 360 ? 118.0 : 150.0;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 16),
        decoration: BoxDecoration(
          color: BooklyColors.primary100,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(18),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                service.imagePath,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: BooklyColors.neutral900,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    service.shortDescription,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: BooklyColors.neutral400,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '\$${service.price}',
                    style: TextStyle(
                      color: BooklyColors.primary400,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            SizedBox(
              width: buttonWidth,
              child: PrimaryButton(
                text: 'Continue',
                onPressed: onPressed,
                focusNode: focusNode,
                height: 50,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

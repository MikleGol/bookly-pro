import 'service.dart';

class Booking {
  final DateTime date;
  final String time;
  final Service service;
  final double total;

  Booking({
    required this.date,
    required this.time,
    required this.service,
    required this.total,
  });
}

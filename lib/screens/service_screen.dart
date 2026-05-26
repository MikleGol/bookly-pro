import 'package:bookly_pro/theme/bookly_colors.dart';
import 'package:bookly_pro/screens/booking_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/service.dart';
import '../widgets/primary_button.dart';

class ServiceScreen extends StatefulWidget {
  final Service service;

  const ServiceScreen({super.key, required this.service});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final bookFocus = FocusNode();

  @override
  void dispose() {
    bookFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    final imageHeight = screenHeight * 0.42;
    final sheetTop = screenHeight * 0.34;
    return Scaffold(
      backgroundColor: BooklyColors.primary100,
      body: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: Image.asset(widget.service.imagePath, fit: BoxFit.cover),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CircleIconButton(
                      icon: CupertinoIcons.back,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    _CircleIconButton(
                      icon: Icons.favorite_border,
                      iconColor: BooklyColors.primary400,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: sheetTop,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: BooklyColors.primary100,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Header(service: widget.service),

                            const SizedBox(height: 16),

                            Text(
                              widget.service.description,
                              style: TextStyle(
                                color: BooklyColors.neutral700,
                                fontSize: 13,
                                height: 1.45,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 20),

                            _InfoRow(
                              icon: CupertinoIcons.time,
                              title: 'Duration',
                              value: '${widget.service.durationMinutes} min',
                            ),

                            const SizedBox(height: 14),

                            _InfoRow(
                              icon: CupertinoIcons.location_solid,
                              title: 'Location',
                              value: widget.service.distance,
                            ),

                            const SizedBox(height: 14),

                            _InfoRow(
                              icon: CupertinoIcons.star,
                              title: 'Rating',
                              value:
                                  '${widget.service.rating} (${widget.service.reviewsCount} reviews)',
                            ),

                            const SizedBox(height: 22),

                            Divider(height: 1, color: BooklyColors.neutral200),

                            const SizedBox(height: 18),

                            Text(
                              'What\'s Included',
                              style: TextStyle(
                                color: BooklyColors.neutral900,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              height: 34,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.service.tags.length,
                                itemBuilder: (context, index) {
                                  return _TagChip(
                                    text: widget.service.tags[index],
                                  );
                                },
                                separatorBuilder: (_, _) =>
                                    const SizedBox(width: 8),
                              ),
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),

                    _BottomBookingBar(
                      price: widget.service.price,
                      focusNode: bookFocus,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                BookingScreen(service: widget.service),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Service service;

  const _Header({required this.service});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: BooklyColors.neutral900,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                service.providerName,
                style: TextStyle(
                  color: BooklyColors.neutral500,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 4,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: BooklyColors.secondary400,
                        size: 17,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${service.rating}',
                        style: TextStyle(
                          color: BooklyColors.neutral900,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    '(${service.reviewsCount})',
                    style: TextStyle(
                      color: BooklyColors.neutral400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    '·',
                    style: TextStyle(
                      color: BooklyColors.neutral400,
                      fontSize: 12,
                    ),
                  ),

                  Text(
                    '${service.durationMinutes} min',
                    style: TextStyle(
                      color: BooklyColors.neutral400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        Text(
          '\$${service.price}',
          style: TextStyle(
            color: BooklyColors.neutral900,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: BooklyColors.neutral700, size: 20),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: BooklyColors.neutral900,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: BooklyColors.neutral500,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;

  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: BooklyColors.neutral200),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: BooklyColors.neutral600,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BottomBookingBar extends StatelessWidget {
  final int price;
  final FocusNode focusNode;
  final VoidCallback onPressed;

  const _BottomBookingBar({
    required this.price,
    required this.focusNode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: 78,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$$price',
                    style: TextStyle(
                      color: BooklyColors.neutral900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Taxes included',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: BooklyColors.neutral400,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: PrimaryButton(
                text: 'Book Now',
                onPressed: onPressed,
                focusNode: focusNode,
                height: 56,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onPressed;

  const _CircleIconButton({
    required this.icon,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: iconColor ?? BooklyColors.neutral900, size: 20),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withAlpha(215),
        fixedSize: const Size(42, 42),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../model/google_office.dart';

class GoogleOfficeCard extends StatelessWidget {
  const GoogleOfficeCard({
    super.key,
    required this.googleOffice,
    required this.onTap,
  });

  final GoogleOffice googleOffice;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(googleOffice.image),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xE6FFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      googleOffice.region,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A73E8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    googleOffice.name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(googleOffice.address),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

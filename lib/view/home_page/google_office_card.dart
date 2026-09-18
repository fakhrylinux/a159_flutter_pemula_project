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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildCardImage(), _buildCardBody()],
        ),
      ),
    );
  }

  SizedBox _buildCardBody() {
    return SizedBox(
      height: 108,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              googleOffice.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202124),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: Color(0xFF5F6368),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    googleOffice.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      color: Color(0xFF5F6368),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    googleOffice.phone,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF202124),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildCardImage() {
    return Stack(
      children: [
        Image.network(googleOffice.image, fit: BoxFit.cover, scale: 0.5),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
    );
  }
}

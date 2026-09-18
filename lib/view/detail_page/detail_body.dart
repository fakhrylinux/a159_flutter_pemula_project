import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/google_office.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.googleOffice});

  final GoogleOffice googleOffice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(googleOffice.name),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0x331A73E8)),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.network(
                          googleOffice.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                child: Icon(
                                  Icons.business,
                                  size: 64,
                                  color: Color(0xFF1A73E8),
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Kantor Google ${googleOffice.name}',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF202124),
                            ),
                      ),
                      const SizedBox(height: 12),
                      _infoRow(Icons.map_outlined, googleOffice.address),
                      _infoRow(
                        Icons.location_on_outlined,
                        'Lat: ${googleOffice.lat.toStringAsFixed(4)}, '
                        'Long: ${googleOffice.lng.toStringAsFixed(4)}',
                      ),
                      _infoRow(Icons.call_outlined, googleOffice.phone),
                      _infoRow(Icons.public, 'Region ${googleOffice.region} '),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF1A73E8)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF5F6368),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

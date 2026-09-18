import 'package:flutter/material.dart';

import '../../model/google_office.dart';
import 'google_office_card.dart';

class GoogleOfficeList extends StatelessWidget {
  const GoogleOfficeList({
    super.key,
    required this.filteredOffices,
    required this.navigateToDetailPage,
  });

  final List<GoogleOffice> filteredOffices;
  final Function navigateToDetailPage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredOffices.length,
      itemBuilder: (context, index) {
        final googleOffice = filteredOffices[index];
        return GoogleOfficeCard(
          googleOffice: googleOffice,
          onTap: () => navigateToDetailPage(context, googleOffice.id),
        );
      },
    );
  }
}

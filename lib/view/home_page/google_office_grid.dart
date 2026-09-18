import 'package:flutter/material.dart';

import '../../model/google_office.dart';
import 'google_office_card.dart';

class GoogleOfficeGrid extends StatelessWidget {
  const GoogleOfficeGrid({
    super.key,
    required this.filteredOffices,
    required this.navigateToDetailPage,
  });

  final List<GoogleOffice> filteredOffices;
  final Function navigateToDetailPage;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 420,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        final googleOffice = filteredOffices[index];
        return GoogleOfficeCard(
          googleOffice: googleOffice,
          onTap: () => navigateToDetailPage(context, googleOffice.id),
        );
      },
      itemCount: listOfGoogleOffice.length,
    );
  }
}

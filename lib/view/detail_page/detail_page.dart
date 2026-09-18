import 'package:flutter/material.dart';

import '../../model/google_office.dart';
import 'detail_body.dart';

class DetailPage extends StatelessWidget {
  final GoogleOffice googleOffice;
  final String? googleOfficeId;

  DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
    : googleOffice =
          googleOffice ??
          listOfGoogleOffice.firstWhere(
            (office) => office.id == googleOfficeId,
            orElse: () => listOfGoogleOffice.first,
          );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DetailBody(googleOffice: googleOffice)),
    );
  }
}

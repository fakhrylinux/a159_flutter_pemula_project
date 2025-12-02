import 'package:flutter/material.dart';

import '../model/google_office.dart';

class DetailPage extends StatelessWidget {
  /// NOTE: Kamu tidak perlu mengubah properties atau variable instances
  /// ini, yaitu properties [googleOffice] dan [googleOfficeId]. Selain
  /// itu, consturctor [DetailPage] juga tidak perlu kamu ubah.
  final GoogleOffice googleOffice;
  final String? googleOfficeId;

  DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
    /// NOTE: Kamu boleh mengubah initializer list ini.
    : googleOffice = googleOffice ?? listOfGoogleOffice.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DetailPage'),
      ),
      // TODO: Ubahlah widget di bawah ini dan tambahkan informasi detail terkait kantor Google
      body: const Center(child: Text('This is a text.')),
    );
  }
}

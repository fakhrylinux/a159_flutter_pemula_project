import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';
import 'package:flutter_pemula_project/view/detail_page/detail_page.dart';

import 'google_office_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 700) {
            return GoogleOfficeList();
          } else {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 900),
                child: GoogleOfficeGrid(),
              ),
            );
          }
        },
      ),
    );
  }
}

class GoogleOfficeList extends StatelessWidget {
  const GoogleOfficeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfGoogleOffice.length,
      itemBuilder: (context, index) {
        final googleOffice = listOfGoogleOffice[index];
        return GoogleOfficeCard(
          googleOffice: googleOffice,
          onTap: () => _navigateToDetailPage(context, googleOffice.id),
        );
      },
    );
  }
}

class GoogleOfficeGrid extends StatelessWidget {
  const GoogleOfficeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 420,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        final googleOffice = listOfGoogleOffice[index];
        return GoogleOfficeCard(
          googleOffice: googleOffice,
          onTap: () => _navigateToDetailPage(context, googleOffice.id),
        );
      },
      itemCount: listOfGoogleOffice.length,
    );
  }
}

void _navigateToDetailPage(BuildContext context, String googleOfficeId) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return DetailPage(googleOfficeId: googleOfficeId);
      },
    ),
  );
}

import 'package:flutter/material.dart';

import '../../model/google_office.dart';
import '../detail_page/detail_page.dart';
import 'google_office_grid.dart';
import 'google_office_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  List<GoogleOffice> _filteredOffices = listOfGoogleOffice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.fromLTRB(16, 16, 16, 0),
            child: _buildSearchBar(),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 700) {
                  return GoogleOfficeList(
                    filteredOffices: _filteredOffices,
                    navigateToDetailPage: _navigateToDetailPage,
                  );
                } else {
                  return Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 900),
                      child: GoogleOfficeGrid(
                        filteredOffices: _filteredOffices,
                        navigateToDetailPage: _navigateToDetailPage,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextField(
        onChanged: (query) {
          _filterOffices(query);
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Cari kantor Google (nama / alamat)...',
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF5F6368)),
          suffixIcon: _searchQuery.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear, color: Color(0xFF5F6368)),
                  onPressed: () => _filterOffices(''),
                ),
        ),
      ),
    );
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

  void _filterOffices(String query) {
    setState(() {
      _searchQuery = query;
      final keyword = _searchQuery.trim().toLowerCase();
      if (keyword.isEmpty) {
        _filteredOffices = listOfGoogleOffice;
      } else {
        _filteredOffices = listOfGoogleOffice.where((office) {
          return office.name.toLowerCase().contains(keyword) ||
              office.address.toLowerCase().contains(keyword);
        }).toList();
      }
    });
  }
}

import 'package:animated_dropdown_search_codespark/animated_dropdown_search_codespark.dart';
import 'package:app_socios/src/view/inside/Home/screenlogin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

void main() => runApp(Socios());

class Socios extends StatelessWidget {
  Socios({super.key});
  final List<String> data = [
    'Radio Caravana',
    'Nesec',
    'City Pet',
    'Roland',
    'Grupo KFC',
    'Don Vito',
    'El Español',
    'Buggatti',
    'Etafashion',
  ];

  final _searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AnimatedDropdownSearch(
            data: data,
            onSelected: (value) {
              print("Selected: $value");
            },
            hint: "Buscar Empresa",
            enableSearch: true,
            shouldHighlightMatchedText: true,
            matchedTextHighlightColor: Colors.red,
            selectedHighlightColor: Colors.orange,
            maxHeightForOptions: 200,
            scrollPercentageColorIndicator: Colors.green,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

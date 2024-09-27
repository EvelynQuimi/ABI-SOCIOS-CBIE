import 'package:flutter/material.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

void main() => runApp(const Socios());

class Socios extends StatelessWidget {
  const Socios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //   title: const Text('Buscar por empresa o representante legal'),
      //   ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: StandardSearchAnchor(
                searchBar: StandardSearchBar(
                  bgColor: Colors.white,
                ),
                suggestions: StandardSuggestions(
                  suggestions: [
                    StandardSuggestion(text: 'Nesec'),
                    StandardSuggestion(text: 'Radio Caravana'),
                    StandardSuggestion(text: 'Semedic'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.black12,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}

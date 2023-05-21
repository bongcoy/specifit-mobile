import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0,),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Cari olahraga...',
          hintStyle: const TextStyle(color: greyColor),
          prefixIcon: const Icon(Icons.search, color: greyColor,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: greyColor)
          ),
        ),
        onChanged: (value) {
          // Perform search operation here
          print('Search query: $value');
        },
      ),
    );
  }
}

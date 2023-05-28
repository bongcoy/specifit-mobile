import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class SearchBox extends StatelessWidget {
  SearchBox({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Cari olahraga...',
        hintStyle: const TextStyle(color: greyColor),
        prefixIcon: const Icon(Icons.search, color: greyColor,),
        contentPadding: const EdgeInsets.all(4.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: greyColor)
        ),
      ),
      onChanged: (value) {
        // Perform search operation here
        print('Search query: $value');
      },
    );
  }
}

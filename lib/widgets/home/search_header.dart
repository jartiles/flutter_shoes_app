import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: _decoration(),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: const Icon(Icons.menu, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      hintText: 'Search',
      prefixIcon: const Icon(Icons.search),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFf6f6f6),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFd1d0d0),
          width: 2,
        ),
      ),
    );
  }
}

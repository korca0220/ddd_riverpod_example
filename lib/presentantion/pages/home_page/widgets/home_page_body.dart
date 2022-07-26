import 'package:ddd_riverpod_example/presentantion/pages/home_page/widgets/rick_and_morty_items.dart';
import 'package:ddd_riverpod_example/presentantion/pages/home_page/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SearchBar(),
          const RickAndMortyItems(),
        ],
      ),
    );
  }
}

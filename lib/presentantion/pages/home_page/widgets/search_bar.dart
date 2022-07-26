import 'package:ddd_riverpod_example/application/search/search_event.dart';
import 'package:ddd_riverpod_example/presentantion/common_widgets/colors.dart';
import 'package:ddd_riverpod_example/presentantion/pages/home_page/constants.dart';
import 'package:ddd_riverpod_example/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final textfieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 100.w,
      height: 5.h,
      decoration: const BoxDecoration(
        color: blueGreyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            width: 60.w,
            height: 20.h,
            child: Center(
              child: TextField(
                controller: textfieldController,
                cursorColor: whiteColor,
                style: const TextStyle(color: whiteColor),
                decoration: const InputDecoration.collapsed(
                  hintText: searchCharactersText,
                  hintStyle: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  if (textfieldController.text.isEmpty) {
                    ref.refresh(searchProvider);
                  } else {
                    ref.refresh(searchProvider);
                    ref.read(searchProvider.notifier).mapEventsToState(
                          SearchedTextChanged(
                            text: textfieldController.text,
                          ),
                        );
                  }
                },
                icon: const Icon(
                  Icons.search,
                  color: whiteColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

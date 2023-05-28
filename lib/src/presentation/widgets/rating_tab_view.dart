import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';
import 'package:specifit/src/presentation/widgets/cards/rate_item.dart';

class RatingTabView extends StatelessWidget {
  const RatingTabView({Key? key}) : super(key: key);
  final String rate = "4.7";
  final String nRate = "21";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: orangeColor,
                  ),
                  Text("$rate dari $nRate ulasan"),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: const Text("Lihat Semua"),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (ctx, idx) {
                return const RateItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}

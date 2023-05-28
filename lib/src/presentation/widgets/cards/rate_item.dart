import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class RateItem extends StatelessWidget {
  const RateItem({Key? key}) : super(key: key);
  final String imageUrl = "assets/images/patrick.jpg";
  final int rateValue = 4;
  final String name = "Rafli";
  final String review =
      "Mantap programnya, baru aja coba 2 minggu udah turun 10 kg blabalala balabbalbal balalballabblabl!!!";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildStarIcon(1),
                    buildStarIcon(2),
                    buildStarIcon(3),
                    buildStarIcon(4),
                    buildStarIcon(5),
                  ],
                ),
                const SizedBox(height: 8),
                Text(name),
                Text(
                  review,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildStarIcon(int starNumber) {
    Color starColor = starNumber <= rateValue ? orangeColor : Colors.grey;
    return Icon(
      Icons.star,
      color: starColor,
    );
  }
}

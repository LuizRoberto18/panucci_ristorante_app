import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

import '../cardapio.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "Drinks",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontFamily: "Caveat"),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: items.length,
              (context, index) {
                return DrinkItem(
                  imageURI: items[index]["image"],
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
              childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape? 1.2: 158 / 194,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
          )
        ],
      ),
    );
  }
}

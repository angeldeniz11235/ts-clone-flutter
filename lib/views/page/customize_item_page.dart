import 'package:flutter/material.dart';

class CustomizeItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var _itemHeaderSize = screenWidth * 0.50;

    return Column(
      children: [
        SizedBox(height: 500),
        Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: _itemHeaderSize,
                  child: Image.network(
                      "https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/5:4/w_3129,h_2503,c_limit/Smashburger-recipe-120219.jpg"),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: screenWidth * 0.90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Item Name",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text("Price | XXX cal"),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                      "Beard raclette trust fund, truffaut vegan gentrify chillwave live-edge cronut knausgaard. Fanny pack retro wayfarers, slow-carb waistcoat butcher ennui green juice bitters swag shaman succulents man braid."),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            Text("includes"),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 3),
                itemBuilder: (context, i) {
                  return Container();
                })
          ],
        )
      ],
    );
  }
}

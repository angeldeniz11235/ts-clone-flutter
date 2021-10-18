import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/category_list_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Select your location"),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: BaseButton(
              buttonText: "Start my order",
              onPressed: () {
                Navigator.pop(context);
                Provider.of<AppRouterDelegate>(context, listen: false)
                    .navigateTo(CategoryListRoutePath());
              },
            ),
          )
        ],
      ),
    );
  }
}

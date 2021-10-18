import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/category_items_route_path.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/customize_items_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/components/menu/menu_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.black54,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              Text(
                "Category Name",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Expanded(
          child: MenuItemListView(onItemTapped: () {
            Provider.of<AppRouterDelegate>(context, listen: false)
                .navigateTo(CustomizeItemsRoutePath());
          }),
        )
      ],
    );
  }
}

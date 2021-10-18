import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/router/routes/category_items_route_path.dart';
import 'package:dev_jayhackett_blogdemo/views/components/menu/menu_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
            "https://www.thedenverear.com/wp-content/uploads/2020/08/Thumbnail.jpg"),
        SizedBox(
          height: 8.0,
        ),
        Expanded(
          child: MenuItemListView(onItemTapped: () {
            Provider.of<AppRouterDelegate>(context, listen: false)
                .navigateTo(CategoryItemsRoutePath());
          }),
        )
      ],
    );
  }
}

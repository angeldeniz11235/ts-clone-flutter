import 'package:flutter/material.dart';

class MenuItemListView extends StatelessWidget {
  final void Function()? onItemTapped;
  const MenuItemListView({
    Key? key,
    this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                onTap: this.onItemTapped,
                leading: SizedBox(
                  height: 75,
                  width: 75,
                  child: Container(
                    color: Colors.redAccent,
                  ),
                ),
                title: Text("Item ${i + 1}", style: TextStyle(fontSize: 20.0))),
          );
        },
        separatorBuilder: (context, i) => Divider(),
        itemCount: 10);
  }
}

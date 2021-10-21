import 'package:flutter/material.dart';

class QuickAddButton extends StatelessWidget {
  final String helpText;
  final Widget icon;
  final Widget content;
  final void Function()? onPressed;
  const QuickAddButton(
      {Key? key,
      required this.icon,
      required this.helpText,
      required this.content,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButton(
            onPressed: this.onPressed != null
                ? this.onPressed
                : () {
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(helpText),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close))
                              ],
                            ),
                          );
                        });
                  },
            icon: icon,
            color: Colors.redAccent,
            // splashColor: Colors.white,
            // highlightColor: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        Text(helpText)
      ],
    );
  }
}

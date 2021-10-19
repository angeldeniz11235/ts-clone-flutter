import 'package:dev_jayhackett_blogdemo/router/router_delegate.dart';
import 'package:dev_jayhackett_blogdemo/views/components/buttons/quick_action_button.dart';
import 'package:dev_jayhackett_blogdemo/views/page/location_select_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _teamNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            height: double.infinity,
            child: Image.network(
                // "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1000&dpr=1",
                "https://st2.depositphotos.com/3885521/7188/v/950/depositphotos_71882325-stock-illustration-vector-sports-balls-black-and.jpg",
                fit: BoxFit.fitHeight
                // scale: 5.0,
                ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Good Evening",
            //         style: TextStyle(fontSize: 20.0),
            //       ),
            //       SizedBox(height: 4.0),
            //       Text(
            //         "Lets have dinner",
            //         style: TextStyle(fontSize: 24.0),
            //       )
            //     ],
            //   ),
            // ),
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //       child: BaseButton(
            //         buttonText: "Deliver",
            //       ),
            //     ),
            //     SizedBox(height: 16.0),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //       child: BaseButton(
            //         buttonText: "Pickup",
            //         onPressed: () {
            //           showBottomSheet(
            //               context: context,
            //               builder: (context) {
            //                 return LocationSelectPage();
            //               });
            //         },
            //       ),
            //     ),
            //     SizedBox(height: 16.0)
            //   ],
            // ),
            QuickAddMenu(teamNameController: _teamNameController),
          ],
        )
      ],
    );
  }
}

class BaseButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  const BaseButton({Key? key, required this.buttonText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            // alignment: Alignment.center,
            // minimumSize: MaterialStateProperty.all(Size.infinite),
            backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
        onPressed: this.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.buttonText,
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ],
          ),
        ));
  }
}

class QuickAddMenu extends StatelessWidget {
  const QuickAddMenu({
    Key? key,
    required TextEditingController teamNameController,
  })  : _teamNameController = teamNameController,
        super(key: key);

  final TextEditingController _teamNameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickAddButton(
            icon: Icon(Icons.add_box),
            helpText: "Add Team",
            content: Container(
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: _teamNameController,
                  )
                ],
              )),
            ),
          ),
          QuickAddButton(
            icon: Icon(Icons.person),
            helpText: "Add Player",
            content: Container(),
          ),
          QuickAddButton(
            icon: Icon(Icons.chat),
            helpText: "chat",
            content: Container(),
          ),
          QuickAddButton(
            icon: Icon(Icons.email),
            helpText: "Email",
            content: Container(),
          ),
        ],
      ),
    );
  }
}

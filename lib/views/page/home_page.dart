import 'package:dev_jayhackett_blogdemo/views/components/buttons/quick_action_button.dart';
import 'package:flutter/material.dart';

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
                "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1000&dpr=1",
                fit: BoxFit.fitHeight
                // scale: 5.0,
                ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Evening",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Lets have dinner",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            )
            // QuickAddMenu(teamNameController: _teamNameController),
          ],
        )
      ],
    );
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

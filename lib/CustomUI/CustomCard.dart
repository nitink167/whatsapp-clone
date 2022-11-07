import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/IndividualScreen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualScreen(
              chatModel: chatModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: chatModel.isGroup
                  ? const Icon(
                      Icons.groups,
                      color: Colors.white,
                      size: 30,
                    )
                  : Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 7,
                ),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 20.0),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}

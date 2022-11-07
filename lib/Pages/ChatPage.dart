import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Dev Stack",
      icon: "person",
      isGroup: false,
      time: "4:00",
      currentMessage: "Hi Kishor",
    ),
    ChatModel(
      name: "Kishor",
      icon: "person",
      isGroup: false,
      time: "10:00",
      currentMessage: "Hi Dev",
    ),
    ChatModel(
      name: "Dev Server Chat",
      icon: "groups",
      isGroup: true,
      time: "10:00",
      currentMessage: "Hi Everyone in this group",
    ),
    ChatModel(
      name: "Kollins",
      icon: "person.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "Hi Everyone",
    ),
    ChatModel(
      name: "Langara Projects",
      icon: "groups",
      isGroup: true,
      time: "11:00",
      currentMessage: "Hi Langarians",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => SelectContact(),
            ),
          );
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}

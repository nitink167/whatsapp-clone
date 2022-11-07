import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ButtonCard.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Dev Stack",
        status: "a full stack developer",
      ),
      ChatModel(
        name: "Saket",
        status: "Saket the skater",
      ),
      ChatModel(
        name: "Shivam",
        status: "Shivam is busy today",
      ),
      ChatModel(
        name: "Ravi",
        status: "Enjoying my life",
      ),
      ChatModel(
        name: "Vikas",
        status: "Leave me a message, I'll contact back",
      )
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "256 Contacts",
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contact"),
                  value: "Contact",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => CreateGroup(),
                  ),
                );
              },
              child: ButtonCard(name: "New Group", icon: Icons.groups),
            );
          } else if (index == 1) {
            return ButtonCard(name: "New Contact", icon: Icons.person_add);
          }
          return ContactCard(contact: contacts[index - 2]);
        },
      ),
    );
  }
}

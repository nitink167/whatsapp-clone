import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/AvatarCard.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack", status: "a full stack developer"),
    ChatModel(name: "Saket", status: "Saket the skater"),
    ChatModel(name: "Shivam", status: "Shivam is busy today"),
    ChatModel(name: "Ravi", status: "Enjoying my life"),
    ChatModel(name: "Vikas", status: "Leave me a message, I'll contact back")
  ];

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add Participants",
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.length > 0 ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  if (contacts[index - 1].selected == false) {
                    setState(() {
                      contacts[index - 1].selected = true;
                      groups.add(contacts[index - 1]);
                    });
                  } else {
                    setState(() {
                      contacts[index - 1].selected = false;
                      groups.remove(contacts[index - 1]);
                    });
                  }
                },
                child: ContactCard(
                  contact: contacts[index - 1],
                ),
              );
            },
          ),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].selected == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  contacts[index].selected = false;
                                  groups.remove(contacts[index]);
                                });
                              },
                              child: AvatarCard(
                                contact: contacts[index],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

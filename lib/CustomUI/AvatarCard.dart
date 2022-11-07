import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.contact}) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.grey,
                  radius: 11,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(contact.name)
        ],
      ),
    );
  }
}

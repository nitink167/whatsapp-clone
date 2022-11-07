import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/CameraPage.dart';
import 'package:whatsapp_clone/Pages/ChatPage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("New Group"), value: "New Group"),
                PopupMenuItem(
                    child: Text("New Broadcast"), value: "New Broadcast"),
                PopupMenuItem(
                    child: Text("Whatsapp Web"), value: "Whatsapp Web"),
                PopupMenuItem(
                    child: Text("Starred Messages"), value: "Starred Messages"),
                PopupMenuItem(child: Text("Settings"), value: "Settings"),
              ];
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "Chats"),
            Tab(text: "Status"),
            Tab(text: "Calls"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(),
          Text("status"),
          Text("calls"),
        ],
      ),
    );
  }
}

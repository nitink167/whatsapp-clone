import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class IndividualScreen extends StatefulWidget {
  const IndividualScreen({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    // print(chatModel);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: widget.chatModel.isGroup
                      ? Icon(Icons.groups)
                      : Icon(Icons.person))
            ],
          ),
        ),
        title: InkWell(
          onTap: () {
            print(widget.chatModel.name);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name,
                style: const TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Last seen today at 18:05",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Text("View Contact"), value: "View Contact"),
                PopupMenuItem(
                    child: Text("Media, Links, and Docs"),
                    value: "Media, Links, and Docs"),
                PopupMenuItem(
                    child: Text("Whatsapp Web"), value: "Whatsapp Web"),
                PopupMenuItem(
                    child: Text("Search Messages"), value: "Search Messages"),
                PopupMenuItem(child: Text("Settings"), value: "Settings"),
              ];
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 65,
                          margin:
                              EdgeInsets.only(left: 5, right: 4, bottom: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      Icons.emoji_emotions,
                                    ),
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.attach_file,
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.camera_alt,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: Icon(Icons.mic),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                    show
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: emojiSelect(),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    Colors.indigo,
                    "Document",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.camera_alt,
                    Colors.purple,
                    "Camera",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.insert_photo,
                    Colors.indigo,
                    "Gallery",
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.headset,
                    Colors.orange,
                    "Audio",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.location_pin,
                    Colors.purple,
                    "Location",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.person,
                    Colors.blue,
                    "Contact",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {
        print(text);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji? emoji) {
        print(emoji);
        setState(() {
          _controller.text = _controller.text + emoji!.emoji;
        });
        print(_controller.text);
      },
      onBackspacePressed: () {
        // Do something when the user taps the backspace button (optional)
      },
      // textEditingController: textEditionController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: const Config(
        columns: 7,
        // emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        showRecentsTab: true,
        recentsLimit: 28,
        noRecents: const Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ), // Needs to be const Widget
        loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}

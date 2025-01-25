import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/features/chat/constants.dart';
import 'package:frontend/features/chat/widgets/chat_widgets.dart';

import 'services/api_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController texteditingcontroller = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    texteditingcontroller = TextEditingController();
    super.initState();
  }

  File? filee;
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      if (file.path != null) {
        setState(() {
          filee = File(file.path!);
        });
      }
      // Handle the picked file
    } else {
      // User canceled the picker
    }
  }

  @override
  void dispose() {
    texteditingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 4,
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
            )),
        title: const Text(
          'MY AI Chatbot',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatWidget(
                    image: chatMessages[index]['image']?.toString(),
                    msg: (chatMessages[index]['msg']).toString(),
                    index: int.parse(
                      chatMessages[index]['chatIndex'].toString(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
                height: 30,
                child: _isTyping
                    ? Center(
                        child: const SpinKitThreeBounce(
                          color: Colors.amber,
                          size: 20.0,
                        ),
                      )
                    : SizedBox()),
            // _isTyping? const Text("Typing..."):const Text("Not Typing"),

            if (!_isTyping) ...[
              if (filee != null)
                Image.file(
                  filee!,
                  height: 120,
                  width: double.maxFinite,
                  fit: BoxFit.fitHeight,
                ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          onSubmitted: (value) {},
                          controller: texteditingcontroller,
                          decoration: const InputDecoration(
                            hintText: "How Can I Help You?",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                          splashColor: Colors.blue,
                          onPressed: () {
                            _pickFile();
                          },
                          icon: Icon(
                            Icons.file_copy,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () async {
                            try {
                              setState(() {
                                _isTyping = true;
                              });
                              chatMessages.add({
                                "msg": texteditingcontroller.text,
                                "chatIndex": 0
                              });
                              texteditingcontroller.clear();
                              final res = await ApiServices.getModels(
                                  filee, texteditingcontroller.text);
                              print("response chai aakei ho $res");
                              chatMessages.add({
                                "msg": res ?? "Something went wrong",
                                "chatIndex": 1,
                                // "image": filee?.readAsBytesSync(),
                              });
                              filee = null;
                              setState(() {
                                _isTyping = false;
                              });
                            } catch (error) {
                              print(error);
                            }
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/features/chat/widgets/text_widget.dart';

import '../constants.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key, required this.msg, required this.index, required this.image});
  final String msg;
  final int index;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: index == 1 ? cardColor : scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (image != null)
                  Image.file(
                    File(image!),
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: index == 0 ? Colors.red : Colors.green,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextWidget(
                        label: msg,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    index == 0
                        ? const SizedBox.shrink()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.thumb_down_alt_outlined,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

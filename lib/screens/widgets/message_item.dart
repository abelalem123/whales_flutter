import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/message.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class MessageItem extends StatelessWidget {
  final MessageModel message;
  const MessageItem({super.key, required this.message});
  bool get isMyMessage => message.authorId == Get.find<AuthController>().userId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(message.createdAt),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMyMessage) ...[
              Padding(
                padding: const EdgeInsets.only(
                  left: 6.0,
                ),
                child: Text(
                  message.authorName,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
            Row(
              mainAxisAlignment:
                  isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: isMyMessage ? Colors.indigo : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: isMyMessage ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

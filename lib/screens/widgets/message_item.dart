import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/message.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class MessageItem extends StatefulWidget {
  final MessageModel message;

  const MessageItem({super.key, required this.message});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  bool _showReply = false;
  bool get isMyMessage =>
      widget.message.authorId == Get.find<AuthController>().userId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(widget.message.createdAt),
      onDismissed: (direction) {
        setState(() {
          _showReply = true;
        });
      },
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
                  widget.message.authorName,
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
                    widget.message.text,
                    style: TextStyle(
                      color: isMyMessage ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            if (_showReply) ...[
              Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.message.authorName}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(widget.message.text,
                          style: TextStyle(color: Colors.black54)),
                    ],
                  )),
            ],
          ],
        ),
      ),
    );
  }
}

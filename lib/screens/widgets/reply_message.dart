import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/message.dart';

class ReplyMessageWidget extends StatelessWidget {
  final MessageModel message;
  final VoidCallback onCancelReply;

  const ReplyMessageWidget({
    required this.message,
    required this.onCancelReply,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Container(
              color: Colors.green,
              width: 4,
            ),
            const SizedBox(width: 8),
            Expanded(child: buildReplyMessage()),
          ],
        ),
      );

  Widget buildReplyMessage() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${message.authorName}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // if (onCancelReply != null)
              //   GestureDetector(
              //     child: Icon(Icons.close, size: 16),
              //     onTap: onCancelReply,
              //   )
            ],
          ),
          const SizedBox(height: 8),
          Text(message.text, style: TextStyle(color: Colors.black54)),
        ],
      );
}

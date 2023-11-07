import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat/widgets/chat_messages.dart';
import 'package:simple_chat/widgets/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat simple'),
          actions: [
            IconButton(
                //Cerrar sesion si se desea
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            const NewMessage(),
          ],
        ));
  }
}

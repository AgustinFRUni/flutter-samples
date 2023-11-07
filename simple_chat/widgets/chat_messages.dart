import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_chat/mobx/messages.dart';
import 'package:simple_chat/widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  final MessagesStore _messagesStore = MessagesStore();

  @override
  Widget build(BuildContext context) {
    //Instancia para autenticacion del usuario
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    //Observador del snapshot de firebase
    return Observer(
          builder: (_) {
            final loadedMessages = _messagesStore.firebaseData;

            if (loadedMessages == null || loadedMessages.isEmpty) {
              return Center(child: Text('No hay mensajes disponibles'));
            }
            // Ordenar los mensajes por el campo 'createdAt'
            loadedMessages.sort((a, b) {
              final aData = a.data() as Map<String, dynamic>?;
              final bData = b.data() as Map<String, dynamic>?;

              final aCreatedAt = aData?['createdAt'] as Timestamp?;
              final bCreatedAt = bData?['createdAt'] as Timestamp?;

              return (bCreatedAt ?? Timestamp.fromDate(DateTime.now()))
                  .compareTo(aCreatedAt ?? Timestamp.fromDate(DateTime.now()));
            });

            //Agrega los mensajes a la screen
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                //Comprobaciones para ver que usuario envia los mensajes y cambia la "bubble" segun sea el caso
                final chatMessage =
                    loadedMessages[index].data() as Map<String, dynamic>;
                final nextChatMessage = (index + 1 < loadedMessages.length)
                    ? loadedMessages[index + 1].data() as Map<String, dynamic>
                    : null;

                final currentMessageUserId = chatMessage['userId'] as String;
                final nextMessageUserId = nextChatMessage != null
                    ? nextChatMessage['userId'] as String
                    : null;
                final nextUserIsSame =
                    nextMessageUserId == currentMessageUserId;

                //Si los mensajes son de un mismo usuario no se imprime el nombre nuevamente
                if (nextUserIsSame) {
                  return MessageBubble.next(
                    message: chatMessage['text'] as String,
                    isMe: authenticatedUser.uid == currentMessageUserId,
                  );
                } else {
                  //Si el usuario que envia el mensaje no es el mismo que el anterior se imprime su nombre
                  return MessageBubble.first(
                    username: chatMessage['userName'] as String,
                    message: chatMessage['text'] as String,
                    isMe: authenticatedUser.uid == currentMessageUserId,
                  );
                }
              },
            );
          },
        ) ??
        Center(child: Text('Cargando mensajes...'));
  }
}

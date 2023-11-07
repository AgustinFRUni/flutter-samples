import 'package:flutter/material.dart';

// Una "bubble" para mostrar mensajes estilizados
class MessageBubble extends StatelessWidget {
  // Se crea una burbuja especial si es la primera de la secuencia
  const MessageBubble.first({
    super.key,
    required this.username,
    required this.message,
    required this.isMe,
  }) : isFirstMessage = true;

  // Burbuja que continua la secuencia
  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  })  : isFirstMessage = false,
        username = null;

  //Se modifica la burbuja un poco si es la primera en la secuencia
  final bool isFirstMessage;

  // Datos auxiliares
  final String? username;
  final String message;

  // Para controlar la alineacion de los mensajes
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // Mensaje desde la derecha si es nuestro mensaje
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // Si es el primer mensaje añade un poco de espacio
                  if (isFirstMessage) const SizedBox(height: 18),
                  if (username != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                      ),
                      child: Text(
                        username!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                  // El borde del mensaje
                  Container(
                    decoration: BoxDecoration(
                      color: isMe
                          ? Colors.grey[300]
                          : theme.colorScheme.secondary.withAlpha(200),
                      // El primer mensaje tiene una pequeña indicacion de cual lado se "envia" el mensaje
                      borderRadius: BorderRadius.only(
                        topLeft: !isMe && isFirstMessage
                            ? Radius.zero
                            : const Radius.circular(12),
                        topRight: isMe && isFirstMessage
                            ? Radius.zero
                            : const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                      ),
                    ),
                    // limites al tamaño
                    constraints: const BoxConstraints(maxWidth: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        // Pequeño espaciado entre mensajes
                        height: 1.3,
                        color: isMe
                            ? Colors.black87
                            : theme.colorScheme.onSecondary,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

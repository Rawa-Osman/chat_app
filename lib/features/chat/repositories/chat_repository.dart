import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository({required this.firestore, required this.auth});

  void sendTextMessage(
      {required BuildContext context,
      required String text,
      required String recieverUserId,
      required UserModel senderUser}) async {
    // user -> sender Id -> reciver id -> messeges -> messege id -> store message
  }
}

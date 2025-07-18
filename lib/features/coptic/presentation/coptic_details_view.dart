import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_textfield.dart';
import 'package:ni_angelos/models/chat_message_model.dart';
import 'package:ni_angelos/models/tune_model.dart';

class CopticDetailsView extends StatelessWidget {
  CopticDetailsView({super.key});
  final TextEditingController controller = TextEditingController();
  final List<ChatMessageModel> messages = [
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
    ChatMessageModel(msgType: MessageType.text, content: "content"),
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TuneModel;
    return SafeArea(
      child: MyCustomScaffold(
        withBackArrow: true,
        appBarTitle: args.title,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Expanded(child: chatMessages()), messageTypeInput()],
          ),
        ),
      ),
    );
  }

  message({required String text}) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomContainer(child: Text(text)),
    );
  }

  chatMessages() {
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return message(text: messages[index].content);
      },
    );
  }

  messageInput() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomTextField(
        hintText: "hintText",
        validator: (v) {
          return null;
        },
        controller: TextEditingController(),
      ),
    );
  }

  messageType(ChatMessageModel msgType) {
    switch (msgType.msgType) {
      case MessageType.text:
        return Text(msgType.content);
      case MessageType.image:
        return Image.file(File(msgType.content), width: 200);
      case MessageType.file:
        return Row(
          children: [
            Icon(Icons.insert_drive_file),
            SizedBox(width: 8),
            Flexible(child: Text(msgType.content)), // filename
          ],
        );
    }
  }

   messageTypeInput() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.image),
          onPressed: pickImage,
        ),
        IconButton(
          icon: Icon(Icons.attach_file),
          onPressed: pickFile,
        ),
        Expanded(
          child: CustomTextField(
            hintText: "Type a message",
            controller: controller,
            validator: (v) => null,
          ),
        ),
        IconButton(
          icon: controller.text.trim().isEmpty
              ? SvgPicture.asset(ImageAssets.recordIcon)
         : Icon(Icons.send,color: ColorManager.secondaryColor),
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              messages.insert(
                0,
                ChatMessageModel(msgType: MessageType.text, content: controller.text),
              );
              controller.clear();
              // setState() to update
            }
          },
        ),
      ],
    );
  }

  void pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      messages.insert(
        0,
        ChatMessageModel(msgType: MessageType.image, content: picked.path),
      );
      // setState()
    }
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      messages.insert(
        0,
        ChatMessageModel(msgType: MessageType.file, content: result.files.single.path!),
      );
      // setState()
    }
  }
}

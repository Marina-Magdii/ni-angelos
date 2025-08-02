import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/custom/custom_textfield.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/services/helper_functions.dart';
import 'package:ni_angelos/models/chat_message_model.dart';
import 'package:ni_angelos/models/tune_model.dart';
import 'package:record/record.dart';

class CopticDetailsView extends StatefulWidget {
  const CopticDetailsView({super.key});

  @override
  State<CopticDetailsView> createState() => _CopticDetailsViewState();
}

class _CopticDetailsViewState extends State<CopticDetailsView> {
  final TextEditingController controller = TextEditingController();
  final record = RecordPlatform.instance;
  final audioPlayer = AudioPlayer();
  String? recordedPath;
  bool isRecording = false;
  bool isPlaying = false;
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
  void dispose() {
    record.dispose;
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TuneModel;
    return MyCustomScaffold(
      leadingWidth: 20.w,
      withBackArrow: true,
      appBarTitle: args.title,
      leading: isAdmin()
      ? IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete_forever_rounded, size: 25.sp),
      ):SizedBox(),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: chatMessages()),
            isAdmin() ? messageTypeInput() : Container(),
          ],
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
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 8.h);
      },
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
        return Image.file(File(msgType.content), width: 200.w);
      case MessageType.file:
        return Row(
          children: [
            Icon(Icons.insert_drive_file),
            SizedBox(width: 8.w),
            Flexible(child: Text(msgType.content)), // filename
          ],
        );
    }
  }

  messageTypeInput() {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.mic_rounded)),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              pickImage();
            },
            icon: Icon(Icons.image_rounded),
          ),
        ),
        IconButton(
          onPressed: () {
            pickFile;
          },
          icon: Icon(Icons.attach_file, color: ColorManager.secondaryColor),
        ),
        Expanded(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextField(
              hintText: "اكتب رسالة",
              controller: controller,
              validator: (v) => null,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send_rounded, color: ColorManager.secondaryColor),
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              messages.insert(
                0,
                ChatMessageModel(
                  msgType: MessageType.text,
                  content: controller.text,
                ),
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
        ChatMessageModel(
          msgType: MessageType.file,
          content: result.files.single.path!,
        ),
      );
      // setState()
    }
  }
}

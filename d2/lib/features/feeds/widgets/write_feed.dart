import 'dart:io';

import 'package:camera/camera.dart';
import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/image_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WriteFeed extends StatefulWidget {
  const WriteFeed({super.key});

  @override
  State<WriteFeed> createState() => _WriteFeedState();
}

class _WriteFeedState extends State<WriteFeed> {
  void _onCancelTap() {
    Navigator.of(context).pop();
  }

  List<XFile> pictures = [];
  late TextEditingController _inputController;
  late ScrollController _scrollContoller;

  int numLines = 3;
  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _scrollContoller = ScrollController();
    _onChangeNumLInes(_inputController.text);
  }

  void _onChangeNumLInes(String text) {
    var lines = '\n'.allMatches(_inputController.text).length + 1;

    setState(() {
      numLines = lines > 3 ? lines : 3;
    });
  }

  void _onUploadTap() async {
    List<XFile>? picturesResult = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImageUploadScreen(),
      ),
    );
    if (picturesResult == null || picturesResult.isEmpty) return;
    pictures = picturesResult;
    setState(() {});
  }

  void _removePicture(int index) {
    if (pictures.isEmpty) return;
    pictures.removeAt(index);
    setState(() {});
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Sizes.size10,
          ),
        ),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            60,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                "New thread",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size20,
                ),
              ),
              leadingWidth: 65,
              leading: GestureDetector(
                onTap: _onCancelTap,
                child: const Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
              Sizes.size16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Scrollbar(
                  controller: _scrollContoller,
                  child: SingleChildScrollView(
                    controller: _scrollContoller,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                foregroundImage: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png",
                                ),
                              ),
                              Gaps.v14,
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                width: 2,
                                height: numLines * 20 +
                                    14 +
                                    (pictures.isEmpty ? 0 : 100),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Gaps.v14,
                              const Opacity(
                                opacity: 0.4,
                                child: CircleAvatar(
                                  radius: Sizes.size10,
                                  foregroundImage: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Raymond",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gaps.v10,
                              TextField(
                                autocorrect: false,
                                enableSuggestions: false,
                                controller: _inputController,
                                onChanged: _onChangeNumLInes,
                                minLines: 1,
                                maxLines: null,
                                style: const TextStyle(
                                  fontSize: Sizes.size12,
                                ),
                                cursorColor: Colors.blue[800],
                                decoration: const InputDecoration(
                                  hintText: "Start a thread...",
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: Sizes.size1,
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              if (pictures.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.only(
                                    bottom: Sizes.size10,
                                  ),
                                  height: 128,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: pictures.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Sizes.size12,
                                          ),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        height: 128,
                                        child: Stack(
                                          children: [
                                            Image.file(
                                              File(pictures[index].path),
                                              fit: BoxFit.contain,
                                            ),
                                            Positioned(
                                              right: Sizes.size2,
                                              top: Sizes.size2,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    _removePicture(index),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCircleXmark,
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Gaps.h10;
                                    },
                                  ),
                                ),
                              GestureDetector(
                                onTap: _onUploadTap,
                                child: const FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size10,
                    vertical: Sizes.size20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Anyone can reply",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: Sizes.size16 + Sizes.size2,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _inputController.text.isNotEmpty ? 1 : 0.6,
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        child: Text(
                          "Post",
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: Sizes.size16 + Sizes.size2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

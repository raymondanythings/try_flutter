import 'dart:io';

import 'package:camera/camera.dart';
import 'package:d2/common/views/widgets/clickable.dart';
import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/auth/repository/auth_repository.dart';
import 'package:d2/features/feeds/view_models/upload_feed_view_model.dart';
import 'package:d2/features/feeds/views/image_upload_screen.dart';
import 'package:d2/features/users/view_models/users_view_model.dart';
import 'package:d2/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WriteFeed extends ConsumerStatefulWidget {
  const WriteFeed({super.key});

  @override
  ConsumerState<WriteFeed> createState() => _WriteFeedState();
}

class _WriteFeedState extends ConsumerState<WriteFeed> {
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

  Future<void> _onPostTap() async {
    ref.read(uploadFeedProvider.notifier).uploadThread(
          _inputController.text,
          pictures
              .map(
                (e) => File(e.path),
              )
              .toList(),
          context,
        );
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
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
              color: isDark
                  ? const Color(
                      0xFF111111,
                    )
                  : null,
            ),
            child: AppBar(
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
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        color: isDark ? Colors.white : null),
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
                                  "https://avatars.githubusercontent.com/u/73725736",
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
                                    "https://avatars.githubusercontent.com/u/73725736",
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
                                decoration: InputDecoration(
                                  hintText: "Start a thread...",
                                  hintStyle: TextStyle(
                                    color: isDark
                                        ? Colors.white.withOpacity(
                                            0.7,
                                          )
                                        : null,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size1,
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
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
                                                child: const FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCircleXmark,
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
                      Clickable(
                        onTap: _onPostTap,
                        disabled: _inputController.text.isEmpty ||
                            ref.watch(uploadFeedProvider).isLoading,
                        child: ref.watch(uploadFeedProvider).isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                "Post",
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: Sizes.size16 + Sizes.size2,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

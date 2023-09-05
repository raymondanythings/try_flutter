import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/widgets/avatar.dart';
import 'package:d2/features/feeds/widgets/feed_sheet.dart';
import 'package:d2/tab_navigation/widgets/members_avatar.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Feed extends StatelessWidget {
  final bool verified;
  final int replices;
  final int likes;

  final String title;
  final String thread;
  final String before;

  final String mainAvatar;
  final List<String>? ImageList;
  final bool isAdd;

  const Feed({
    super.key,
    this.verified = false,
    this.replices = 0,
    this.likes = 0,
    required this.title,
    required this.thread,
    required this.before,
    required this.mainAvatar,
    this.ImageList,
    this.isAdd = true,
  });

  void _onMoreTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const FeedSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size14,
        vertical: Sizes.size14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Avatar(
                imageUrl: mainAvatar,
                isAdd: isAdd,
              ),
              Gaps.h28,
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            verified
                                ? const Row(
                                    children: [
                                      Gaps.h2,
                                      Image(
                                        width: Sizes.size20,
                                        height: Sizes.size20,
                                        image:
                                            AssetImage('assets/verified.png'),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  before,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Gaps.h24,
                                GestureDetector(
                                  onTap: () => _onMoreTap(context),
                                  child: const FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Gaps.v4,
                    Text(
                      thread,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gaps.v10,
          IntrinsicHeight(
            child: Row(
              children: [
                Gaps.h12,
                VerticalDivider(
                  thickness: 2,
                  width: 20,
                  color: Colors.grey.shade400,
                ),
                Gaps.h36,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageList != null
                            ? Container(
                                padding: const EdgeInsets.only(
                                  bottom: Sizes.size10,
                                ),
                                height: 128,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: ImageList!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Sizes.size12,
                                        ),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      height: 128,
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                          ImageList![index],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Gaps.h10;
                                  },
                                ),
                              )
                            : Container(),
                        Wrap(
                          spacing: Sizes.size14,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.heart,
                            ),
                            Transform.flip(
                              flipX: true,
                              child: const FaIcon(
                                FontAwesomeIcons.comment,
                              ),
                            ),
                            const FaIcon(
                              FontAwesomeIcons.retweet,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.paperPlane,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.v10,
          Row(
            children: [
              const MembersAvatar(),
              Gaps.h28,
              Text(
                "$replices replice · $likes likes",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

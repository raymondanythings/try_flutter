import 'package:d2/common/view_models/platform_theme_vm.dart';
import 'package:d2/common/views/widgets/button.dart';
import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/widgets/avatar.dart';
import 'package:d2/features/settings/setting_screen.dart';
import 'package:d2/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserProfileSCreen extends StatefulWidget {
  const UserProfileSCreen({super.key});

  @override
  State<UserProfileSCreen> createState() => _UserProfileSCreenState();
}

class _UserProfileSCreenState extends State<UserProfileSCreen> {
  void _onGearPressed() {
    context.push("/settings");
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const SettingsScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.globe,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size32,
                    ),
                  ),
                  Gaps.h10,
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.barsStaggered,
                      size: Sizes.size28,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size14,
                    vertical: Sizes.size10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Raymond",
                                style: TextStyle(
                                  fontSize: Sizes.size24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Gaps.v8,
                              Row(
                                children: [
                                  const Text(
                                    "@raymondanything",
                                  ),
                                  Gaps.h10,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: Sizes.size6,
                                      horizontal: Sizes.size10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(
                                        999,
                                      ),
                                    ),
                                    child: Text(
                                      "threads.net",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Gaps.v8,
                              const Text(
                                "You can make it what u want.",
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 35,
                            foregroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/73725736",
                            ),
                          ),
                        ],
                      ),
                      Gaps.v14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 10,
                            foregroundImage: NetworkImage(
                              "https://pbs.twimg.com/profile_images/874276197357596672/kUuht00m_400x400.jpg",
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(
                              -Sizes.size10,
                              0,
                            ),
                            child: const CircleAvatar(
                              radius: 10,
                              foregroundImage: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png",
                              ),
                            ),
                          ),
                          Gaps.h5,
                          Text(
                            "2 followers",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          )
                        ],
                      ),
                      Gaps.v24,
                      const FractionallySizedBox(
                        widthFactor: 1,
                        child: SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: Button(
                                  text: "Edit profile",
                                ),
                              ),
                              Gaps.h10,
                              Expanded(
                                child: Button(
                                  text: "Share profile",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabBar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 19,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size14,
                    vertical: Sizes.size20,
                  ),
                  child: ProfileFeed(
                    before: "2h",
                    mainAvatar:
                        "https://avatars.githubusercontent.com/u/73725736",
                    thread:
                        "We are Anonymous, we are legion, we do not forgive, we do not forget. Expect us.",
                    title: "Raymond",
                  ),
                ),
                separatorBuilder: (context, index) => Container(
                  color: Colors.grey.shade200,
                  height: 1,
                ),
              ),
              ListView.separated(
                itemCount: 19,
                separatorBuilder: (context, index) => Container(
                  color: Colors.grey.shade200,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size14,
                      vertical: Sizes.size20,
                    ),
                    child: ReplyFeed(
                      isAdd: false,
                      before: "2h",
                      mainAvatar:
                          "https://source.unsplash.com/random/128x128/?avatar",
                      thread:
                          "my phone feels like a vibrator with all these notifications rn",
                      title: "shityoushouldcareabout",
                      verified: true,
                      replices: 64,
                      likes: 631,
                      reply: ProfileFeed(
                        before: "2h",
                        mainAvatar:
                            "https://avatars.githubusercontent.com/u/73725736",
                        thread:
                            "We are Anonymous, we are legion, we do not forgive, we do not forget. Expect us.",
                        title: "Raymond",
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = context.watch<PlatformThemeViewModel>().isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? const Color(
                0xFF111111,
              )
            : Colors.white,
      ),
      child: const TabBar(
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 1,
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text(
              "Threads",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Text(
              "Replices",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.size16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ProfileFeed extends StatelessWidget {
  final String title;
  final String thread;
  final String before;

  final String mainAvatar;

  const ProfileFeed({
    super.key,
    required this.title,
    required this.thread,
    required this.before,
    required this.mainAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Avatar(
          imageUrl: mainAvatar,
          isAdd: false,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            before,
                            // style: TextStyle(
                            //   color: Colors.black.withOpacity(0.5),
                            // ),
                          ),
                          Gaps.h24,
                          GestureDetector(
                            onTap: () {},
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
              Gaps.v10,
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
      ],
    );
  }
}

class ReplyFeed extends StatelessWidget {
  final bool verified;
  final int replices;
  final int likes;

  final String title;
  final String thread;
  final String before;

  final String mainAvatar;
  final List<String>? ImageList;
  final bool isAdd;
  final Widget reply;

  const ReplyFeed({
    super.key,
    required this.verified,
    required this.replices,
    required this.likes,
    required this.title,
    required this.thread,
    required this.before,
    required this.mainAvatar,
    this.ImageList,
    required this.isAdd,
    required this.reply,
  });

  void _onMoreTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Column(
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
                                      image: AssetImage('assets/verified.png'),
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
        reply,
      ],
    );
  }
}

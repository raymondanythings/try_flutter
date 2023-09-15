import 'package:d2/common/view_models/platform_theme_vm.dart';
import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/widgets/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ref.watch(platformThemeProvider).isDarkMode
                        ? Colors.white
                        : null,
                  ),
                  child: const Image(
                    width: Sizes.size52,
                    image: AssetImage('assets/threads_logo.png'),
                  ),
                ),
                Gaps.v32,
                const Feed(
                  before: "2h",
                  mainAvatar:
                      "https://source.unsplash.com/random/128x128/?avatar",
                  thread:
                      "my phone feels like a vibrator with all these notifications rn",
                  title: "shityoushouldcareabout",
                  verified: true,
                  replices: 64,
                  likes: 631,
                ),
                const Feed(
                  before: "2h",
                  mainAvatar:
                      "https://source.unsplash.com/random/128x128/?avatar",
                  thread: "Photoshoot with Molly pup :)",
                  ImageList: [
                    "https://source.unsplash.com/random/256x128/?person",
                    "https://source.unsplash.com/random/128x128/?Dog",
                    "https://source.unsplash.com/random/128x128/?garden"
                  ],
                  title: "timferriss",
                  verified: true,
                  replices: 64,
                  likes: 631,
                ),
                const Feed(
                  before: "2h",
                  mainAvatar:
                      "https://source.unsplash.com/random/128x128/?girl",
                  thread:
                      "if you're reading this, go water that thirsty plant. You're welcome ☺️",
                  title: "_plantswithkrystal_",
                  verified: true,
                  replices: 8,
                  likes: 74,
                ),
                const Feed(
                  before: "2h",
                  mainAvatar:
                      "https://pbs.twimg.com/profile_images/1337189109631246338/tJyPJ4qh_400x400.jpg",
                  thread:
                      "We are Anonymous, we are legion, we do not forgive, we do not forget. Expect us.",
                  title: "Anonymous",
                  verified: true,
                  ImageList: [
                    "https://pbs.twimg.com/profile_banners/279390084/1459539143/1500x500",
                    "https://pbs.twimg.com/profile_banners/1029475507430146048/1598788569/1500x500"
                  ],
                  replices: 8012,
                  likes: 74348,
                ),
                const Feed(
                  before: "now",
                  mainAvatar:
                      "https://pbs.twimg.com/profile_images/874276197357596672/kUuht00m_400x400.jpg",
                  thread: "45th President of the United States of America🇺🇸",
                  title: "Donald J. Trump",
                  verified: true,
                  ImageList: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFx8Ag4svsvJaKRxJUJ5ri01yAUY4E-kDbEQ&usqp=CAU",
                    "https://static01.nyt.com/images/2023/08/10/multimedia/08goldsmith-fpcz/08goldsmith-fpcz-articleLarge.jpg?quality=75&auto=webp&disable=upscale"
                  ],
                  replices: 250,
                  likes: 477,
                ),
                const Feed(
                  before: "now",
                  mainAvatar:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png",
                  thread:
                      "As we look to the future, emerging technologies like 5G, AI, and blockchain promise to make the Internet even more integrated into our daily lives.",
                  title: "chatgpt",
                  verified: true,
                  ImageList: [
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxFoKwyrbFUhk206N2bm8iGmJmROryzrEWDK5IJDsmA4XZQ1bnezlxe6A43FZhAwHb-dA&usqp=CAU",
                    "https://i.insider.com/6411bdabb6d9f2001891281f?width=1136&format=jpeg"
                  ],
                  replices: 250,
                  likes: 477,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

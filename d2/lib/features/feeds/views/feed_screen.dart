import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/view_models/feed_view_model.dart';
import 'package:d2/features/feeds/views/widgets/feed.dart';
import 'package:d2/features/feeds/views/widgets/sliver_persistent_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSubmitSearch() async {
    await ref
        .read(feedProvider.notifier)
        .searchFeedByThread(context, _controller.value.text);
    // _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(feedProvider).when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stackTrace) => const Center(
              child: Text("Could not load threads."),
            ),
        data: (feeds) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverPersistentSearchBar(
                    controller: _controller,
                    onSubmitted: (value) => _onSubmitSearch(),
                    onSuffixTap: () => _onSubmitSearch(),
                  ),
                ),
                const SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      width: Sizes.size52,
                      image: AssetImage('assets/threads_logo.png'),
                    ),
                  ),
                ),
                SliverList.separated(
                  itemCount: feeds.length,
                  separatorBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return Feed(
                      before: "2h",
                      mainAvatar:
                          "https://source.unsplash.com/random/128x128/?avatar",
                      ImageList: feeds[index].imageList,
                      thread: feeds[index].thread,
                      title: feeds[index].creator,
                      verified: true,
                      replices: feeds[index].replice,
                      likes: feeds[index].likes,
                    );
                  },
                )
              ],
            ),
          );
        });
  }
}

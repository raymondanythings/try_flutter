import 'dart:async';
import 'dart:io';

import 'package:d2/features/auth/repository/auth_repository.dart';
import 'package:d2/features/feeds/models/feed_model.dart';
import 'package:d2/features/feeds/repository/feed_repository.dart';
import 'package:d2/features/feeds/view_models/feed_view_model.dart';
import 'package:d2/features/users/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UploadFeedViewModel extends AsyncNotifier<void> {
  late final FeedRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(feedRepository);
  }

  Future<void> uploadThread(
      String feed, List<File>? images, BuildContext context) async {
    final user = ref.read(authRepository).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(
        () async {
          final feedId = DateTime.now().millisecondsSinceEpoch;
          List<String> imageUrls = [];
          if (images!.isNotEmpty) {
            final uploadTasks = await Future.wait(
              [
                for (int i = 0; i < images.length; i++)
                  _repository.uploadImageFile(
                      images[i], feedId.toString(), i, user!.uid)
              ],
            );
            for (var task in uploadTasks) {
              if (task.metadata != null) {
                imageUrls.add(await task.ref.getDownloadURL());
              }
            }
          }
          await _repository.saveFeed(
            FeedModel(
              thread: feed,
              imageList: imageUrls,
              replice: 0,
              likes: 0,
              creatorUid: user!.uid,
              createdAt: feedId,
              creator: userProfile.name,
            ),
          );

          context.pop();
          await ref.read(feedProvider.notifier).refetch();
        },
      );
    }
  }
}

final uploadFeedProvider = AsyncNotifierProvider<UploadFeedViewModel, void>(
  () => UploadFeedViewModel(),
);

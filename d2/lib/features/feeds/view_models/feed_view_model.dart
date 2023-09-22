import 'dart:async';

import 'package:d2/features/feeds/models/feed_model.dart';
import 'package:d2/features/feeds/repository/feed_repository.dart';
import 'package:d2/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedViewModel extends AsyncNotifier<List<FeedModel>> {
  late final FeedRepository _repository;
  List<FeedModel> _list = [];
  int? lastItemCreatedAt;
  String? lastSearchKeyword;

  Future<List<FeedModel>> _fetchFeeds({int? lastItemCreatedAt}) async {
    final result = await _repository.fetchFeeds(
      lastItemCreatedAt: lastItemCreatedAt ?? this.lastItemCreatedAt,
    );
    this.lastItemCreatedAt = lastItemCreatedAt;
    final feeds = result.docs.map((doc) {
      return FeedModel.fromJson(
        doc.data(),
      );
    });
    return feeds.toList();
  }

  Future<List<FeedModel>> _searchFeeds(String? keyword) async {
    final result = await _repository.fetchFeeds(
      keyword: keyword == null || keyword.isEmpty ? null : keyword,
    );
    lastSearchKeyword = keyword;
    final feeds = result.docs.map((doc) {
      return FeedModel.fromJson(
        doc.data(),
      );
    });
    return feeds.toList();
  }

  Future<void> refetch() async {
    final feed = await _fetchFeeds();
    state = AsyncValue.data(feed);
  }

  fetchNextPage() async {
    final nextPage = await _fetchFeeds(lastItemCreatedAt: _list.last.createdAt);
    state = AsyncValue.data([..._list, ...nextPage]);
  }

  searchFeedByThread(BuildContext context, String? keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _searchFeeds(keyword),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    }
  }

  @override
  FutureOr<List<FeedModel>> build() async {
    _repository = ref.read(feedRepository);
    _list = await _fetchFeeds(lastItemCreatedAt: null);
    return _list;
  }
}

final feedProvider = AsyncNotifierProvider<FeedViewModel, List<FeedModel>>(
  () => FeedViewModel(),
);

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d2/features/feeds/models/feed_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadImageFile(File image, String feedId, int index, String uid) {
    final fileRef = _storage.ref().child(
          '/image/$uid/${feedId}_$index',
        );
    return fileRef.putFile(image);
  }

  Future<void> saveFeed(FeedModel data) async {
    await _db.collection("feeds").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchFeeds({
    int? lastItemCreatedAt,
  }) {
    final query = _db
        .collection("feeds")
        .orderBy("createdAt", descending: true)
        .limit(10);
    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }
}

final feedRepository = Provider((ref) => FeedRepository());

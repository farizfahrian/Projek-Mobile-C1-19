import 'package:cloud_firestore/cloud_firestore.dart';

import 'database.dart';

class FavoriteSong {
  final Song song;

  FavoriteSong({required this.song});
}

final CollectionReference _users =
    FirebaseFirestore.instance.collection('users');

Set<Song> favoriteSong = {};

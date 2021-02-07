import 'package:flutter/material.dart';

class User {
  const User({
    @required this.id,
    @required this.name,
    @required this.avatar,
    @required this.subscribe,
  })  : assert(id != null),
        assert(name != null),
        assert(avatar != null),
        assert(subscribe != null);

  final int id;
  final String name;
  final String avatar;
  final String subscribe;
}

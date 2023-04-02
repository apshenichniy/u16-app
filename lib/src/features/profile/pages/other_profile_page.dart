import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:u16/src/features/profile/widgets/profile_view.dart';

@RoutePage()
class OtherProfilePage extends StatelessWidget {
  const OtherProfilePage({required this.userId, super.key});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ProfileView(userId: userId);
  }
}

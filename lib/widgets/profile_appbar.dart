import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.view_headline_rounded),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Center(
        child: Column(
          children: [
            Text(
              "Welcome back, Carlos",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Galle, Sri lanka",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_active_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

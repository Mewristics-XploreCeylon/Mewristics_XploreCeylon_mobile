import 'package:flutter/material.dart';
import 'package:xploreceylon_mobile/constants/colors.dart';
// import 'package:xploreceylon_mobile/widgets/profile_appbar.dart';

import '../../constants/sizes.dart';
import '../../widgets/page_header.dart';
// import 'profile_tabs/notifications.dart';
// import 'profile_tabs/visa_status.dart';
// import 'profile_tabs/wallet.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ProfileAppbar(),
      body: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m24, vertical: AppMargin.m24),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: "Profile",
            ),
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/id/1348728804/photo/young-hiker-man-taking-selfie-portrait-on-the-top-of-mountain-happy-guy-smiling-at-camera.jpg?s=612x612&w=0&k=20&c=oq10Nnu9UF5Zr1yAcUifyhsG7BW4MDU3H2S6lxS3cPc="),
            ),
            const SizedBox(
              height: 40,
            ),
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryTextColor,
              indicatorColor: AppColors.primaryColor,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  text: "Visa Status",
                ),
                Tab(text: "Notifications"),
                Tab(text: "Wallet"),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    // VisaStatusTab(),
                    // NotificationsTab(),
                    // WalletTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





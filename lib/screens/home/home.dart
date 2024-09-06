import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_router.dart/routes.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/horizontal_scrollabale_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: Center(
          child: Column(
            children: [
              Text("Welcome back, Sainze",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              Text("Galle, Sri Lanka",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_important_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
              color: AppColors.primaryColor,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 50, bottom: 30, right: 25, left: 25),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Sainze!",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Welcome back to ExploreCeylon",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/propic.jpg"),
                      radius: 30,
                    ),
                  ],
                ),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppMargin.m24, vertical: AppMargin.m24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryFeildColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.fieldTextColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search",
                                style: Theme.of(context).textTheme.displaySmall,
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/polonnaruwa.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .pushNamed(Routes.visaOnboarding);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: AppColors.primaryColor,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Apply for Visa",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Your preferences",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Spacer(),
                        Text(
                          "View more ..",
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 250,
                      child: HorizontalScrollableList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

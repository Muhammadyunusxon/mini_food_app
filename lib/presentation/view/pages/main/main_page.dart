import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:provider/provider.dart';
import 'package:mini_food_app/application/auth_provider.dart';
import 'package:mini_food_app/application/main_provider.dart';
import 'package:mini_food_app/infastructura/servises/local_store.dart';
import 'package:mini_food_app/presentation/components/custom_button.dart';
import 'package:mini_food_app/presentation/route.dart';
import 'package:mini_food_app/presentation/view/pages/home/home_page.dart';
import 'package:mini_food_app/presentation/view/pages/notification/notification_page.dart';
import 'package:mini_food_app/presentation/view/pages/profile/profile_page.dart';
import 'package:mini_food_app/presentation/view/pages/search/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  notificationPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((event) {
      debugPrint("FirebaseMessaging.onMessage");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("FirebaseMessaging.onMessageOpenedApp");
    });
  }

  @override
  void initState() {
    notificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainProvider>(builder: (context, state, __) {
        return ProsteIndexedStack(
          index: state.currentIndex,
          children: [
            IndexedStackChild(child: HomePage()),
            IndexedStackChild(child: SearchPage()),
            IndexedStackChild(child: NotificationPage()),
            IndexedStackChild(child: ProfilePage()),
          ],
        );
      }),
      bottomNavigationBar:
          Consumer<MainProvider>(builder: (context, state, __) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (index) {
            context.read<MainProvider>().changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        );
      }),
    );
  }
}

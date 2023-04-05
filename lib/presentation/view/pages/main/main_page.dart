import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/auth_provider.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';
import 'package:setup_provider/presentation/components/custom_button.dart';
import 'package:setup_provider/presentation/route.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<AuthProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "Main Page",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            CustomButton(
                onTap: () {
                  event.logOut(onSuccess: () {
                    AppRoute.goLogin(context);
                  });
                },
                title: "Log out"),
            CustomButton(
                onTap: () {
                  AppRoute.goChat(context);
                },
                title: "Chat")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/auth_provider.dart';
import 'package:setup_provider/presentation/components/custom_button.dart';
import 'package:setup_provider/presentation/components/custom_text_form_field.dart';
import 'package:setup_provider/presentation/route.dart';
import 'package:setup_provider/presentation/view/pages/main/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<AuthProvider>();
    final state = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Login Page",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextFormField(
              label: "Login",
            ),
            CustomButton(
              onTap: () {
                event.login(onSuccess:()=> AppRoute.goMain(context));
              },
              title: "Login",
              isLoading: state.isLoading,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_food_app/application/auth_provider.dart';
import 'package:mini_food_app/infastructura/servises/app_validators.dart';
import 'package:mini_food_app/presentation/components/custom_button.dart';
import 'package:mini_food_app/presentation/components/custom_text_form_field.dart';
import 'package:mini_food_app/presentation/route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            Form(
              key: formKey,
              child: CustomTextFormField(
                validator: (s) {
                  if (AppValidators.isValidEmail(s ?? "")) {
                    return null;
                  } else {
                    return "Email Xatto";
                  }
                },
                label: "Login",
              ),
            ),
            CustomButton(
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  event.login(
                      context: context,
                      onSuccess: () => AppRoute.goMain(context));
                }
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

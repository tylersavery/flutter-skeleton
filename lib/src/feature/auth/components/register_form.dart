import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/auth/providers/register_form_provider.dart';

class RegisterForm extends BaseComponent {
  RegisterForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _registerFormProvider = ref.read(registerFormProvider.notifier);
    final _registerFormModel = ref.watch(registerFormProvider);

    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
                controller: _registerFormProvider.emailController,
                validator: _registerFormProvider.emailValidator,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Username"),
                ),
                controller: _registerFormProvider.usernameController,
                validator: _registerFormProvider.usernameValidator,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
                controller: _registerFormProvider.passwordController,
                validator: _registerFormProvider.passwordValidator,
                obscureText: true,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed:
                        _registerFormModel.status == RegisterFormStatus.Empty
                            ? null
                            : () {
                                _registerFormProvider.clear();
                              },
                    child: const Text("Clear"),
                  ),
                  ElevatedButton(
                    onPressed: _registerFormModel.status ==
                            RegisterFormStatus.Processing
                        ? null
                        : () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _registerFormProvider.submit();
                          },
                    child: const Text("Register"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

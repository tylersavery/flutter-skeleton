import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/shared_enums.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/core/components/buttons.dart';
import 'package:flutter_skeleton/src/feature/auth/providers/two_factor_confirmation_form_provider.dart';

class TwoFactorConfirmation extends BaseComponent {
  TwoFactorConfirmation({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _formProvider = ref.read(twoFactorConfirmationFormProvider.notifier);
    final _formModel = ref.watch(twoFactorConfirmationFormProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Confirmation Code"),
                      ),
                      keyboardType: TextInputType.phone,
                      controller: _formProvider.codeController,
                      validator: _formProvider.codeValidator),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // TextButton(
                      //   onPressed: _formProvider.resendCode,
                      //   child: const Text("Resend Code"),
                      // ),
                      AppButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formProvider.submit();
                          },
                          label: "Confirm",
                          processing:
                              _formModel.status == FormStatus.Processing),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

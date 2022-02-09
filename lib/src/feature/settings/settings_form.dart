import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/generated/l10n.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/core/components/buttons.dart';
import 'package:flutter_skeleton/src/feature/locale/locale_provider.dart';
import 'package:flutter_skeleton/src/feature/settings/settings_form_provider.dart';
import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

class SettingsForm extends BaseComponent {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _form = ref.read(settingsForm.notifier);
    final _formModel = ref.watch(settingsForm);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _ListItem(
                  icon: Icons.color_lens,
                  title: "Theme",
                  content: DropdownButton<ThemeMode>(
                    value: _formModel.theme,
                    onChanged: (value) {
                      switch (value) {
                        case ThemeMode.dark:
                          _form.setDark();
                          break;
                        case ThemeMode.light:
                          _form.setLight();
                          break;
                        case ThemeMode.system:
                          _form.setSystem();
                          break;
                        default:
                          break;
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('System Theme'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Light Theme'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Dark Theme'),
                      )
                    ],
                  ),
                ),
                _ListItem(
                  icon: Icons.language,
                  title: S.of(context).language,
                  content: DropdownButton<Locale>(
                    value: _formModel.locale,
                    onChanged: (value) {
                      _form.setLocale(value!);
                    },
                    items: _form.supportedLocales
                        .map(
                          (locale) => DropdownMenuItem(
                            child: Text(LocaleProvider.localeToLabel(locale)),
                            value: locale,
                          ),
                        )
                        .toList(),
                  ),
                ),
                if (_formModel.isAuthenticated)
                  _ListItem(
                    icon: Icons.person,
                    title: "Profile",
                    content: OutlinedButton(
                      child: const Text("Edit Profile"),
                      onPressed: _form.editProfile,
                    ),
                  ),
                if (_formModel.user != null)
                  _ListItem(
                    icon: Icons.email,
                    title: _formModel.user!.email ?? "-",
                    subtitle: "Email Address",
                    content: OutlinedButton(
                      child: const Text("Change Email"),
                      onPressed: _form.changeEmail,
                    ),
                  ),
                if (_formModel.user != null)
                  _ListItem(
                    icon: Icons.phone,
                    title: _formModel.user!.phoneNumber.isEmpty
                        ? "-"
                        : _formModel.user!.phoneNumber,
                    subtitle: "Phone Number",
                    content: OutlinedButton(
                      child: Text(_formModel.user!.phoneNumber.isEmpty
                          ? "Add Phone Number"
                          : "Change Phone Number"),
                      onPressed: () {
                        _form.changePhoneNumber(
                            _formModel.user!.phoneNumber.isNotEmpty);
                      },
                    ),
                  ),
                if (_formModel.isAuthenticated)
                  _ListItem(
                    icon: Icons.lock,
                    title: "******",
                    subtitle: "Password",
                    content: OutlinedButton(
                      child: const Text("Change Password"),
                      onPressed: _form.changePassword,
                    ),
                  ),
                const Divider(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_formModel.isAuthenticated)
                          AppButton(
                            variant: AppColorVariant.Danger,
                            onPressed: _form.logout,
                            label: "Logout",
                            icon: Icons.logout,
                          ),
                        if (!_formModel.isAuthenticated)
                          AppButton(
                            onPressed: _form.handleLogin,
                            label: "Login",
                            icon: Icons.login,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget content;

  const _ListItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: content,
    );
  }
}

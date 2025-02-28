// ignore_for_file: directives_ordering
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization/locale_provider.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  LanguageButtonState createState() => LanguageButtonState();
}

class LanguageButtonState extends State<LanguageButton> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    await localeProvider.setLocale(Locale(language));
  }

  PopupMenuEntry<String> _buildLanguageMenuItem(String langCode, String label) {
    return PopupMenuItem<String>(
      value: langCode,
      child: Row(
        children: [
          Image.asset('assets/flags/$langCode.png', width: 24, height: 24),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.language, color: Theme.of(context).colorScheme.primary),
      onSelected: (String language) {
        _saveLanguage(language);
      },
      itemBuilder: (BuildContext context) {
        return [
          _buildLanguageMenuItem('vi', 'Tiếng Việt'),
          _buildLanguageMenuItem('en', 'English'),
          _buildLanguageMenuItem('zh', '中文'),
          _buildLanguageMenuItem('th', 'ภาษาไทย'),
          // Thêm các ngôn ngữ khác nếu cần
        ];
      },
    );
  }
}

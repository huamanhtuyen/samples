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
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'en';
    });
  }

  Future<void> _saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    setState(() {
      _selectedLanguage = language;
    });
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    await localeProvider.setLocale(Locale(language));
    // Logic để load lại resource ngôn ngữ
    switch (_selectedLanguage) {
      case 'en':
        // Load resource tiếng Anh
        break;
      case 'vi':
        // Load resource tiếng Việt
        break;
      case 'th':
        // Load resource tiếng Việt
        break;
      case 'zh':
        // Load resource tiếng Việt
        break;
      // Thêm các ngôn ngữ khác nếu cần
    }
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
          PopupMenuItem(value: 'en', child: Text('English')),
          PopupMenuItem(value: 'vi', child: Text('Tiếng Việt')),
          PopupMenuItem(value: 'zh', child: Text('中文')),
          PopupMenuItem(value: 'th', child: Text('ภาษาไทย')),
          // Thêm các ngôn ngữ khác nếu cần
        ];
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization/locale_provider.dart';

class LanguageButtonNgang extends StatefulWidget {
  const LanguageButtonNgang({super.key});

  @override
  LanguageButtonNgangState createState() => LanguageButtonNgangState();
}

class LanguageButtonNgangState extends State<LanguageButtonNgang> {
  String _selectedLanguage = 'vi';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'vi';
    });
  }

  Future<void> _saveLanguage(String language) async {
    setState(() {
      _selectedLanguage = language;
    });
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    await localeProvider.setLocale(Locale(language));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        _buildLanguageButton('en', 'English', 'assets/flags/en.png'),
        _buildLanguageButton('vi', 'Tiếng Việt', 'assets/flags/vi.png'),
        _buildLanguageButton('zh', '中文', 'assets/flags/zh.png'),
        _buildLanguageButton('th', 'ภาษาไทย', 'assets/flags/th.png'),
      ],
    );
  }

  Widget _buildLanguageButton(
    String languageCode,
    String languageName,
    String flagAsset,
  ) {
    final isSelected = _selectedLanguage == languageCode;
    final selectedColor = Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: () => _saveLanguage(languageCode),
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: isSelected ? selectedColor : Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(flagAsset, width: 20, height: 20),
              SizedBox(width: 4.0),
              Text(
                languageName,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

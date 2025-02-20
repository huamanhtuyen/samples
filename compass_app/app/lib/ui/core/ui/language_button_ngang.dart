import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//các nút ngôn ngữ dàn theo chiều ngang
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    setState(() {
      _selectedLanguage = language;
    });
    // Logic để load lại resource ngôn ngữ
    switch (_selectedLanguage) {
      case 'en':
        // Load resource tiếng Anh
        break;
      case 'vi':
        // Load resource tiếng Việt
        break;
      case 'zh':
        // Load resource tiếng Trung Quốc
        break;
      case 'th':
        // Load resource tiếng Thái
        break;
      // Thêm các ngôn ngữ khác nếu cần
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0, // Khoảng cách ngang giữa các nút
      runSpacing: 4.0, // Khoảng cách dọc giữa các hàng
      children: [
        _buildLanguageButton('en', 'English', 'assets/flags/en.png'),
        _buildLanguageButton('vi', 'Tiếng Việt', 'assets/flags/vi.png'),
        _buildLanguageButton('zh', '中文', 'assets/flags/zh.png'),
        _buildLanguageButton('th', 'ภาษาไทย', 'assets/flags/th.png'),
        // Thêm các ngôn ngữ khác nếu cần
      ],
    );
  }

  Widget _buildLanguageButton(
    String languageCode,
    String languageName,
    String flagAsset,
  ) {
    final isSelected = _selectedLanguage == languageCode;
    return GestureDetector(
      onTap: () => _saveLanguage(languageCode),
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0), // Giảm khoảng cách
          padding: EdgeInsets.all(4.0), // Giảm khoảng cách
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
            children: [
              Image.asset(
                flagAsset,
                width: 20,
                height: 20,
              ), // Giảm kích thước ảnh
              SizedBox(width: 4.0), // Giảm khoảng cách
              Text(
                languageName,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                ), // Giảm kích thước chữ
              ),
            ],
          ),
        ),
      ),
    );
  }
}

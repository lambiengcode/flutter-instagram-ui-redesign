import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/services/others/language_service.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

enum Language { english, vietnamese }

class ChooseLanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  Language _language = Language.english;

  @override
  void initState() {
    super.initState();
    switch (Get.locale.countryCode) {
      case 'US':
        _language = Language.english;
        break;
      default:
        _language = Language.vietnamese;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            size: 20.sp,
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Languages',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontFamily: FontFamily.lato,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.sp),
            _buildSelectionLanguage(context, 'English', Language.english),
            _buildSelectionLanguage(context, 'Vietnamese', Language.vietnamese),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionLanguage(context, title, Language value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp, left: 6.sp),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Radio<Language>(
              activeColor: colorPrimary,
              value: value,
              groupValue: _language,
              onChanged: (Language value) {
                setState(() {
                  _language = value;
                });
                LanguageService().changeLanguage(value);
              },
            ),
          ),
          SizedBox(width: 8.sp),
          Padding(
            padding: EdgeInsets.only(top: 1.25.sp),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

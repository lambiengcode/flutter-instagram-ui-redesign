import 'package:firexcode/firexcode.dart';
import 'package:whoru/src/helpers/editor_pro/data/data.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class Emojies extends StatefulWidget {
  @override
  _EmojiesState createState() => _EmojiesState();
}

class _EmojiesState extends State<Emojies> {
  List emojes = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    return xColumn.list([
      xRowCC.list([
        'Select Emoji'.text(
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.w600,
          ),
        )
      ]).xap(value: 20),
      Divider(
        height: 1,
      ),
      10.0.sizedHeight(),
      GridView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 0.0,
                maxCrossAxisExtent: 35.sp,
              ),
              children: emojis.map((String emoji) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, {
                      'name': emoji,
                      'color': Colors.white,
                      'size': 12.sp,
                      'align': TextAlign.center
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      emoji,
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                );
              }).toList())
          .xContainer(
        height: 315,
        padding: EdgeInsets.all(0.0),
      )
    ]).xContainer(
      padding: EdgeInsets.all(0.0),
      height: 400,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  List<String> emojis = [];
  @override
  void initState() {
    super.initState();
    emojis = getSmileys();
  }
}

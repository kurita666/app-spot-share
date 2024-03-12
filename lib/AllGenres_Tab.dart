import 'package:flutter/material.dart';
import 'map_screen.dart';

class AllGenres extends StatelessWidget {
  final bool isButtonPressed;
  final VoidCallback? onPressed;
  final IconDataModel iconData; // iconDataを受け取るフィールドを追加

  const AllGenres({
    required this.isButtonPressed,
    required this.iconData, // コンストラクタでiconDataを受け取る
    this.onPressed, // onPressedをオプションにする
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                '${iconData.BicycleTypeImage}',
                width: 75,
                height: 75,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Icon(
                    Icons.battery_charging_full,
                    size: 16,
                    color: Colors.black,
                  ),
                  Text(
                    '  ${iconData.HalfHourMoney}/30分まで\n  (+${iconData.QuarterHourMoney}/15分)\n  ${iconData.HalfDayMoney}/12時間',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 9.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 35),
                      Icon(
                        Icons.qr_code_2,
                        size: 14,
                        color: Colors.black,
                      ),
                      Text(
                        ' ${iconData.QRNumber}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 45),
                      Container(
                        width: 45,
                        height: 17,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isButtonPressed ? '解除' : '選択',
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 9.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return isButtonPressed ? Colors.orange : Colors.white;
                              }
                              return isButtonPressed ? Colors.white : Colors.orange;
                            }),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                                side: isButtonPressed
                                    ? BorderSide(color: Colors.grey)
                                    : BorderSide.none,
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                  color: isButtonPressed ? Colors.orange : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
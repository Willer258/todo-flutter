// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.press,
    this.loading = false,
    this.type = 'primary',
    this.textColor = 'white',
    this.icons,
    this.color = 'non-defini',
  });

  final String title;
  final Function()? press;
  final String type;
  final String textColor;
  final String color;
  final icons;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color(0xFFFF7C00);
    const kSecondaryColor = Color(0xFFFFE265);
    const double kDefaultPadding = 20.0;
    const kTextColor = Color(0xFF3C4046);
    const kBackgroundColor = Color.fromARGB(255, 255, 255, 255);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: type == 'primary'
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: press,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icons != null
                      ? Container(
                          child: Icon(
                            icons,
                            color: textColor == 'white'
                                ? Colors.white
                                : Colors.black,
                          ),
                          margin: EdgeInsets.only(right: kDefaultPadding),
                        )
                      : const Text(''),
                  loading
                      ? Row(
                          children: const [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        )
                      : Container(),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textColor == 'white' ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ))
          : type == 'secondary'
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: press,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons != null
                          ? Container(
                              child: Icon(
                                icons,
                                color: textColor == 'white'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              margin: EdgeInsets.only(right: kDefaultPadding),
                            )
                          : const Text(''),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: textColor == 'white'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ))
              : type == 'text'
                  ? TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: press,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icons != null
                              ? Container(
                                  child: Icon(
                                    icons,
                                    color: textColor == 'white'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  margin:
                                      EdgeInsets.only(right: kDefaultPadding),
                                )
                              : const Text(''),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textColor == 'white'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ))
                  : type == 'ghost'
                      ? TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: kSecondaryColor.withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: press,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              icons != null
                                  ? Container(
                                      child: Icon(
                                        icons,
                                        color: textColor == 'white'
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      // ignore: prefer_const_constructors
                                      margin: EdgeInsets.only(
                                          right: kDefaultPadding),
                                    )
                                  : const Text(''),
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: textColor == 'white'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ))
                      : const Text(''),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.press, required this.url});

  final Function() press;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.h,
      height: 70.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150), color: Colors.white),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500))),
          onPressed: press,
          child: Image.asset(url)),
    );
  }
}

enum ColorEnumEven {
  Red,
  Green,
  Blue,
  Yellow,
}

enum ColorEnumOdd {
  Purple,
  Pink,
  Orange,
}

class HighIconButton extends StatelessWidget {
  const HighIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Function() press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.spMin,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70.h,
              height: 70.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(500)),
              child: Icon(
                icon,
                color: Colors.black87,
                size: 35.spMin,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: press,
      ),
    );
  }
}

class RecentContactButton extends StatefulWidget {
  const RecentContactButton({
    super.key,
    required this.title,
    required this.image,
    required this.press,
    required this.color,
    required this.ammount,
    required this.indexButton,
    required this.status,
    required this.isMarginLeft,
  });

  final String title;
  final String image;
  final int indexButton;
  final Function() press;
  final Color color;
  final String ammount;
  final String? status;
  final bool isMarginLeft;

  @override
  State<RecentContactButton> createState() => _RecentContactButtonState();
}

class _RecentContactButtonState extends State<RecentContactButton> {
  ColorEnumEven _colorEnumEven = ColorEnumEven.Red;
  ColorEnumOdd _colorEnumOdd = ColorEnumOdd.Purple;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      final random = Random();
      _colorEnumEven =
          ColorEnumEven.values[random.nextInt(ColorEnumEven.values.length)];
      _colorEnumOdd =
          ColorEnumOdd.values[random.nextInt(ColorEnumOdd.values.length)];
    });
  }

  Color _getColorFromEnumEven(ColorEnumEven colorEnum) {
    switch (colorEnum) {
      case ColorEnumEven.Red:
        return Colors.red.shade100;
      case ColorEnumEven.Green:
        return Colors.green.shade100;
      case ColorEnumEven.Blue:
        return Colors.blue.shade100;
      default:
        return Colors.yellow.shade100;
    }
  }

  Color _getColorFromEnumOdd(ColorEnumOdd colorEnum) {
    switch (colorEnum) {
      case ColorEnumOdd.Purple:
        return Colors.purple.shade100;
      case ColorEnumOdd.Pink:
        return Colors.pink.shade100;
      case ColorEnumOdd.Orange:
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.spMin,
      width: 140.spMin,
      decoration: BoxDecoration(
          color: widget.indexButton.isEven
              ? _getColorFromEnumEven(_colorEnumEven)
              : _getColorFromEnumOdd(_colorEnumOdd),
          borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        child: Container(
          padding: EdgeInsets.all(5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: widget.indexButton.isEven
                      ? _getColorFromEnumEven(_colorEnumEven)
                      : _getColorFromEnumOdd(_colorEnumOdd),
                ),
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                widget.title,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: Text(
                        ' ' + widget.ammount,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                  child: Chip(
                      backgroundColor: widget.status == 'SUCCESS'
                          ? Colors.greenAccent
                          : widget.status == 'FAILED'
                              ? Colors.redAccent
                              : widget.status == 'PENDING'
                                  ? Colors.grey
                                  : Colors.transparent,
                      label: Text(
                        widget.status!.toLowerCase(),
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: widget.status == 'PENDING'
                                ? Colors.white
                                : Colors.black),
                      )),
                  // width: 60.h,
                ),
              )
            ],
          ),
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: widget.press,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.contentTeft,
    required this.press,
    this.arrow = false,
    this.type = 'text',
  });

  final String text;
  final Widget contentTeft;
  final Function() press;
  final bool arrow;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(width: 1, color: Color.fromARGB(57, 158, 158, 158))),
      child: TextButton(
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              contentTeft,
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: type == 'primary' ? Colors.white : Colors.black,
                      fontSize: 14.sp),
                ),
              ),
              arrow
                  ? Icon(
                      Icons.arrow_right,
                      color: Color.fromARGB(115, 158, 158, 158),
                    )
                  : Text('')
            ],
          )),
    );
  }
}

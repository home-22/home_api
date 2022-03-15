import 'package:flutter/material.dart';
import 'package:home_api/widgets/app_text.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  bool? isButton;
  double? width;
  Button({Key? key, this.width = 50, this.isButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isButton == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[900],
        ),
        child: Row(
          mainAxisAlignment: isButton == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isButton == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: 'Book Trip Now',
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Image.asset('img/right-arrow.png'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color buttonColor;
  final Color textColor;
  const PrimaryButton({super.key, required this.text,this.onTap,required this.buttonColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: buttonColor,
                borderRadius: BorderRadius.circular(30),
                onPressed: onTap,
                child: Text(
                  text,
                  style: TextStyle(
                    color:textColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

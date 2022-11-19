import 'package:flutter/material.dart';

class PillButton extends StatefulWidget {
  const PillButton({
    super.key,
    required this.text,
    required this.textSize,
    required this.onPressedFunction,
    this.color = Colors.white,
    this.backgroundColor = Colors.deepPurple,
    this.borderColor = Colors.deepPurple,
    this.width,
    this.height,
  });

  final String text;
  final double textSize;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final Function onPressedFunction;
  final double? width;
  final double? height;

  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width * .5,
      height: widget.height ?? MediaQuery.of(context).size.height * .075,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressedFunction();
        },
        style: ButtonStyle(
          maximumSize: const MaterialStatePropertyAll<Size>(Size(300, 75)),
          minimumSize: const MaterialStatePropertyAll<Size>(Size(150, 50)),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: widget.borderColor,
              width: MediaQuery.of(context).size.width * .005,
            ),
          ),
          backgroundColor:
              MaterialStatePropertyAll<Color>(widget.backgroundColor),
          shape: const MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1000),
              ),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: widget.textSize.toDouble()),
        ),
      ),
    );
  }
}

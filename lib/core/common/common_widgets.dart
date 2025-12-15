import 'package:flutter/material.dart';

class CommonAppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign align;

  const CommonAppText({
    super.key,
    required this.text,
    this.size = 14,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    this.align = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}


class CommonAppIconTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final Color iconColor;
  final Color labelColor;

  const CommonAppIconTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.iconColor = Colors.black,
    this.labelColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: labelColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

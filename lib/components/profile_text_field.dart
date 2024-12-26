import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const ProfileTextField(
      {super.key,
        required this.title,
        required this.value,
        required this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      const SizedBox(
        width: 15,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      )
    ]);
  }
}
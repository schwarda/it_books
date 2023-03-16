import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ContainerTextField extends StatelessWidget {
  String hintText;
  Function func;
  ContainerTextField({super.key, required this.hintText, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.primaryColor, // 194, 215, 242
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 22,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 14.5),
        ),
        onSubmitted: (value) => func(value),
      ),
    );
  }
}

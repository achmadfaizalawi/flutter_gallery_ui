import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 30,
          child: IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: Colors.red))),
    );
  }
}
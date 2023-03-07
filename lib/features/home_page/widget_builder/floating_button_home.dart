import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 30,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_a_photo_outlined,
                color: Colors.black, size: 30)),
      ),
    );
  }
}
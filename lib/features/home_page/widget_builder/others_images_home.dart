import 'package:flutter/material.dart';
import 'package:flutter_galley_app/features/others_images_page/ui/others_images_page.dart';

class OthersImagesWidget extends StatelessWidget {
  const OthersImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const OthersImages()));
            },
            child: const Text(
              "Others Images",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            )));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_galley_app/features/preview_images_page/widget_builder/floating_button_preview.dart';

class PreviewImages extends StatelessWidget {
  final String urlImages;

  const PreviewImages({Key? key, required this.urlImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appbarMethod(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    createShowDialog(context);
                  },
                  child: showPreviewImages(),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Lorem Ipsum",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            descriptionMethod()
          ],
        ),
        floatingActionButton: const FloatingButton(),
      ),
    );
  }

  Container descriptionMethod() {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Image showPreviewImages() {
    return Image.network(
      urlImages,
      fit: BoxFit.cover,
      loadingBuilder: (context, widget, event) {
        if (event == null) {
          return widget;
        } else {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 1,
            width: 1,
            child: const CircularProgressIndicator(),
          );
        }
      },
      errorBuilder: (context, object, error) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
              child: Icon(
            Icons.error,
            size: 40,
            color: Colors.black,
          )),
        );
      },
    );
  }

  AppBar appbarMethod(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "Preview Images",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
    );
  }

  Future<dynamic> createShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          contentPadding: const EdgeInsets.all(18),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(urlImages, fit: BoxFit.cover),
          ),
          actions: [
            OutlinedButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide.none)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"))
          ],
        );
      },
    );
  }
}
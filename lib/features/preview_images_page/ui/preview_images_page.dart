import 'package:flutter/material.dart';

class PreviewImages extends StatelessWidget {
  final String urlImages;

  const PreviewImages({Key? key, required this.urlImages}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Preview Images",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            icon: const Icon(
              Icons.arrow_back_ios_new, 
              color: Colors.black
            )
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  urlImages,
                fit: BoxFit.cover,
                loadingBuilder: (context, widget, event) {
                        if(event == null){
                          return widget;
                        } else{
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
                          decoration: const BoxDecoration(
                            color: Colors.white
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.error,
                              size: 40,
                              color: Colors.black,
                            )
                          ),
                        );
                      },
                ),
              ),
            ),
            const SizedBox(
              height: 5
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Lorem Ipsum",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              )),),
            Container(
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
                style: TextStyle(
                  fontSize: 16
                ),),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 30,
            child: IconButton(
              iconSize: 30,
              onPressed: (){
              }, 
              icon: 
              const Icon(
                Icons.favorite_border,
                color: Colors.red
              )
            )
          ),
        ),
      ),
    );
  }
}
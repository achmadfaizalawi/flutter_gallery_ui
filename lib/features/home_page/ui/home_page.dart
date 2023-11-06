import 'package:flutter/material.dart';
import 'package:flutter_galley_app/features/others_images_page/ui/others_images_page.dart';
import 'package:flutter_galley_app/features/preview_images_page/ui/preview_images_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: (){}, 
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
          color: Colors.black,
          onPressed: (){}, 
          icon: const Icon(Icons.person),
        ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: const Text(
                "Hello, Chickie",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),),
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: const Text(
                "Find Your Favorite Images",
                style: TextStyle(
                  fontSize: 20,
                ),),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20))
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    hintText: "Search Images",
                    hintStyle: TextStyle(
                      color: Colors.grey[700]
                    ),
                    prefixIcon: const Icon(
                      Icons.search, 
                      size: 25, 
                      color: Colors.black)
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Best Images",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),),
                ],
              ),
            ),
            const SizedBox(
              height: 5),
            GridView.builder(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 4),
              itemCount: 9,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ), 
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => PreviewImages(
                        urlImages: "https://picsum.photos/id/$index/300/300",
                      )
                      )
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.grey.withOpacity(0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://picsum.photos/id/$index/300/300",
                      fit: BoxFit.cover,
                      height: 140,
                      width: 150,
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
                              size: 30,
                              color: Colors.black,
                            )
                          ),
                          );
                      },
                      ),
                  ),
                );
              },),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const OthersImages())
                );
                },
                child: const Text(
                  "Others Images",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                )
              )
            )
          ],),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 30,
          child: IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.black,
              size: 30)),
        ),
      ),
    );
  }
}
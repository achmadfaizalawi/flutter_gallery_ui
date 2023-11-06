import 'package:flutter/material.dart';
import 'package:flutter_galley_app/features/preview_images_page/ui/preview_images_page.dart';

class OthersImages extends StatelessWidget {
  const OthersImages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Others Images",
            style: TextStyle(
              color: Colors.black,
            ),),
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
          children: <Widget>[
            Container(
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20)
                )
              ),
              child: Container(
                margin: const EdgeInsets.all(20),
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
              height: 10
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 4),
                itemCount: 100,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20), 
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
            ),
          ],
        ), 
      ),
    );
  }
}
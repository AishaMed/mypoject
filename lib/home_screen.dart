import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _blogscreenState();
}

class _blogscreenState extends State<HomeScreen> {
  List _blogs = [];
  bool isloading = true;

  _productItem(_blogs) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
          leading: const Icon(Icons.photo_rounded, size: 40,),
          title: Text("${_blogs['title'].toString()}",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
            subtitle: Text("${_blogs['auther'].toString()}"),
          ),
    );
  }

  Future<void> getProductFromFirebase() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection("Blogs").get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();
        print("****************************************************");
        print(data);
        _blogs.add(data);
      }
      setState(() {
        isloading = false;
      });
    } catch (error) {
      print('Error fetching hotels: $error');
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    getProductFromFirebase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              widthFactor: 200,
              child: ListView.builder(
                padding: EdgeInsets.all(28.0),
                itemCount: _blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return _productItem(_blogs[index]);
                },
              ),
            ),
    );
  }
}

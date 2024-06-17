import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class AddingClothing extends StatefulWidget{
  AddingClothing({Key ? key}) : super(key: key);
  @override
  State<AddingClothing> createState() => _AddingClothingState();
}

class _AddingClothingState extends State<AddingClothing> {

  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;
  File? _photo;
  final ImagePicker _picker=ImagePicker();


  Future imgFromGallery() async{
    final pickedFile= await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile!=null){
        _photo=File(pickedFile.path);
        uploadFile();
      }
      else{
        print('No image selected');
      }
    });
  }

  Future imgFromCam() async{
    final pickedFile= await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if(pickedFile!=null){
        _photo=File(pickedFile.path);
        uploadFile();
      }
      else{
        print('No image selected');
      }
    });
  }

  Future uploadFile() async{
    if(_photo==null) return;
    final fileName= basename(_photo!.path);
    final destination= 'files/$fileName';

    try{
      final ref= firebase_storage.FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(_photo!);
    }
    catch(e){
      print('error occured');
    }
  }


  void showPicker(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget> [
                    new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: (){
                        imgFromGallery();
                        Navigator.of(context).pop();
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: (){
                        imgFromCam();
                        Navigator.of(context).pop();
                      },
                    ),
                    new ListTile(
                      onTap: (){
                        display();
                      },
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  display()async {
    final ref = FirebaseStorage.instance.ref().child('files');
// no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    Image.network(url);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAKEURMODD'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.pink,
                  child: _photo!= null
                    ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _photo!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                )
                      : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.pink,
                  )
              ),
            ),
      ),
            ),
          ],
        ),

      ),
    );
  }



}
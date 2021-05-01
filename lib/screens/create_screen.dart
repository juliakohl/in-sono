import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:in_sono/components/rounded_button.dart';
import 'package:path/path.dart' as Path;

class CreateScreen extends StatefulWidget {
  static const String id = 'create_screen';

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  File _image;
  final picker = ImagePicker();
  
  Future takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadFile(String filePath) async {
    File file = File('${Path.basename(filePath)}}');
    print(filePath+_image.path);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/image.png')
          .putFile(_image);
      print('uploaded file');
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50.0,
            width: double.infinity,
          ),
          Container(
            height: 150.0,
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
          ),
          SizedBox(
            height: 50.0,
            width: double.infinity,
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white,),
            tooltip: 'You can use your camera to scan any text you have in front of you.',
            onPressed: () {
              onPressed: takeImage();
            },
          ),
          Text('Take a photo', style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 48.0,
            width: double.infinity,
          ),
          IconButton(
            icon: const Icon(Icons.file_upload, color: Colors.white,),
            tooltip: 'You can upload a document in xy format as a text source.',
            onPressed: () {
              onPressed: getImage();
            },
          ),
          Text('Upload image from gallery', style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 96.0,
            width: double.infinity,
          ),
          RoundedButton(title: 'Continue to the next step', onPressed: () { uploadFile(_image.path);}),
        ],
      ),
    );
  }
}

/*
class Uploader extends StatefulWidget {
  Uploader({Key key}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {


  @override
  Widget build(BuildContext context) {
    if(_uploadTask != null ) {
      return Icon(Icons.check_circle);
    } else {
      return FlatButton.icon(label: Text('Upload png'), icon: Icon(Icons.cloud_upload), onPressed: _startUpload);
    }
    return Container();
  }
}


class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {

  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.getImage(source:source);

    setState(() {
      _imageFile = selected;
    });
  }

  Future <void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


Center(
        child: Column(
          children: <Widget>[
            Text('Selected Image'),
            _image != null
                ? Image.asset(
              _image.path,
              height: 150,
            )
                : Container(height: 150),
            _image == null
                ? TextButton(
              child: Text('Choose File'),
              onPressed: getImage,
            )
                : Container(),
            _image != null
                ? TextButton(
              child: Text('Upload File'),
              onPressed: takeImage,
            )
                : Container(),
            Text('Uploaded Image'),
            _uploadedFileURL != null
                ? Image.network(
              _uploadedFileURL,
              height: 150,
            )
                : Container(),
          ],
        ),
      ),


*/
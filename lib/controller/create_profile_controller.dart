import 'dart:developer';
import 'dart:io';
import 'package:austism/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserController extends GetxController {
  TextEditingController parentnameController = TextEditingController();
  TextEditingController parentlocController = TextEditingController();
  TextEditingController parentcontactController = TextEditingController();
  TextEditingController parentemailController = TextEditingController();
  TextEditingController locController = TextEditingController();

  TextEditingController childnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController guardianContactController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String? parentimage;
  String? childimage;

  bool isuploading = false;
  final authController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  File? selectedParentImage;
  File? selectedChildImage;

  bool isloading = false;
  setLoading(bool value) {
    isloading = value;
    update();
  }

  // Method to create a new user document with image URL
  Future<String> createUser() async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);
      await _firestore.collection('users').doc(userId).set({
        "name": parentnameController.text,
        "location": locController.text,
        "contactInfo": guardianContactController.text,
        "email": parentemailController.text,
        "image": parentimage,
        "userId": userId,
        "childName": childnameController.text,
        "childdob": dobController.text,
        "childImageUrl": childimage,
        "gender": genderController.text,
      });

      return 'User $userId created successfully.';
    } catch (e) {
      return 'Error creating user: $e';
    } finally {
      setLoading(false);
    }
  }

  // Fetch the user data from Firestore
  Future<void> fetchUserData() async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        parentnameController.text = data["name"] ?? "";
        parentlocController.text = data["location"] ?? "";
        parentcontactController.text = data["contactInfo"] ?? "";
        parentemailController.text = data["email"] ?? "";
        childnameController.text = data["childName"] ?? "";
        dobController.text = data["childdob"] ?? "";
        guardianContactController.text = data["contactInfo"] ?? "";
        genderController.text = data["gender"] ?? "";
        parentimage = data["image"] ?? "";
        childimage = data["childImageUrl"] ?? "";
        update();
      }
    } catch (e) {
      log('Error fetching user data: $e');
    } finally {
      setLoading(false);
    }
  }

  // Method to upload the selected image to Firebase Storage
  // Future uploadImage(
  //     {required File? selectedImage, required String? imageurl}) async {
  //   if (selectedImage != null) {
  //     try {
  //       final imagesRef =
  //           FirebaseStorage.instance.ref('profileImages/${DateTime.now()}.png');
  //       final uploadTask = imagesRef.putFile(selectedImage!);

  //       final taskSnapshot = await uploadTask;

  //       final imageURL = await taskSnapshot.ref.getDownloadURL();
  //       return imageURL;
  //       // imageurl = imageURL;
  //       // update();
  //     } catch (e) {
  //       log('Error uploading image: ${e.toString()}');
  //     }
  //   } else {
  //     log('No image selected');
  //   }
  // }

  Future<String?> uploadImage(
      {required File? selectedImage, String? imageurl}) async {
    if (selectedImage != null) {
      try {
        final imagesRef =
            FirebaseStorage.instance.ref('profileImages/${DateTime.now()}.png');
        final uploadTask = imagesRef.putFile(selectedImage);
        final taskSnapshot = await uploadTask;
        final imageURL = await taskSnapshot.ref.getDownloadURL();
        update();
        return imageURL; // Return the uploaded image URL
      } catch (e) {
        log('Error uploading image: ${e.toString()}');
        return null; // Return null on error
      }
    } else {
      log('No image selected');
      return null; // Return null if no image is selected
    }
  }

  Future<void> pickParentImage({required ImageSource source}) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        log('Image selected at path: ${pickedFile.path}');
        selectedParentImage = File(pickedFile.path);
        update();
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log('Error picking image: ${e.toString()}');
    }
  }

  Future<void> pickChildImage({required ImageSource source}) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        log('Image selected at path: ${pickedFile.path}');
        selectedChildImage = File(pickedFile.path);
        update();
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log('Error picking image: ${e.toString()}');
    }
  }
}

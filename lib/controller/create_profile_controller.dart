import 'dart:developer';
import 'dart:io';
import 'package:austism/components/appBar.dart';
import 'package:austism/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  TextEditingController childLocation = TextEditingController();
  String? parentimage;
  String? childimage;

  bool isuploading = false;
  final authController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  File? selectedParentImage;
  File? selectedChildImage;

  bool isLoading = false;
  setLoading(bool value) {
    isLoading = value;
    update();
  }

  // Method to create a new user document with image URL
  Future<String> createUser() async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);
      await _firestore.collection('users').doc(userId).set({
        "name": parentnameController.text,
        "location": childLocation.text,
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
        childLocation.text = data["location"] ?? "";
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

  // Method to update the child profile in Firestore
  Future updateUser({
    required String name,
    required String location,
    required String contactInfo,
    required String email,
    required String childName,
    required String dob,
    required String guardianContact,
    required String gender,
    String? image,
  }) async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);

      // Upload new parent and child images if selected
      // if (selectedParentImage != null) {
      //   parentimage = await uploadImage(selectedImage: selectedParentImage);
      // }
      if (selectedChildImage != null) {
        childimage = await uploadImage(selectedImage: selectedChildImage);
      } else {}

      // Update user document in Firestore
      await _firestore.collection('users').doc(userId).update({
        // "name": name
        "location": location,
        "contactInfo": contactInfo,
        // "image": ,
        "childName": name,
        "childdob": dob,
        "childImageUrl": selectedChildImage != null ? childimage : image,
        "gender": gender,
      });
      Fluttertoast.showToast(
        msg: 'User updated successfully.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
      Get.close(1);
    } catch (e) {
      return 'Error updating user: $e';
    } finally {
      setLoading(false);
    }
  }
}

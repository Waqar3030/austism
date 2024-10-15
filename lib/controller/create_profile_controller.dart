import 'dart:developer';
import 'dart:io';
import 'package:austism/controller/auth_controller.dart';
import 'package:austism/screens/Auth/profile/add_child.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserController extends GetxController {
  String? image;
  bool isuploading = false;
  final authController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  bool isloading = false;
  setLoading(bool value) {
    isloading = value;
    update();
  }

  File? selectedImage;

  // Method to create a new user document with image URL
  Future<String> createUser(
    String name,
    String location,
    String contactInfo,
    String email,
    String imageUrl,
  ) async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);
      await _firestore.collection('users').doc(userId).set({
        "name": name,
        "location": location,
        "contactInfo": contactInfo,
        "email": email,
        "image": imageUrl,
        "userId": userId
      });

      Get.to(() => const AddChildScreen());
      return 'User $userId created successfully.';
    } catch (e) {
      return 'Error creating user: $e';
    } finally {
      setLoading(false);
    }
  }

  // Method to upload the selected image to Firebase Storage and return the download URL
  Future uploadImage() async {
    if (selectedImage != null) {
      try {
        // String filepath = 'profileImages/${DateTime.now()}.png';
        final imagesRef = FirebaseStorage.instance
            .ref('profileImages/${DateTime.now()}.png'); // images/${id}
        final uploadTask = imagesRef.putFile(selectedImage!);

        final taskSnapshot = await uploadTask;

        final imageURL = await taskSnapshot.ref.getDownloadURL();
        image = imageURL;
        update();
      } catch (e) {
        log('Error uploading image: ${e.toString()}');
      }
    } else {
      log('No image selected');
    }
  }

  // Method to pick and upload an image
  Future<void> pickAndUploadImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        log('Image selected at path: ${pickedFile.path}');
        selectedImage = File(pickedFile.path);
        update();
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log('Error picking image: ${e.toString()}');
    }
  }
}

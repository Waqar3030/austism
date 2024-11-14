import 'dart:developer';

import 'package:austism/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChildController extends GetxController {
  String parentname = "";
  String childloc = "";
  String parentcontact = "";
  String parentemail = "";
  String childname = "";
  String dob = "";
  String guardianContact = "";
  String gender = "";
  String parentimage = "";
  String childimage = "";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isloading = false;
  setLoading(bool value) {
    isloading = value;
    update();
  }

  final authController = Get.put(AuthController());
  Future<void> fetchUserData({String? user}) async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user ?? userId).get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        parentname = data["name"] ?? "";
        childloc = data["location"] ?? "";
        // parentcontact = data["contactInfo"] ?? "";
        parentemail = data["email"] ?? "";
        childname = data["childName"] ?? "";
        dob = data["childdob"] ?? "";
        guardianContact = data["contactInfo"] ?? "";
        gender = data["gender"] ?? "";
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

  Future<void> updateData({
    String? newParentName,
    String? newParentLoc,
    String? newParentContact,
    String? newParentEmail,
    String? newChildName,
    String? newDob,
    String? newGuardianContact,
    String? newGender,
    String? newParentImage,
    String? newChildImage,
  }) async {
    String userId = authController.firebaseUser.value?.uid ?? "";
    try {
      setLoading(true);
      // Prepare the updated data
      Map<String, dynamic> updatedData = {
        if (newParentName != null) "name": newParentName,
        if (newParentLoc != null) "location": newParentLoc,
        if (newParentContact != null) "contactInfo": newParentContact,
        if (newParentEmail != null) "email": newParentEmail,
        if (newChildName != null) "childName": newChildName,
        if (newDob != null) "childdob": newDob,
        if (newGuardianContact != null) "guardianContact": newGuardianContact,
        if (newGender != null) "gender": newGender,
        if (newParentImage != null) "image": newParentImage,
        if (newChildImage != null) "childImageUrl": newChildImage,
      };

      await _firestore.collection('users').doc(userId).update(updatedData);
      // Update local variables with new values
      if (newParentName != null) parentname = newParentName;
      if (newParentLoc != null) childloc = newParentLoc;
      if (newParentContact != null) parentcontact = newParentContact;
      if (newParentEmail != null) parentemail = newParentEmail;
      if (newChildName != null) childname = newChildName;
      if (newDob != null) dob = newDob;
      if (newGuardianContact != null) guardianContact = newGuardianContact;
      if (newGender != null) gender = newGender;
      if (newParentImage != null) parentimage = newParentImage;
      if (newChildImage != null) childimage = newChildImage;
      update();
    } catch (e) {
      log('Error updating user data: $e');
    } finally {
      setLoading(false);
    }
  }
}

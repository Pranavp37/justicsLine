import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart'; // Import the Cloud Firestore package

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({Key? key}) : super(key: key);

  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final List<String> _districts = [
    'Thiruvananthapuram',
    'Kollam',
    'Pathanamthitta',
    'Alappuzha',
    'Kottayam',
    'Idukki',
    'Ernakulam',
    'Thrissur',
    'Palakkad',
    'Malappuram',
    'Kozhikode',
    'Wayanad',
    'Kannur',
    'Kasaragod'
  ];
  String? _selectedDistrict;
  XFile? _educationCertificate;
  XFile? _photo;
  String? _name;
  String? _selfIntro;

  Future<void> _uploadEducationCertificate() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (result != null) {
      setState(() {
        _educationCertificate = result;
      });
    }
  }

  Future<void> _pickPhoto() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );
    _photo = File(result!.path) as XFile?;

    setState(() {
      _photo = result;
    });
  }

  Future<void> _submitProfile() async {
    // Check if all required fields are filled
    if (_name == null ||
        _selfIntro == null ||
        _educationCertificate == null ||
        _selectedDistrict == null ||
        _photo == null) {
      // Show an error message or handle the missing fields
      return;
    }

    try {
      // Upload education certificate to Firebase Storage
      final educationCertificateRef = FirebaseStorage.instance
          .ref()
          .child('education_certificates/${_educationCertificate!.name}');
      await educationCertificateRef.putData(
        await _educationCertificate!.readAsBytes(),
        SettableMetadata(contentType: 'application/pdf'),
      );
      final educationCertificateUrl =
          await educationCertificateRef.getDownloadURL();

      // Upload photo to Firebase Storage
      final photoRef =
          FirebaseStorage.instance.ref().child('photos/${_photo!.name}');
      await photoRef.putData(
        await _photo!.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'),
      );
      final photoUrl = await photoRef.getDownloadURL();

      // Create a map with the data to be stored
      Map<String, dynamic> profileData = {
        'name': _name,
        'selfIntro': _selfIntro,
        'educationCertificateUrl': educationCertificateUrl,
        'district': _selectedDistrict,
        'photoUrl': photoUrl,
      };

      // Add the data to the 'newlawyer' collection in Firestore
      await FirebaseFirestore.instance.collection('newlawyer').add(profileData);
      // Show a success message or perform any additional actions
    } catch (e) {
      // Handle the error
      // ignore: avoid_print
      print('Error adding profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Photo',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: _pickPhoto,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: _photo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            _photo! as File,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.camera_alt,
                          size: 48.0,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Self Introduction',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _selfIntro = value;
                  });
                },
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Introduce yourself',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Education Certificate',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: _uploadEducationCertificate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _educationCertificate != null
                            ? _educationCertificate!.name
                            : 'Upload Education Certificate',
                      ),
                      const Icon(Icons.upload_file),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Location',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDistrict = newValue;
                  });
                },
                items: _districts.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Select District',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitProfile,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

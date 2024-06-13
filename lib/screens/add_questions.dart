// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuestionScreen extends StatefulWidget {
  final String category;

  const AddQuestionScreen({super.key, required this.category});

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  String categoryName = '';

  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _optionAController = TextEditingController();
  final TextEditingController _optionBController = TextEditingController();
  final TextEditingController _optionCController = TextEditingController();
  final TextEditingController _optionDController = TextEditingController();
  final TextEditingController _correctAnsController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();
  final TextEditingController _questionNumberController =
      TextEditingController();

  File? _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    categoryName = getCategoryName(widget.category);
  }

  void _addQuestion() {
    if (_questionController.text.isEmpty ||
        _optionAController.text.isEmpty ||
        _optionBController.text.isEmpty ||
        _correctAnsController.text.isEmpty ||
        _explanationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    // Upload image if available
    if (_imageFile != null) {
      uploadImage().then((imageUrl) {
        _firestore.collection(widget.category).add({
          'Question': _questionController.text,
          'Option A': _optionAController.text,
          'Option B': _optionBController.text,
          'Option C': _optionCController.text,
          'Option D': _optionDController.text,
          'Correct ans': _correctAnsController.text,
          'Explanation': _explanationController.text,
          'Q no': int.tryParse(_questionNumberController.text) ?? 0,
          'Image URL': imageUrl,
        }).then((value) {
          // Clear the text fields after adding the question
          _questionController.clear();
          _optionAController.clear();
          _optionBController.clear();
          _optionCController.clear();
          _optionDController.clear();
          _correctAnsController.clear();
          _explanationController.clear();
          _questionNumberController.clear();
          _imageFile = null; // Clear the selected image
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Question added successfully!')),
          );
          setState(() {
            _imageFile = null; // Clear the image selection from the screen
          });
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add question: $error')),
          );
        });
      });
    } else {
      _firestore.collection(widget.category).add({
        'Question': _questionController.text,
        'Option A': _optionAController.text,
        'Option B': _optionBController.text,
        'Option C': _optionCController.text,
        'Option D': _optionDController.text,
        'Correct ans': _correctAnsController.text,
        'Explanation': _explanationController.text,
        'Q no': int.tryParse(_questionNumberController.text) ?? 0,
      }).then((value) {
        // Clear the text fields after adding the question
        _questionController.clear();
        _optionAController.clear();
        _optionBController.clear();
        _optionCController.clear();
        _optionDController.clear();
        _correctAnsController.clear();
        _explanationController.clear();
        _questionNumberController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Question added successfully!')),
        );
        setState(() {
          _imageFile = null; // Clear the image selection from the screen
        });
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add question: $error')),
        );
      });
    }
  }

  Future<String?> uploadImage() async {
    try {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('question_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
      UploadTask uploadTask = storageRef.putFile(_imageFile!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      // ignore: avoid_print
      print('Error uploading image: $e');
      return null;
    }
  }

  String getCategoryName(String category) {
    switch (category) {
      case '1':
        return 'NLP';
      case '2':
        return 'ML';
      case '3':
        return 'BDA';
      case '4':
        return 'BLOC';
      default:
        return 'Unknown';
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Question'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Add Question to $categoryName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _optionAController,
              decoration: const InputDecoration(
                labelText: 'Option A *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _optionBController,
              decoration: const InputDecoration(
                labelText: 'Option B *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _optionCController,
              decoration: const InputDecoration(
                labelText: 'Option C',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _optionDController,
              decoration: const InputDecoration(
                labelText: 'Option D',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _correctAnsController,
              decoration: const InputDecoration(
                labelText: 'Correct Answer *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _explanationController,
              decoration: const InputDecoration(
                labelText: 'Explanation *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _questionNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Question Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _imageFile == null ? 'No Image Selected' : 'Image Selected',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _imageFile = null;
                    });
                  },
                  icon: const Icon(Icons.clear),
                  tooltip: 'Clear Image',
                ),
                IconButton(
                  onPressed: _getImage,
                  icon: const Icon(Icons.image),
                  tooltip: 'Add Image',
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addQuestion,
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}

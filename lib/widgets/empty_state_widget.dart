import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/add_category_view.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String description;
  final VoidCallback onPressed;

  EmptyStateWidget({
    required this.message,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 60, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 132, 129, 129)), 
          ),
          SizedBox(height: 16),
ElevatedButton.icon(
            onPressed: () {
              Get.to(() => AddCategoryView());
            },
            icon: Icon(Icons.add, color: Colors.white), 
            label: Text(
              'Tambah',
              style: TextStyle(color: Colors.white), 
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF5F3DC4), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), 
              ),
            ),
          )
        ],
      ),
    );
  }
}
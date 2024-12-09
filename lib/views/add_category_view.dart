import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart.dart';

class AddCategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Kategori',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Batal',
            style: TextStyle(
              color: Color(0xFF6200EE),
              fontSize: 13,
            ),
          ),
        ),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  controller.isHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: () {
                  controller.toggleVisibility();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      contentPadding: const EdgeInsets.all(24),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.isHidden.value
                                ? 'Mode Hide'
                                : 'Mode Normal',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E2E2E),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            controller.isHidden.value
                                ? 'Kategori ini telah disembunyikan!'
                                : 'Kategori ini telah ditampilkan kembali di daftar anda!',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF2E2E2E)),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5F3DC4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Selesai',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 250, 249, 250),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: const Text(
                'Silahkan menambahkan Kategori',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField('Kode*'),
            _buildTextField('Nama Kategori'),
            _buildDropdownField('Parent Kategori'),
            const SizedBox(height: 16),
            const Text(
              'Tipe',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildChip('Inventory Items'),
                const SizedBox(width: 8),
                _buildChip('Sales Items'),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Jenis Pajak'),
            _buildTextField('Keterangan'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'More',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                IconButton(
                  icon: const Icon(Icons.expand_more),
                  onPressed: () {},
                ),
              ],
            ),
            _buildTextField('Harga Poin'),
            _buildTextField('Kenaikan Harga'),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5F3DC4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: const Text(
                'Simpan',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        items: [],
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF5F3DC4),
    );
  }
}

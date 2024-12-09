import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart.dart';
import '../widgets/empty_state_widget.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(controller, context),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          _buildSearchAndFilter(controller),
          Expanded(
            child: Obx(() {
              if (controller.isEmpty.value) {
                return TabBarView(
                  controller: controller.tabController,
                  children: [
                    EmptyStateWidget(
                      message: 'Oops! Kategori Kosong :(',
                      description: 'Belum ada data Kategori',
                      onPressed: () {},
                    ),
                    EmptyStateWidget(
                      message: 'Oops! Sub kategori Kosong :(',
                      description: 'Belum ada data Sub kategori',
                      onPressed: () {},
                    ),
                  ],
                );
              }
              return TabBarView(
                controller: controller.tabController,
                children: [
                  _buildCategoryList(controller.filteredCategories, 'Kategori'),
                  _buildCategoryList(controller.filteredSubCategories, 'Sub kategori'),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(CategoryController controller, BuildContext context) {
    return AppBar(
      title: const Text(
        'Daftar Kategori',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: const Color(0xFF5F3DC4),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      bottom: TabBar(
        controller: controller.tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withOpacity(0.6),
        indicatorColor: Colors.white,
        tabs: const [
          Tab(text: 'Kategori'),
          Tab(text: 'Sub kategori'),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter(CategoryController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) => controller.search(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF4F4F4),
                prefixIcon: const Icon(Icons.search, color: Colors.black45),
                hintText: 'Cari Data',
                hintStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.tune, color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList(List<String> categories, String categoryName) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index]),
          onTap: () {
          },
        );
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Project', 'Saved', 'Shared', 'Achievement'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Portfolio', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_rounded, color: Colors.deepOrange),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.deepOrange),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
      floatingActionButton: _buildFilterButton(),
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child:
                _buildTab(_tabs[index], isSelected: _selectedTabIndex == index),
          );
        },
      ),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.deepOrange : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.deepOrange : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: TextField(
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Search a project',
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 8.h,
                width: 8.w,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.search,
                  size: 20.w,
                  color: Colors.white,
                )),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!, width: 2),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildProjectList();
      case 1:
        return Center(child: Text('Saved Content'));
      case 2:
        return Center(child: Text('Shared Content'));
      case 3:
        return Center(child: Text('Achievement Content'));
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildProjectList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchBar(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return _buildProjectCard();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard() {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[200]!, width: 2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 0.2,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: Container(
              height: 115,
              width: 100,
              child: Image.asset(
                'assets/images/writing.jpg',
                // width: 100.w,
                // height: 115.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kemampuan Merangkum Tulisan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BAHASA SUNDA',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Oleh Al-Baiqi Samaan',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 60.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.deepOrange, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20.w),
        FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          onPressed: () {},
          label: Text(
            'Filter',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.filter_list, color: Colors.white),
          backgroundColor: Colors.deepOrange,
        ),
      ],
    );
  }
}

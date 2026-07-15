import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_10/screens/welcome_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌟 قمنا بتغيير اسم الكلاس ليعبر عن كونه الـ Drawer الأساسي للتطبيق
class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  File? _imagefile;
  String _displayName = "User"; // 🌟 اسمكِ الافتراضي الجميل
  
  @override
  void initState(){
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString('user_name');

    if(savedName!=null&&savedName.isNotEmpty){
      setState(() {
        _displayName=savedName;
      });
    }else{
      String? email=prefs.getString('user_email');
      if(email!=null&&email.contains('@')){
        setState(() {
          _displayName=email.split('@')[0];

        });
      }else{
        setState(() {
          _displayName='User';
        });
      }
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagefile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
       borderRadius: const BorderRadius.only(
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
      child: Drawer(
        //width: MediaQuery.of(context).size.width * 0.65,
       // width: 280,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                //padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
                padding: const EdgeInsets.only(top: 30.0, bottom: 10.0, left: 24.0, right: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _pickImageFromGallery,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: _imagefile != null
                                ? FileImage(_imagefile!)
                                : null,
                            child: _imagefile == null
                                ? const Icon(
                                    Icons.person_rounded,
                                    size: 45,
                                    color: Color(0xFF757575),
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _displayName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                  
                ),
              ),
              SizedBox(height: 20,),
              const Divider(color: Color(0xFFEEEEEE), thickness: 1,
              height: 1,
              ),
      
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  children: [
                    _buildDrawerItem(
                      icon: Icons.home_outlined,
                      title: 'Home',
                      onTap: () {
                        Navigator.pop(context);
                      }, 
                    ),
                    _buildDrawerItem(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'Messages',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.notifications_none_rounded,
                      title: 'Notifications',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.bookmark_border_rounded,
                      title: 'Bookmarks',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.person_outline_rounded,
                      title: 'Profile',
                      onTap: () {
                        Navigator.pop(context); // يغلق القائمة الجانبية
                        // 🌟 يمكنكِ مستقبلاً توجيهه لشاشة بروفايل مستقلة بدلاً من فتح نفس الدروير
                      },
                    ),
                  ],
                ),
              ),
              const Divider(color: Color(0xFFEEEEEE), thickness: 1),
      
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.remove('user_name');
                  },
                  child: Row(
                    children:  [
                      Icon(Icons.logout_rounded, color: Colors.black, size: 24),
                      SizedBox(width: 16),
                      InkWell(
                        
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'Inter',
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                        },
                      ),
                     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF555555), size: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          height: 1,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: 'Inter',
          letterSpacing: 0,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
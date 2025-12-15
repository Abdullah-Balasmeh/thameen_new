import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/home/presentation/views/home_view.dart';
import 'package:thameen/features/post%20item/presentation/views/post_report_view.dart';
import 'package:thameen/features/profile/presentation/views/profile_view.dart';
import 'package:thameen/shared/widgets/app_bar.dart';
import 'package:thameen/shared/widgets/switch_mode_and_language.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  static const String routeName = 'base_view';

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  late PageController pageController;
  int selectedIndex = 0;

  List<Widget> pages = [
    const HomeView(),
    const Text('AI Search'),
    const PostReportView(),
    const SwitchModeAndLanguage(),
    const ProfileView(),
  ];
  List<String> titles = [
    'Thameen',
    'AI Search',
    'Post item',
    'Messages',
    'Profile',
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        showButtonBack: false,
        showButtonActions: true,
        title: titles[selectedIndex],
        backgroundColor: AppColors.primary,
      ),
      body: PageView.builder(
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
          pageController.jumpToPage(
            index,
          );
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Theme.of(context).iconTheme.color,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.psychology),
          label: 'AI Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add),
          label: 'Post item',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/ai/presentation/views/ai_view.dart';
import 'package:thameen/features/chat/presentation/views/chat_view.dart';
import 'package:thameen/features/home/domain/repositories/home_repo.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/views/home_view.dart';
import 'package:thameen/features/post%20item/presentation/views/post_report_view.dart';
import 'package:thameen/features/profile/presentation/views/profile_view.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/services/app_lifecycle_handler.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';
import 'package:thameen/shared/services/user_presence_service.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

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
    const AiView(),
    const PostReportView(),
    const ChatView(),
    const ProfileView(),
  ];
  List<String> titles = [
    S.current.thameen,
    S.current.aiSearch,
    S.current.postItem,
    S.current.messages,
    S.current.profile,
  ];
  late AppLifecycleHandler _lifecycleHandler;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    final currentUserId = SharedPreferencesSingleton.getString('user');
    _lifecycleHandler = AppLifecycleHandler(
      currentUserId,
      getIt<UserPresenceService>(),
    );

    WidgetsBinding.instance.addObserver(_lifecycleHandler);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleHandler);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
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
        ),
      ),
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
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: S.current.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.psychology),
          label: S.current.aiSearch,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.post_add),
          label: S.current.postItem,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.chat_bubble_outline),
          label: S.current.messages,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: S.current.profile,
        ),
      ],
    );
  }
}

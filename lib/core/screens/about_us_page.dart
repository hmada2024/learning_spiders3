//lib/core/screens/about_us_page.dart
import 'package:learning_spiders/core/config/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:learning_spiders/core/config/screen_size.dart';

class AboutUsPage extends StatefulWidget {
  static const routeName = AppRoutes.aboutUs;
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final AnimationController _slideController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<Offset> _slideAnimationLeft = Tween<Offset>(
    begin: const Offset(-0.1, 0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeInOut));

  late final Animation<Offset> _slideAnimationRight = Tween<Offset>(
    begin: const Offset(0.1, 0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeInOut));

  late final Animation<Offset> _slideAnimationUp = Tween<Offset>(
    begin: const Offset(0, 0.1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.getWidth(context);
    final theme = Theme.of(context); // Get theme
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Our App'),
        // Style is in theme.dart
      ),
      body: Container(
        // Added Container
        color: theme.colorScheme.surface, // Use background color from theme
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.1),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                        parent: _slideController, curve: Curves.easeInOut)),
                    child: Text(
                      'English Spider',
                      style: theme.textTheme.displayLarge, // Use from theme
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),

                // Description
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationLeft,
                    child: Text(
                      'تطبيق English Spider هو رفيقك المثالي لتعلم المفردات الإنجليزية بطريقة ممتعة وتفاعلية. يهدف التطبيق إلى مساعدتك في اكتساب مجموعة واسعة من الكلمات والعبارات من خلال تصنيفات متنوعة واختبارات شيقة.',
                      style: theme.textTheme.bodyLarge, // Use from theme
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),

                // Features
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationRight,
                    child: Text(
                      'ما يميز تطبيقنا؟',
                      style: theme.textTheme.displaySmall, // Use from theme
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),

                // Feature List
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationLeft,
                    child: ListTile(
                      leading: Icon(Icons.library_books,
                          color: theme.colorScheme.primary,
                          size: screenWidth * 0.06), // Use color from theme
                      title: Text(
                        'مفردات متنوعة: اكتشف كلمات في مختلف التصنيفات مثل الصفات، الأسماء، والكلمات المركبة.',
                        style: theme.textTheme.bodyLarge, // Use from theme
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationRight,
                    child: ListTile(
                      leading: Icon(Icons.record_voice_over,
                          color: theme.colorScheme.primary,
                          size: screenWidth * 0.06),
                      title: Text(
                        'نطق صحيح: استمع إلى النطق الصحيح لكل كلمة لتحسين مهارات الاستماع والتحدث.',
                        style: theme.textTheme.bodyLarge, // Use from theme
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationLeft,
                    child: ListTile(
                      leading: Icon(Icons.image,
                          color: theme.colorScheme.primary,
                          size: screenWidth * 0.06),
                      title: Text(
                        'صور توضيحية: اربط الكلمات بالصور لتسهيل عملية الحفظ والتذكر.',
                        style: theme.textTheme.bodyLarge, // Use from theme
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationRight,
                    child: ListTile(
                      leading: Icon(Icons.quiz,
                          color: theme.colorScheme.primary,
                          size: screenWidth * 0.06),
                      title: Text(
                        'اختبارات تفاعلية: اختبر معلوماتك من خلال اختبارات مطابقة الصور والكلمات.',
                        style: theme.textTheme.bodyLarge, // Use from theme
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),

                // How to Use
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationUp,
                    child: Text(
                      'كيف تستفيد من التطبيق؟',
                      style: theme.textTheme.displaySmall, // Use from theme
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),

                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationLeft,
                    child: Text(
                      'ابدأ باستكشاف قسم "التعلم" لتصفح المفردات حسب التصنيفات المختلفة. اضغط على الكلمات للاستماع إلى النطق ومشاهدة الصور. بعد ذلك، توجه إلى قسم "الاختبارات" لتحدي نفسك وتثبيت ما تعلمته.',
                      style: theme.textTheme.bodyLarge, // Use from theme
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.04),

                // Conclusion
                FadeTransition(
                  opacity: _fadeController,
                  child: SlideTransition(
                    position: _slideAnimationRight,
                    child: Text(
                      'نتمنى لك تجربة تعلم ممتعة ومفيدة مع English Spider!',
                      style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight:
                              FontWeight.bold), // Use from theme and add bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

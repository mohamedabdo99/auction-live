import 'package:auction/main.dart';
import 'package:flutter/material.dart';
import 'package:landing_page/landing_page.dart';
import 'package:landing_page/lib.dart';
import '../widgets/app_animations.dart';
import '../widgets/banners.dart';
import '../widgets/counter_down.dart';
import '../widgets/player.dart';
import '../widgets/responsive_container.dart';
import '../widgets/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> posters = const [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  final List<String> postersInside = const [
    'assets/images/inside1.png',
    'assets/images/inside2.png',
  ];

  final List<String> aqarContent = const [
    'assets/images/-04.png',
    'assets/images/-05.png',
  ];

  final GlobalKey<ScaffoldState> _lpkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    return LandingPage(
      title: '',
      background: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff827153), Color(0xff6b5d44)],
        ),
      ),
      showLeadingIconOnHeader: true,
      footer: Footer(title: "إرث الدرعية © 2025", tabItems: []),
      isFloating: false,
      fabIcon: SizedBox(),
      openDrawerOnLeft: false,
      drawerIcon: SizedBox(),
      trailing: SizedBox(),
      drawerIconLeading: false,
      scaffoldKey: _lpkey,
      children: _buildTabItems(),
    );
  }

  List<TabItem> _buildTabItems() {
    return [
      TabItem(
        title: _buildTabTitle("", Icons.home),
        onTap: () => _handleTabTap("الرئيسية"),
        tIOnTap: true,
        tab: _buildHeroSection(),
        children: [],
      ),
      TabItem(
        title: _buildTabTitle("", Icons.video_library),
        onTap: () => _handleTabTap("الفيديو"),
        tIOnTap: true,
        tab: _buildVideoSection(),
        children: [],
      ),
      TabItem(
        title: _buildTabTitle("الصور الرئيسية", Icons.photo),
        onTap: () => _handleTabTap("الصور الرئيسية"),
        tIOnTap: true,
        tab: _buildMainImagesSection(),
        children: [],
      ),
      // TabItem(
      //   title: _buildTabTitle("مكونات العقار", Icons.architecture),
      //   onTap: () => _handleTabTap("مكونات العقار"),
      //   tIOnTap: true,
      //   tab: _buildAqarContentSection(),
      //   children: [],
      // ),
      TabItem(
        title: _buildTabTitle("من الداخل", Icons.photo_library),
        onTap: () => _handleTabTap("من الداخل"),
        tIOnTap: true,
        tab: _buildInsideImagesSection(),
        children: [],
      ),
      TabItem(
        title: _buildTabTitle("من الخارج", Icons.landscape),
        onTap: () => _handleTabTap("من الخارج"),
        tIOnTap: true,
        tab: _buildOutsideImagesSection(),
        children: [],
      ),
      TabItem(
        title: _buildTabTitle("الموقع", Icons.map),
        onTap: () => _handleTabTap("الموقع"),
        tIOnTap: true,
        tab: _buildMapSection(),
        children: [],
      ),
      TabItem(
        title: _buildTabTitle("اتصل بنا", Icons.contact_page),
        onTap: () => _handleTabTap("اتصل بنا"),
        tIOnTap: true,
        tab: _buildContactSection(),
        children: [],
      ),
    ];
  }

  // =============== Helper Methods ===============

  Widget _buildTabTitle(String text, IconData icon) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSmallScreen) ...[
              Icon(icon, size: 16, color: Colors.white),
              SizedBox(width: 6),
            ],
            Text(
              isSmallScreen ? _getShortTabName(text) : text,
              style: TextStyle(
                fontFamily: 'newFont',
                fontSize: isSmallScreen ? 12 : 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }

  String _getShortTabName(String fullName) {
    switch (fullName) {
      case "الصور الرئيسية": return "";
      // case "مكونات العقار": return "المكونات";
      case "من الداخل": return "";
      case "من الخارج": return "";
      case "الموقع": return ""; // أضف هذا
      case "اتصل بنا": return "";
      default: return fullName;
    }
  }

  void _handleTabTap(String tabName) {
    print("تم النقر على: $tabName");
  }

  // =============== Content Builders ===============

  Widget _buildHeroSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff827153), Color(0xff6b5d44)],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 32,
                vertical: isMobile ? 20 : 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isMobile) ...[
                    // Mobile Layout with Animation
                    AppAnimations.scaleIn(
                      Container(
                        clipBehavior: Clip.hardEdge,
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/-01.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient overlay
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Animated Button
                    AppAnimations.fadeIn(
                      ElevatedButton(
                        onPressed: () {
                          LauncherHelper.launchUrlString(
                            'https://oq.sa/%D9%85%D9%86-%D9%86%D8%AD%D9%86-2/',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xff827153),
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          shadowColor: Colors.black.withOpacity(0.3),
                        ),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'من نحن العقيلات',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'newFont',
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_back_ios_new, size: 14),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    // Desktop Layout with Animations
                    AppAnimations.slideIn(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Logo with animation
                          AppAnimations.fadeIn(
                            Image.asset(
                              'assets/images/logo2.png',
                              width: isMobile ? 90 : 150,
                              height: isMobile ? 90 : 150,
                              fit: BoxFit.contain,
                            ),
                            duration: Duration(milliseconds: 800),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Animated Title
                                AppAnimations.slideIn(
                                  Text(
                                    'تجربة سكنية فاخرة تجمع بين الأصالة والحداثة',
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 18,
                                      color: Colors.white.withOpacity(0.9),
                                      fontFamily: 'newFont',
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  begin: Offset(50, 0),
                                  duration: Duration(milliseconds: 700),
                                ),
                                SizedBox(height: 20),
                                // Animated Button
                                AppAnimations.fadeIn(
                                  ElevatedButton(
                                    onPressed: () {
                                      LauncherHelper.launchUrlString(
                                        'https://oq.sa/%D9%85%D9%86-%D9%86%D8%AD%D9%86-2/',
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Color(0xff827153),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 5,
                                      shadowColor: Colors.black.withOpacity(0.3),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'من نحن العقيلات',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'newFont',
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.arrow_back_ios_new, size: 16),
                                      ],
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1000),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  SizedBox(height: isMobile ? 20 : 30),

                  // Animated Countdown
                  AppAnimations.scaleIn(
                    CountdownTimerWidget(
                      targetDate: DateTime(2025, 12, 24, 0, 0),
                    ),
                  ),

                  SizedBox(height: isMobile ? 20 : 30),

                  // Animated Section Title
                  AppAnimations.fadeIn(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مكونات العقار',
                          style: TextStyle(
                            fontSize: isMobile ? 22 : 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'newFont',
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Container(
                          width: 100,
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white.withOpacity(0.5)],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Animated Grid Items
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isMobile ? 9 : 8,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final List<Map<String, dynamic>> items = [
                        { 'icon': Icons.home, 'text': '5 فلل' },
                        { 'icon': Icons.person, 'text': 'سكن عمال' },
                        { 'icon': Icons.meeting_room, 'text': '2 غرفة حارس مع مطبخ' },
                        { 'icon': Icons.house, 'text': 'مبنى سكن عاملات' },
                        { 'icon': Icons.restaurant, 'text': 'منطقة شواء' },
                        { 'icon': Icons.business, 'text': 'مبنى إداري' },
                      ];

                      return AppAnimations.slideIn(
                        buildDetailItem(
                          icon: items[index]['icon'],
                          text: items[index]['text'],
                        ),
                        begin: Offset(0, 40),
                        duration: Duration(milliseconds: 1000 + (index * 100)),
                      );
                    },
                  ),

                  SizedBox(height: 40),

                  // Animated Features Section
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'ميزات العقار',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'newFont',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Text(
                      'يطل العقار علي شارع الأمير سلمان بن عبدالعزيز بالقرب من بوليفارد الرياض سيتي سكوير 2 وبوليفارد وورلد بالقرب من المسار الرياضي - طريق الأمير محمد بن سلمان بن عبدالعزيز بالقرب من النيابة العامة بمحافظة الدرعية وطريق الملك خالد',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.map, color: Colors.lightBlue, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'الحدود والأطوال',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'newFont',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Text(
                      '''شمالاً: طريق العودة بطول 113.07 متر
جنوباً: مزرعة ملك جار بطول منكسر 74.57 متر
شرقاً: مزرعة ملك جار بطول منكسر 57.9 متر
غرباً: مزرعة ملك جار بطول منكسر 73.28 متر''',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 18,
                        color: Colors.white,
                      ),
                    ),
                    //
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildStatItem(String value, String label, IconData icon, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 10 : 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: isMobile ? 25 : 35,
              color: Colors.white
          ),
          SizedBox(height: isMobile ? 5 : 8),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 18 : 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'newFont',
            ),
          ),
          SizedBox(height: isMobile ? 2 : 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.white.withOpacity(0.9),
              fontFamily: 'newFont',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailItem({
    required IconData icon,
    required String text,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: StatefulBuilder(
        builder: (context, setState) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  // Animated Icon Container
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                        colors: [Color(0xff827153), Color(0xff6b5d44)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff827153).withOpacity(0.4),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size:  14,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3A3A3A),
                        fontFamily: 'newFont',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildVideoSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff827153), Color(0xff6b5d44)],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 30 : 40,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Column(
                children: [
                  Text(
                    'جولة مرئية في المشروع',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontFamily: 'newFont',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 8 : 10),
                  Text(
                    'شاهد جولة حصرية داخل إرث الدرعية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.white,
                      fontFamily: 'newFont',
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  Container(
                    constraints: BoxConstraints(maxWidth: 1700),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: YouTubeVideoWeb(
                        videoUrl: "https://youtu.be/klIb_Jo5ioc",
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainImagesSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'الصور الرئيسية',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 32,
                    fontFamily: 'newFont',
                    color: Color(0xff827153),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 30),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                      child: Image.asset(
                        'assets/images/-01.png',
                        height: isMobile ? 250 : 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: isMobile ? 15 : 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                      child: Image.asset(
                        'assets/images/-02.png',
                        height: isMobile ? 250 : 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAqarContentSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff827153), Color(0xff6b5d44)],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 30 : 40,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Column(
                children: [
                  Text(
                    'مكونات العقار',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontFamily: 'newFont',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 8 : 10),
                  Text(
                    'جودة وإتقان في كل التفاصيل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 18,
                      color: Colors.white,
                      fontFamily: 'newFont',
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  BannersWidget(
                    posters: aqarContent,
                    centerText: true,
                    height: isMobile ? 300 : 600,
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInsideImagesSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff827153), Color(0xff6b5d44)],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 30 : 40,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Column(
                children: [
                  Text(
                    'التصميم الداخلي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontFamily: 'newFont',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 8 : 10),
                  Text(
                    'فخامة من الداخل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 18,
                      color: Colors.white,
                      fontFamily: 'newFont',
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  BannersWidget(
                    posters: postersInside,
                    centerText: true,
                    height: isMobile ? 250 : 400,
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOutsideImagesSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff827153), Color(0xff6b5d44)],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 30 : 40,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Column(
                children: [
                  Text(
                    'التصميم الخارجي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontFamily: 'newFont',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 8 : 10),
                  Text(
                    'واجهات معمارية مستوحاة من تراث الدرعية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 18,
                      color: Colors.white,
                      fontFamily: 'newFont',
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  BannersWidget(
                    posters: posters,
                    centerText: true,
                    height: isMobile ? 300 : 500,
                    isMobile: isMobile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildContactSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff827153), Color(0xff6b5d44)],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 60,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Column(
                children: [
                  Text(
                    'للحجز والاستفسارات',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 36,
                      color: Colors.white,
                      fontFamily: 'newFont',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 10 : 15),
                  Text(
                    'نحن هنا للإجابة على جميع استفساراتك',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 18,
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'newFont',
                    ),
                  ),
                  SizedBox(height: isMobile ? 20 : 30),
                  ElevatedButton(
                    onPressed: () {
                      LauncherHelper.launchCall('+966555556865');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xff827153),
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 30 : 40,
                        vertical: isMobile ? 12 : 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'اتصل الآن',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'newFont',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildCounterDown(){
  return CountdownTimerWidget(targetDate: DateTime(2025, 12, 24, 0, 0),);
}


Widget _buildMapWidget(bool isMobile) {
  const lat = 24.7558333;
  const lng = 46.55675;

  final mapUrl = '''
https://www.google.com/maps/embed/v1/place?key=AIzaSyDcQzie5pBAQF4OmP-9nRNx-qeeubDe3Vo
&q=24.7558333,46.55675
&zoom=${isMobile? 18 : 21}
''';

  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(mapUrl)),
    ),
  );
}

String _generateStaticMapUrl(double lat, double lng) {
  // رابط لصورة ثابتة من Google Maps مع Satellite View
  return 'https://maps.googleapis.com/maps/api/staticmap?'
      'center=$lat,$lng'
      '&zoom=16'
      '&size=600x400'
      '&maptype=satellite'
      '&markers=color:red%7Clabel:E%7C$lat,$lng'
      '&key=AIzaSyDcQzie5pBAQF4OmP-9nRNx-qeeubDe3Vo'; // استبدل بمفتاح API الخاص بك
}
Widget _buildMapSection() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 768;
      final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

      // إحداثيات موقع إرث الدرعية (يمكن تعديلها حسب الموقع الفعلي)
      final double defaultLatitude = 24.7558333;
      final double defaultLongitude = 46.55675;
      final String locationName = "إرث الدرعية";
      final String address = "3438 الشيخ محمد بن عبدالوهاب، 7455، الدرعية، الرياض 13713";

      return Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff827153), Color(0xff6b5d44)],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 30 : 40,
              horizontal: isMobile ? 16 : 24,
            ),
            child: Column(
              children: [
                Text(
                  'الموقع على الخريطة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 32,
                    fontFamily: 'newFont',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isMobile ? 8 : 10),
                Text(
                  'مشروع إرث الدرعية - قلب التاريخ السعودي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white,
                    fontFamily: 'newFont',
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 30),

                // معلومات الموقع
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(isMobile ? 16 : 20),
                  margin: EdgeInsets.only(bottom: isMobile ? 20 : 30),
                  decoration: BoxDecoration(
                    color: Color(0xff827153).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.location_on, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            'العنوان',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              color: Colors.white,
                              fontFamily: 'newFont',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        address,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.white.withOpacity(0.9),
                          fontFamily: 'newFont',
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            'الهاتف',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              color: Colors.white,
                              fontFamily: 'newFont',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          '+966 55 555 6865',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'newFont',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // حاوية الخريطة
                Container(
                  width: double.infinity,
                  height: isMobile ? 350 : isTablet ? 450 : 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 15),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(isMobile ? 10 : 15),
                    child: _buildMapWidget(isMobile),
                  ),
                ),

                SizedBox(height: isMobile ? 20 : 30),

                // أزرار التحكم
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // فتح خرائط جوجل
                        _openGoogleMaps(defaultLatitude, defaultLongitude, locationName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xff827153),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 15 : 20,
                          vertical: isMobile ? 10 : 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      icon: Icon(Icons.directions, size: isMobile ? 18 : 20),
                      label: Text(
                        'الاتجاهات',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'newFont',
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _openGoogleMaps(double lat, double lng, String label) async {
  final String url = 'https://www.google.com/maps/search/?api=1'
      '&query=$lat,$lng'
      '&query_place_id=$label';

  try {
    await LauncherHelper.launchUrlString(url);
  } catch (e) {
    print('Error opening Google Maps: $e');
  }
}

void _shareLocation(double lat, double lng, String title, String address) async {
  final String shareText = '📍 $title\n'
      '$address\n\n'
      'الموقع على الخريطة:\n'
      'https://maps.google.com/?q=$lat,$lng\n\n'
      '#إرث_الدرعية #الدرعية #الرياض';

  // يمكنك استخدام حزمة share_plus للشارة
  // Share.share(shareText);

  // أو استخدام LauncherHelper إذا كان يدعم المشاركة
  print('Share location: $shareText');

  // عرض رسالة للمستخدم
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(
        'تم نسخ معلومات الموقع للمشاركة',
        style: TextStyle(fontFamily: 'newFont'),
      ),
      backgroundColor: Color(0xff827153),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:landing_page/landing_page.dart';
import 'package:landing_page/lib.dart';
import '../widgets/banners.dart';
import '../widgets/player.dart';
import '../widgets/url_launcher.dart';

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
    return LandingPage(
      title: '',
      // إعدادات خلفية بسيطة
      background: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff827153), Color(0xff6b5d44)],
        ),
      ),
      showLeadingIconOnHeader: true,
      // إعدادات Footer لتجنب الخطأ
      footer: Footer(title: "إرث الدرعية © 2024", tabItems: []),
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
      // Home Section
      TabItem(
        title: _buildTabTitle("الرئيسية", Icons.home),
        onTap: () => _handleTabTap("الرئيسية"),
        tIOnTap: true,
        tab: _buildHeroSection(),
        children: [],
      ),

      // Video Section
      TabItem(
        title: _buildTabTitle("الفيديو", Icons.video_library),
        onTap: () => _handleTabTap("الفيديو"),
        tIOnTap: true,
        tab: _buildVideoSection(),
        children: [],
      ),

      // Main Images Section
      TabItem(
        title: _buildTabTitle("الصور الرئيسية", Icons.photo),
        onTap: () => _handleTabTap("الصور الرئيسية"),
        tIOnTap: true,
        tab: _buildMainImagesSection(),
        children: [],
      ),

      // Aqar Content
      TabItem(
        title: _buildTabTitle("مكونات العقار", Icons.architecture),
        onTap: () => _handleTabTap("مكونات العقار"),
        tIOnTap: true,

        tab: _buildAqarContentSection(),
        children: [],
      ),

      // Inside Images
      TabItem(
        title: _buildTabTitle("من الداخل", Icons.photo_library),
        onTap: () => _handleTabTap("من الداخل"),
        tIOnTap: true,

        tab: _buildInsideImagesSection(),
        children: [],
      ),

      // Outside Images
      TabItem(
        title: _buildTabTitle("من الخارج", Icons.landscape),
        onTap: () => _handleTabTap("من الخارج"),
        tIOnTap: true,
        tab: _buildOutsideImagesSection(),
        children: [],
      ),

      // Contact Section
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon(icon, size: 20),
        // SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'newFont',
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _handleTabTap(String tabName) {
    print("تم النقر على: $tabName");
  }

  // =============== Content Builders ===============

  Widget _buildHeroSection() {
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'إرث الدرعية',
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontFamily: 'newFont',
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'تجربة سكنية فاخرة تجمع بين الأصالة والحداثة',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'newFont',
                          ),
                        ),
                        SizedBox(height: 20),
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
                          ),
                          child: Text(
                            'من نحن العقيلات',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'newFont',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildStatItem('100+', 'فيلا', Icons.villa),
                  _buildStatItem('50+', 'شقة', Icons.apartment),
                  _buildStatItem('30+', 'متجر', Icons.store),
                  _buildStatItem('70%', 'مساحة خضراء', Icons.park),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Icon(icon, size: 35, color: Colors.white),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'newFont',
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              fontFamily: 'newFont',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoSection() {
    return Container(
      color: Colors.grey[50],
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              Text(
                'جولة مرئية في المشروع',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'newFont',
                  color: Colors.white,

                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'شاهد جولة حصرية داخل إرث الدرعية',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'newFont',
                ),
              ),
              SizedBox(height: 30),
              Container(
                constraints: BoxConstraints(maxWidth: 800),
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
  }

  Widget _buildMainImagesSection() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'الصور الرئيسية',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'newFont',
                color: Color(0xff827153),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/-01.png',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/-02.png',
                    height: 400,
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
  }

  Widget _buildAqarContentSection() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            Text(
              'مكونات العقار',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'newFont',
                color: Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'جودة وإتقان في كل التفاصيل',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,

                fontFamily: 'newFont',
              ),
            ),
            SizedBox(height: 30),
            BannersWidget(posters: aqarContent, centerText: true, height: 600),
          ],
        ),
      ),
    );
  }

  Widget _buildInsideImagesSection() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            Text(
              'التصميم الداخلي',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'newFont',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'فخامة من الداخل',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,

                fontFamily: 'newFont',
              ),
            ),
            SizedBox(height: 30),
            BannersWidget(
              posters: postersInside,
              centerText: true,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutsideImagesSection() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            Text(
              'التصميم الخارجي',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'newFont',
                color: Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'واجهات معمارية مستوحاة من تراث الدرعية',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'newFont',
              ),
            ),
            SizedBox(height: 30),
            BannersWidget(posters: posters, centerText: true, height: 500),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
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
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            children: [
              Text(
                'للحجز والاستفسارات',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontFamily: 'newFont',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'نحن هنا للإجابة على جميع استفساراتك',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.9),
                  fontFamily: 'newFont',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  LauncherHelper.launchCall('+966555556865');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xff827153),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'اتصل الآن',
                  style: TextStyle(
                    fontSize: 18,
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
  }
}

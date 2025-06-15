import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_img.dart';
import 'package:vpn/components/build_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<MainScreen> {
  bool clickOnStart = false;
  String? selectedServerText;
  final ScrollController _scrollController = ScrollController();
  bool isScrolled = false;

  final Map<String, List<String>> categories = {
    "Популярные": ["Сервер A", "Сервер B", "Сервер C", "Сервер D"],
    "Хорошие": ["Сервер E", "Сервер F", "Сервер G"],
    "Понравившиеся": [
      "Сервер H",
      "Сервер I",
      "Сервер J",
      "Сервер K",
      "Сервер L",
    ],
  };

  bool isdarkMode = false;

  @override
  void initState() {
    super.initState();
    selectedServerText = categories["Популярные"]?.first;
    _scrollController.addListener(() {
      if (_scrollController.offset > 10 && !isScrolled) {
        setState(() => isScrolled = true);
      } else if (_scrollController.offset <= 10 && isScrolled) {
        setState(() => isScrolled = false);
      }
    });
  }

  Map<String, List<String>> getUpdatedCategories() {
    final updated = Map<String, List<String>>.from(categories);
    if (selectedServerText != null) {
      updated.remove('Выбранные');
      return {
        'Выбранные': [selectedServerText!],
        ...updated,
      };
    }
    return updated;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updatedCategories = getUpdatedCategories();

    return Scaffold(
      backgroundColor: isScrolled ? Colors.grey[200] : Colors.white,
      drawer: Drawer(
        width: double.infinity,
        backgroundColor: const Color(0XFF0BAB7E),
        child: Column(
          children: [
            SizedBox(height: 50),
            // menu & back
            Row(
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 145.0),
                  child: BuildText(
                    text: 'Menu',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),

            // user info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Container(
                width: double.infinity,
                height: 67,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // user img
                    CircleAvatar(radius: 25),
                    //user name
                    BuildText(
                      text: 'Lerm',
                      textColor: Color(0XFF0BAB7E),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    //user plan
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      height: 23,
                      decoration: BoxDecoration(
                        color: Color(0XFF0BAB7E),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: BuildText(
                          text: 'free plan',
                          fontSize: 14,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildText(
                          text:
                              index == 0
                                  ? 'Upgrade to premium'
                                  : index == 1
                                  ? 'Server List'
                                  : index == 2
                                  ? "Speed Test"
                                  : 'Settings',
                          textColor: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () {
                            //TODO
                          },
                          icon: Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 82),
            ...List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildText(
                          text:
                              index == 0
                                  ? 'Privacy & Policy'
                                  : index == 1
                                  ? 'Terms of Service'
                                  : index == 2
                                  ? 'FAQ'
                                  : 'Customer Support',
                          textColor: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        IconButton(
                          onPressed: () {
                            //TODO
                          },
                          icon: Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildText(
                    text: 'Dark Mode',
                    textColor: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  CupertinoSwitch(
                    value: isdarkMode,
                    onChanged: (val) {
                      setState(() {
                        isdarkMode = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BuildText(
                  text: 'Version:2.25 HideVpn',
                  fontSize: 16,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),

      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 690.0,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _secureAndConnectContainer(
                        width: 154,
                        boxColor:
                            !clickOnStart
                                ? Color(0xFFF06A30)
                                : Color(0xff0cbc8b),
                        text: !clickOnStart ? 'Not Secured' : 'Secured',
                        borderRadius: BorderRadius.circular(25),
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 53.0,
                          bottom: 132.0,
                        ),
                        child: GestureDetector(
                          onTap:
                              () =>
                                  setState(() => clickOnStart = !clickOnStart),
                          child: Container(
                            width: 168,
                            height: 168,
                            decoration: BoxDecoration(
                              color: Color(0xffd9d9d9),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    if (clickOnStart)
                                      BoxShadow(
                                        color: Color(0xff0cbc8b),
                                        offset: Offset(0, 1),
                                        blurRadius: 12,
                                      ),
                                  ],
                                  color:
                                      clickOnStart
                                          ? Color(0xff0cbc8b)
                                          : Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    width: 104,
                                    height: 104,
                                    decoration: BoxDecoration(
                                      color:
                                          clickOnStart
                                              ? Color(0xff0cbc8b)
                                              : Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            clickOnStart
                                                ? Colors.black
                                                : Colors.grey,
                                        width: 0.1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.power_settings_new,
                                          color:
                                              clickOnStart
                                                  ? Colors.white
                                                  : Color(0xff0cbc8b),
                                        ),
                                        BuildText(
                                          text: clickOnStart ? 'Stop' : 'Start',
                                          textColor:
                                              clickOnStart
                                                  ? Colors.white
                                                  : Color(0xff0cbc8b),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _secureAndConnectContainer(
                        width: 176,
                        boxColor:
                            !clickOnStart
                                ? Color(0xFFF06A30)
                                : Color(0xff0cbc8b),
                        text: !clickOnStart ? 'Not Connected' : 'Connected',
                        borderRadius: BorderRadius.circular(15),
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      if (selectedServerText != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: BuildText(
                            text: 'Вы выбрали: $selectedServerText',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black87,
                          ),
                        ),
                      Container(
                        width: 327,
                        height: 104,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withValues(alpha: 0.05),
                              offset: Offset(0, 8),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _speedBox(
                              'Download',
                              Icons.arrow_downward_rounded,
                              Colors.green,
                            ),
                            Container(
                              width: 1,
                              height: 104,
                              color: Colors.grey[200],
                            ),
                            _speedBox(
                              'Upload',
                              Icons.arrow_upward_rounded,
                              Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // Категории серверов с "Выбранные"
            for (var category in updatedCategories.entries) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: BuildText(
                    text: category.key,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final serverName = category.value[index];
                  return GestureDetector(
                    onTap:
                        () => setState(() => selectedServerText = serverName),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: BuildImage(
                            imgPath: 'assets/images/flag.png',
                          ),
                          title: BuildText(
                            text: serverName,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: BuildText(
                            text: 'Free plan, Limited speed',
                            fontSize: 11,
                          ),
                          trailing: Icon(Icons.navigate_next_rounded),
                        ),
                      ),
                    ),
                  );
                }, childCount: category.value.length),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _speedBox(String label, IconData icon, Color color) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildText(text: label, fontSize: 14, fontWeight: FontWeight.w600),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(child: Icon(icon, color: color, size: 18)),
              ),
            ],
          ),
          BuildText(
            text: '0.00 mb/s',
            textColor: Colors.grey[500],
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Container _secureAndConnectContainer({
    Color? boxColor,
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    BorderRadiusGeometry? borderRadius,
    required double width,
    Color? textColor,
  }) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(color: boxColor, borderRadius: borderRadius),
      child: Center(
        child: BuildText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontWeight,
          textColor: textColor,
        ),
      ),
    );
  }
}

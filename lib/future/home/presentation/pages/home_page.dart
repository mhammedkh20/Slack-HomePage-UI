import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:slack_ui_homepage/core/components/my_text_field.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/list_channels_widget.dart';

import 'package:slack_ui_homepage/future/home/presentation/widgets/search_categories.dart';
import 'package:slack_ui_homepage/future/home/presentation/widgets/search_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> fontSizeStatemet;
  late Animation<double> fontSizeTitle;
  late Animation<double> sizeImages;
  late Animation<double> sizeIconSearch;
  late Animation<double> paddingRow;
  late Animation<double> opacityHeader;
  late Animation<Color?> colorHintSearch;
  late AnimationController animationController;
  late AnimationController animationBackground;
  late AnimationController animationShrinkHeader;
  late AnimationController animationDragDrop;

  late AnimationController animation;

  final ScrollController controller = ScrollController();
  double? offset;
  bool isScrollNotifier = false;

  int indexStatement = 0;
  bool isRefresh = true;
  List<String> statements = [
    "Such a beautiful day! 😊",
    "Feeling amazing today! ✨💖",
    "Pure joy, pure sunshine! 🌞💛",
    "Today feels magical! 🌈✨",
    "Smiles all day! 😍🎉",
    "Sunshine and happiness! ☀️😊",
    "Loving this perfect day! 💫💖",
  ];

  @override
  void initState() {
    animationBackground = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    animationShrinkHeader = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    animationDragDrop = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    fontSizeStatemet = Tween<double>(begin: 0, end: 18).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    fontSizeTitle = Tween<double>(begin: 22, end: 19).animate(
      CurvedAnimation(
        parent: animationShrinkHeader,
        curve: Curves.fastOutSlowIn,
      ),
    );

    sizeImages = Tween<double>(begin: 45, end: 40).animate(
      CurvedAnimation(
        parent: animationShrinkHeader,
        curve: Curves.fastOutSlowIn,
      ),
    );

    opacityHeader = Tween<double>(begin: 1, end: .5).animate(
      CurvedAnimation(
        parent: animationShrinkHeader,
        curve: Curves.fastOutSlowIn,
      ),
    );

    paddingRow = Tween<double>(begin: 2, end: 16).animate(
      CurvedAnimation(
        parent: animationShrinkHeader,
        curve: Curves.fastOutSlowIn,
      ),
    );

    sizeIconSearch = Tween<double>(begin: 28, end: 30).animate(
      CurvedAnimation(
        parent: animationShrinkHeader,
        curve: Curves.fastOutSlowIn,
      ),
    );

    colorHintSearch = ColorTween(
      begin: const Color(0xffdecae3),
      end: const Color(0xffFFFFFF),
    ).animate(
      CurvedAnimation(
        parent: animationShrinkHeader,
        curve: Curves.fastOutSlowIn,
      ),
    );
    controller.addListener(() {
      Future.delayed(Duration.zero, () {
        offset = controller.offset;
        isScrollNotifier =
            (controller.position.userScrollDirection == ScrollDirection.idle);
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2b032d),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: Platform.isAndroid ? 10 : 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: animationBackground,
              builder: (context, widget) {
                return Container(
                  height: getExtandHight(166, 1),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(.1),
                          const Color(0xff44134a),
                          const Color(0xff2e0d31),
                        ],
                        stops: [
                          animationBackground.value,
                          0,
                          1,
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getExtandHight(
                              MediaQuery.of(context).padding.top, .6),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: SizedBox(
                            height: hideTitlePage() ? 0 : null,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: paddingRow.value,
                                      ),
                                      height: sizeImages.value,
                                      width: sizeImages.value,
                                      clipBehavior: Clip.antiAlias,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        "assets/images/vice5.png",
                                        fit: BoxFit.cover,
                                        width: sizeImages.value,
                                        opacity: opacityHeader,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        "Help Fund Gaza",
                                        style: TextStyle(
                                            fontSize: fontSizeTitle.value,
                                            color: const Color(0xffffffff)
                                                .withOpacity(
                                                    opacityHeader.value),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: paddingRow.value),
                                      height: sizeImages.value,
                                      width: sizeImages.value,
                                      clipBehavior: Clip.antiAlias,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        opacity: opacityHeader,
                                        "assets/images/image.JPEG",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: getExtandHight(10, .1)),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color(0xff543258),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                                child: MyTextField(
                                  paddingVertical: 10,
                                  textHint: "Jump to or search ...",
                                  fontSize: 17,
                                  hintColor: colorHintSearch.value!,
                                  textColor:
                                      const Color.fromARGB(255, 250, 226, 255),
                                  onTap: () {
                                    setState(() {
                                      isCheckForShowSearchBar = true;
                                    });
                                  },
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(width: 10),
                                      Icon(
                                        Icons.search,
                                        size: sizeIconSearch.value,
                                        color: colorHintSearch.value,
                                      ),
                                      const SizedBox(width: 5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            AnimatedCrossFade(
                              secondChild: CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();

                                  setState(() {
                                    confirmShowSearchBar = false;
                                    isScrollNotifier = false;
                                    isCheckForShowSearchBar = false;
                                  });
                                },
                              ),
                              firstChild: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Color(0xff543258),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                ),
                                child: const Icon(
                                  Icons.filter_list,
                                  color: Color(0xffdecae3),
                                ),
                              ),
                              duration: const Duration(milliseconds: 250),
                              crossFadeState: isCheckForShowSearchBar
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                            )
                          ],
                        ),
                        AnimatedContainer(
                          height: isCheckForShowSearchBar ? 15 : 0,
                          duration: const Duration(milliseconds: 200),
                        ),
                        SearchCategories(
                            isCheckForShowSearchBar: isCheckForShowSearchBar)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: showStatment() ? 80 : 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, widget) {
                return Text(
                  statements[indexStatement],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSizeStatemet.value, color: Colors.white),
                );
              },
            ),
          ),
          AnimatedPositioned(
            top: getActualHeight(),
            bottom: 0,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              height: MediaQuery.of(context).size.height - 166,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Color(0xff534258),
                  ),
                ),
              ),
              child: isCheckForShowSearchBar
                  ? const SearchList()
                  : ListChannelsWidget(
                      controller: controller,
                      animationDragDrop: animationDragDrop,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  double getExtandHight(double height, double extend) {
    if (offset != null && offset! < 0) {
      return height + (extend * offset! * -1);
    } else {
      return height;
    }
  }

  bool hideTitlePage() {
    if (isCheckForShowSearchBar) {
      return true;
    } else {
      return offset != null && offset! > 50;
    }
  }

  void toAllowChangeStatements() {
    if (isRefresh) {
      indexStatement = indexStatement + 1;
      if (indexStatement == 4) {
        indexStatement = 0;
      }
      isRefresh = false;
    }
  }

  void showOpcity() {
    if (offset != null && offset! < -120) {
      animationBackground.forward();
      // print("object");
    }

    if (offset != null && offset! < -150) {
      animationBackground.reverse();
    }
  }

  bool isCheckForShowSearchBar = false;
  bool confirmShowSearchBar = false;
  Timer? timer;
  bool isHaptic = false;
  void shrinkHeader() {
    if (offset != null && offset! < -100 && offset! > -120) {
      animationShrinkHeader.forward();

      if (isHaptic) {
        HapticFeedback.heavyImpact();
        isHaptic = false;
      }

      timer = Timer(const Duration(milliseconds: 800), () {
        if (timer!.isActive) {
          confirmShowSearchBar = true;
        }
      });
    }
    if (isScrollNotifier) {
      timer?.cancel();
      isHaptic = false;
    }
    if (offset != null && offset! < -120) {
      animationShrinkHeader.reverse();
      confirmShowSearchBar = false;
      isHaptic = false;

      isCheckForShowSearchBar = false;
      timer?.cancel();
    }
    if (confirmShowSearchBar && isScrollNotifier) {
      isCheckForShowSearchBar = true;
      isHaptic = true;
    }
  }

  bool showStatment() {
    showOpcity();
    toAllowChangeStatements();
    shrinkHeader();

    if (offset != null && offset! == 0) {
      animationController.reset();
      animationBackground.reset();
      animationShrinkHeader.reset();
      isRefresh = true;
    }

    if (offset != null && offset! > -100) {
      animationBackground.reverse();
      animationShrinkHeader.reverse();
    }

    bool check = offset != null && offset! < -140;
    if (check) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    return check;
  }

  double getActualHeight() {
    if (offset != null && offset! > 50) {
      return getExtandHight(166, .7) - 50;
    }

    return getExtandHight(166, .7);
  }
}

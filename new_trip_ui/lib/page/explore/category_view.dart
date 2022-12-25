import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/models/explor_list_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class CategoryView extends StatefulWidget {
  final CategoryData categoryDetails;
  final int length;
  final int index;
  final VoidCallback? onTap;
  const CategoryView({
    Key? key,
    required this.categoryDetails,
    required this.length,
    required this.index,  this.onTap,
  }) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(
          (1 / widget.length) * widget.index,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    _animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform:
                  Matrix4.translationValues(100 * (1 - animation!.value), 0, 0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  onTap: widget.onTap,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        child: Image.asset(
                          widget.categoryDetails.imageName,
                          height: 150,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppTheme.whiteTextColor.withOpacity(0.6),
                                      AppTheme.whiteTextColor.withOpacity(0.6),
                                      AppTheme.whiteTextColor.withOpacity(0.4),
                                      AppTheme.whiteTextColor.withOpacity(0.2),
                                      AppTheme.whiteTextColor.withOpacity(0.0),
                                      AppTheme.whiteTextColor.withOpacity(0.0),
                                      AppTheme.whiteTextColor.withOpacity(0.0),
                                      AppTheme.whiteTextColor.withOpacity(0.0),
                                    ],
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 24,),
                              child: Text(
                                widget.categoryDetails.title,
                                style: TextStyles(context)
                                    .getMediumStyle()
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

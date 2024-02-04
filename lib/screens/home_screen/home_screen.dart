import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/dashboard_screen/widgets/dashboard_appbar.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/banner_card.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tiles_gridview.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_type.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/search_field.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
        setState(() {});
      },
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              collapsedHeight: 130,
              expandedHeight: _focusNode.hasFocus ||
                      MyProvider().searchController.text.isNotEmpty
                  ? 50
                  : 350,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchField(
                      focusNode: _focusNode,
                      hintText: "Search coffee",
                      onTap: () => setState(() {}),
                    ),
                    const SizedBox(height: 40, child: CoffeeType()).padYY(12),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                collapseMode: CollapseMode.pin,
                expandedTitleScale: 1,
                background: _focusNode.hasFocus ||
                        MyProvider().searchController.text.isNotEmpty
                    ? const SizedBox.shrink()
                    : Stack(
                        children: [
                          const SizedBox(height: 180, child: DashboardAppbar()),
                          const BannerCard().padYTop(110),
                        ],
                      ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CoffeeTileGridview(),
            ),
          ],
        ),
      ),
    );
  }
}

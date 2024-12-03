import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/articles_item_widget/articles_item_widget.dart';
import 'package:news_app/presentation/screens/home/drawer/tabs/category_tab/category_details/tab_bar_widget/source_tab_item/source_tab_item.dart';

class SourcesTabWidget extends StatefulWidget {
   SourcesTabWidget({super.key , required this.sources});
  List<Source> sources;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
               onTap: (value) {
                 selectedIndex = value;
                 setState(() {

                 });
               },
              isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: widget.sources.map((e) => SourceTabItem(source: e, isSelected: widget.sources.indexOf(e) == selectedIndex  ?  true : false,) ,).toList()
            )
        ),
        ArticlesItemWidget(sources: widget.sources[selectedIndex])
      ],
    );
  }
}

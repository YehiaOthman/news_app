import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manger.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import '../../../../../../../../../config/styles/light_app_styles.dart';

class ArticlesDetails extends StatelessWidget {
  const ArticlesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var argus = ModalRoute.of(context)?.settings.arguments as Article;
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(AssetsManger.splashPattern))),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 35,
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size(412.w, 15.h), child: Container()),
          title: Text(
            'Articles Details',
            style: LightAppStyles.titles,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: argus.url ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(argus.urlToImage ?? ''),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                argus.source?.name ?? '',
                style: LightAppStyles.sourceName,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                argus.description ?? '',
                style: LightAppStyles.description,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    argus.publishedAt ?? '',
                    style: LightAppStyles.publishedAt,
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                argus.content ?? '',
                style: LightAppStyles.content,
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  TextButton.icon(
                      onPressed: () {
                        // urlLauncher(argus.url ?? '');
                      },
                      label: Row(
                        children: [
                          Text(
                            'View Full Article',
                            style: LightAppStyles.description,
                          ),
                          const Icon(
                            Icons.arrow_right_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  // Future<void> urlLauncher(String url)async{
  //   Uri urll = Uri.parse(url);
  //   await LuncherUrl(urll);
  // }
}

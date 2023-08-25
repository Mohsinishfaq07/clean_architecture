import 'package:sb_myreports/core/router/models/page_keys.dart';
import 'package:sb_myreports/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(
      key: PageKeys.splashPageKey,
      path: PagePaths.splashPagePath,
      uiPage: Pages.splashPage);
  static PageConfiguration  jokeScreenPageConfig = const PageConfiguration(
      key: PageKeys. jokeScreenPageKey,
      path: PagePaths. jokeScreenPagePath,
      uiPage: Pages. jokeScreenPage);
}

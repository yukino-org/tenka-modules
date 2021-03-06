import 'package:tenka/tenka.dart';
import 'package:tenka_dev_tools/tenka_dev_tools.dart';
import 'package:utilx/locale.dart';
import '../../../tools/utils.dart';

const Locale locale = Locale(LanguageCodes.en);
final TenkaLocalFileDS source = Utils.getAnimeDS('tenshi_moe');
final MockedAnimeExtractor mocked = MockedAnimeExtractor(
  search: (final AnimeExtractor ext) => ext.search(
    'mayo chiki',
    locale,
  ),
  getInfo: (final AnimeExtractor ext) => ext.getInfo(
    'https://tenshi.moe/anime/1kwzf88a',
    locale,
  ),
  getSources: (final AnimeExtractor ext) => ext.getSources(
    'https://tenshi.moe/anime/1kwzf88a/1',
    locale,
  ),
);

Future<void> main() async {
  await Procedure.run(() => mocked.run(source));
}

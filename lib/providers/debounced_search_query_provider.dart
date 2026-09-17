import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_search/providers/search_query_provider.dart';

part 'debounced_search_query_provider.g.dart';

@riverpod
Stream<String> debouncedSearchQuery(Ref ref) {
  final controller = StreamController<String>();
  Timer? timer;

  controller.add('');

  ref.listen(searchQueryProvider, (previous, next) {
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 300), () {
      controller.add(next);
    });
  });

  ref.onDispose(() {
    timer?.cancel();
    controller.close();
  });

  return controller.stream;
}

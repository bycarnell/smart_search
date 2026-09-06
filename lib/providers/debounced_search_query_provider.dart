import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_search/providers/search_query_provider.dart';

final debouncedSearchQueryProvider = StreamProvider<String>((ref) {
  final controller = StreamController<String>();
  Timer? timer;

  ref.listen(searchQueryProvider, (previous, next) {
    // annule le timer précédent s'il existe 
    // relance un Timer de 300ms qui fait controller.add(next) à la fin
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 300), () {
      controller.add(next);
    });
  });

  ref.onDispose(() {
    // annule le timer, ferme le controller 
    timer?.cancel();
    controller.close();
  });

  return controller.stream;
});

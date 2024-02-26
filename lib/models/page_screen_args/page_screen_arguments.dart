import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_screen_arguments.freezed.dart';

@freezed
class PageScreenArguments with _$PageScreenArguments {
  const factory PageScreenArguments({
    String? categoryName,
    int? categoryId,
  }) = _PageScreenArguments;
}

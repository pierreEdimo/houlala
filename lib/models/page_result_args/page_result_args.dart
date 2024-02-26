import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_result_args.freezed.dart';

@freezed
class PageResultArgs with _$PageResultArgs {
  const factory PageResultArgs({
    String? locationName,
    String? keyWord,
  }) = _PageResultArgs;
}

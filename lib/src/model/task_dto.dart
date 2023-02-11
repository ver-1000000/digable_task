import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';

@freezed
class TaskDto with _$TaskDto {
  const factory TaskDto({
    required int id,
    required int? parentId,
    required String value,
    required bool completed,
    required int order,
  }) = _TaskDto;
}

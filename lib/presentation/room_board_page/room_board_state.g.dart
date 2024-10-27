// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_board_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomBoardStateImpl _$$RoomBoardStateImplFromJson(Map<String, dynamic> json) =>
    _$RoomBoardStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      isReplyLoading: json['isReplyLoading'] as bool? ?? false,
      mutableProgress: (json['mutableProgress'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as bool).toList()),
          ) ??
          const {},
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      replies: (json['replies'] as List<dynamic>?)
              ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RoomBoardStateImplToJson(
        _$RoomBoardStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isReplyLoading': instance.isReplyLoading,
      'mutableProgress': instance.mutableProgress,
      'comments': instance.comments,
      'replies': instance.replies,
    };

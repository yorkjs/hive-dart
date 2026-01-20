import 'package:json_annotation/json_annotation.dart';
part 'type.g.dart';

@JsonSerializable()
class INode {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  INode({
    required this.id,
    required this.name,
  });

  factory INode.fromJson(Map<String, dynamic> json) =>
      _$INodeFromJson(json);

  Map<String, dynamic> toJson() => _$INodeToJson(this);
}

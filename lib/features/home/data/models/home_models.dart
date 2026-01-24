import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class HomeFilter {
  final PostType type;
  final String location;
  final String sort;
  final bool hasBounty;

  const HomeFilter({
    this.type = PostType.all,
    this.location = '',
    this.sort = 'Most Recent',
    this.hasBounty = false,
  });

  HomeFilter copyWith({
    PostType? type,
    String? location,
    String? sort,
    bool? hasBounty,
  }) {
    return HomeFilter(
      type: type ?? this.type,
      location: location ?? this.location,
      sort: sort ?? this.sort,
      hasBounty: hasBounty ?? this.hasBounty,
    );
  }
}

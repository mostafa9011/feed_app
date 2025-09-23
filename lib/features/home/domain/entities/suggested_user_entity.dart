class SuggestedUserEntity {
  final int id;
  final String name;
  final String username;
  final String image;

  SuggestedUserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.image,
  });

  // dummy data
  factory SuggestedUserEntity.dummy() => SuggestedUserEntity(
        id: 1,
        name: "Mostafa Mohamed",
        username: "mostafa9011",
        image: "https://i.pravatar.cc/300",
      );
}

class ReviewAccountModel {
  final String name;
  final String socialMediaHandle;
  final String socialMediaType;
  final String id;
  final int followers;
  final int following;
  final int posts;
  final String imageUrl;

  ReviewAccountModel({
    required this.name,
    required this.socialMediaHandle,
    required this.socialMediaType,
    required this.id,
    required this.followers,
    required this.following,
    required this.posts,
    required this.imageUrl,
  });

  // Factory constructor to create a ReviewAccount from a JSON map.
  factory ReviewAccountModel.fromJson(Map<String, dynamic> json) {
    return ReviewAccountModel(
      name: json['name'] as String,
      socialMediaHandle: json['socialMediaHandle'] as String,
      socialMediaType: json['socialMediaType'] as String,
      id: json['id'] as String,
      followers: json['followers'] as int,
      following: json['following'] as int,
      posts: json['posts'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }

  // Method to convert a ReviewAccount instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'socialMediaHandle': socialMediaHandle,
      'socialMediaType': socialMediaType,
      'id': id,
      'followers': followers,
      'following': following,
      'posts': posts,
      'imageUrl': imageUrl,
    };
  }
}

class NearestCity {
  final String? partnerPromoText;
  final String? name;
  final String? parentId;
  final String? slug;
  final String? id;
  final String? partnerPromoPhoto;

  NearestCity(
      {this.id,
      this.name,
      this.parentId,
      this.partnerPromoPhoto,
      this.partnerPromoText,
      this.slug});

  factory NearestCity.fromJson(Map<String, dynamic> json) => NearestCity(
      id: json['id'],
      name: json['name'],
      parentId: json['parent_id'],
      partnerPromoPhoto: json['partner_promo_photo'],
      partnerPromoText: json['partner_promo_text'],
      slug: json['slug']);
}

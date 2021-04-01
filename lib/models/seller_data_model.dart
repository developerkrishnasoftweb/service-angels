class SellerData {
  SellerInfo sellerInfo;
  List<SellerReview> sellerReviews;
  List<SellerGallery> sellerGallery;

  SellerData.fromJson(Map<String, dynamic> json) {
    sellerInfo = SellerInfo.fromJson(json['SellerInfo']);
    if (json['reviews'] != null) {
      sellerReviews = <SellerReview>[];
      json['reviews'].forEach((v) {
        sellerReviews.add(new SellerReview.fromJson(v));
      });
    }
    if(json['gallery'] != null) {
      sellerGallery = <SellerGallery>[];
      json['gallery'].forEach((v) {
        sellerGallery.add(SellerGallery.fromJson(v));
      });
    }
  }
}

class SellerInfo {
  String sellerId,
      sellerUserName,
      title,
      firstname,
      sellerEmail,
      sellerImage,
      sellerHeadline,
      sellerAbout,
      sellerLanguage,
      sellerRating,
      sellerMobile,
      profilePhoto,
      experience,
      languageKnown,
      description,
      sellerExperience,
      sellerExpertise,
      isOnline,
      sellerGrade,
      sellerFollowers,
      tagline,
      sellerAudio,
      sellerVideo;

  SellerInfo(
      {this.sellerId,
      this.sellerUserName,
      this.title,
      this.firstname,
      this.sellerEmail,
      this.sellerImage,
      this.sellerHeadline,
      this.sellerAbout,
      this.sellerLanguage,
      this.sellerRating,
      this.sellerMobile,
      this.profilePhoto,
      this.experience,
      this.languageKnown,
      this.description,
      this.sellerExperience,
      this.sellerExpertise,
      this.isOnline,
      this.sellerGrade,
      this.sellerFollowers,
      this.tagline,
      this.sellerAudio,
      this.sellerVideo});

  SellerInfo.fromJson(Map<String, dynamic> json) {
    sellerId = json['seller_id']?.toString();
    sellerUserName = json['seller_user_name']?.toString();
    title = json['title']?.toString();
    firstname = json['firstname']?.toString();
    sellerEmail = json['seller_email']?.toString();
    sellerImage = json['seller_image']?.toString();
    sellerHeadline = json['seller_headline']?.toString();
    sellerAbout = json['seller_about']?.toString();
    sellerLanguage = json['seller_language']?.toString();
    sellerRating = json['seller_rating']?.toString();
    sellerMobile = json['seller_mobile']?.toString();
    profilePhoto = json['profile_photo']?.toString();
    experience = json['experience']?.toString();
    languageKnown = json['language_known']?.toString();
    description = json['description']?.toString();
    sellerExperience = json['seller_experience']?.toString();
    sellerExpertise = json['seller_expertise']?.toString();
    isOnline = json['isOnline']?.toString();
    sellerGrade = json['seller_grade']?.toString();
    sellerFollowers = json['seller_followers']?.toString();
    tagline = json['tagline']?.toString();
    sellerAudio = json['seller_audio']?.toString();
    sellerVideo = json['seller_video']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_id'] = this.sellerId;
    data['seller_user_name'] = this.sellerUserName;
    data['title'] = this.title;
    data['firstname'] = this.firstname;
    data['seller_email'] = this.sellerEmail;
    data['seller_image'] = this.sellerImage;
    data['seller_headline'] = this.sellerHeadline;
    data['seller_about'] = this.sellerAbout;
    data['seller_language'] = this.sellerLanguage;
    data['seller_rating'] = this.sellerRating;
    data['seller_mobile'] = this.sellerMobile;
    data['profile_photo'] = this.profilePhoto;
    data['experience'] = this.experience;
    data['language_known'] = this.languageKnown;
    data['description'] = this.description;
    data['seller_experience'] = this.sellerExperience;
    data['seller_expertise'] = this.sellerExpertise;
    data['isOnline'] = this.isOnline;
    data['seller_grade'] = this.sellerGrade;
    data['seller_followers'] = this.sellerFollowers;
    data['tagline'] = this.tagline;
    data['seller_audio'] = this.sellerAudio;
    data['seller_video'] = this.sellerVideo;
    return data;
  }
}

class SellerReview {
  String userid, ratings, comments, timestamp, days;

  SellerReview(
      {this.userid, this.ratings, this.comments, this.timestamp, this.days});

  SellerReview.fromJson(Map<String, dynamic> json) {
    userid = json['userid']?.toString();
    ratings = json['ratings']?.toString();
    comments = json['comments']?.toString();
    timestamp = json['timestamp']?.toString();
    days = json['days']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['ratings'] = this.ratings;
    data['comments'] = this.comments;
    data['timestamp'] = this.timestamp;
    data['days'] = this.days;
    return data;
  }
}

class SellerGallery {
  String id, imageUrl;
  SellerGallery({this.id, this.imageUrl});
  SellerGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageURL'];
  }
}
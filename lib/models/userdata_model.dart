class Userdata {
  String sellerId,
      referenceUserid,
      sellerName,
      sellerUserName,
      sellerEmail,
      sellerWallet,
      sellerPayouts,
      sellerPaypalEmail,
      sellerPayoneerEmail,
      sellerMAccountNumber,
      sellerMAccountName,
      sellerImage,
      sellerCoverImage,
      sellerImageS3,
      sellerCoverImageS3,
      sellerCountry,
      sellerCity,
      sellerHeadline,
      sellerAbout,
      sellerLevel,
      sellerLanguage,
      sellerRecentDelivery,
      sellerRating,
      sellerOffers,
      sellerReferral,
      sellerIp,
      sellerVerification,
      sellerVacation,
      sellerVacationReason,
      sellerVacationMessage,
      sellerRegisterDate,
      enableSound,
      enableNotifications,
      sellerActivity,
      sellerTimezone,
      sellerStatus,
      mobileVerified,
      sellerMobile,
      sellerPincode,
      isKycApproved,
      profilePhoto,
      panCard,
      adhar,
      shopEstablisment,
      msmeDoc,
      userLike,
      usertype,
      telephoneService,
      category,
      subcategory,
      experience,
      languageKnown,
      degree,
      expertise,
      tagline,
      remarks,
      description,
      title,
      firstname,
      lastname,
      platformCommision,
      isOnline,
      apiKey,
      sellerGrade,
      sellerFollowers,
      sellerAudio,
      sellerVideo,
      terms,
      registrationFlag;

  Userdata(
      {this.sellerId,
      this.referenceUserid,
      this.sellerName,
      this.sellerUserName,
      this.sellerEmail,
      this.sellerWallet,
      this.sellerPayouts,
      this.sellerPaypalEmail,
      this.sellerPayoneerEmail,
      this.sellerMAccountNumber,
      this.sellerMAccountName,
      this.sellerImage,
      this.sellerCoverImage,
      this.sellerImageS3,
      this.sellerCoverImageS3,
      this.sellerCountry,
      this.sellerCity,
      this.sellerHeadline,
      this.sellerAbout,
      this.sellerLevel,
      this.sellerLanguage,
      this.sellerRecentDelivery,
      this.sellerRating,
      this.sellerOffers,
      this.sellerReferral,
      this.sellerIp,
      this.sellerVerification,
      this.sellerVacation,
      this.sellerVacationReason,
      this.sellerVacationMessage,
      this.sellerRegisterDate,
      this.enableSound,
      this.enableNotifications,
      this.sellerActivity,
      this.sellerTimezone,
      this.sellerStatus,
      this.mobileVerified,
      this.sellerMobile,
      this.sellerPincode,
      this.isKycApproved,
      this.profilePhoto,
      this.panCard,
      this.adhar,
      this.shopEstablisment,
      this.msmeDoc,
      this.userLike,
      this.usertype,
      this.telephoneService,
      this.category,
      this.subcategory,
      this.experience,
      this.languageKnown,
      this.degree,
      this.expertise,
      this.tagline,
      this.remarks,
      this.description,
      this.title,
      this.firstname,
      this.lastname,
      this.platformCommision,
      this.isOnline,
      this.apiKey,
      this.sellerGrade,
      this.sellerFollowers,
      this.sellerAudio,
      this.sellerVideo,
      this.terms,
      this.registrationFlag});

  Userdata.fromJson(Map<String, dynamic> json) {
    sellerId = json['seller_id'].toString();
    referenceUserid = json['reference_userid'].toString();
    sellerName = json['seller_name'].toString();
    sellerUserName = json['seller_user_name'].toString();
    sellerEmail = json['seller_email'].toString();
    sellerWallet = json['seller_wallet'].toString();
    sellerPayouts = json['seller_payouts'].toString();
    sellerPaypalEmail = json['seller_paypal_email'].toString();
    sellerPayoneerEmail = json['seller_payoneer_email'].toString();
    sellerMAccountNumber = json['seller_m_account_number'].toString();
    sellerMAccountName = json['seller_m_account_name'].toString();
    sellerImage = json['seller_image'].toString();
    sellerCoverImage = json['seller_cover_image'].toString();
    sellerImageS3 = json['seller_image_s3'].toString();
    sellerCoverImageS3 = json['seller_cover_image_s3'].toString();
    sellerCountry = json['seller_country'].toString();
    sellerCity = json['seller_city'].toString();
    sellerHeadline = json['seller_headline'].toString();
    sellerAbout = json['seller_about'].toString();
    sellerLevel = json['seller_level'].toString();
    sellerLanguage = json['seller_language'].toString();
    sellerRecentDelivery = json['seller_recent_delivery'].toString();
    sellerRating = json['seller_rating'].toString();
    sellerOffers = json['seller_offers'].toString();
    sellerReferral = json['seller_referral'].toString();
    sellerIp = json['seller_ip'].toString();
    sellerVerification = json['seller_verification'].toString();
    sellerVacation = json['seller_vacation'].toString();
    sellerVacationReason = json['seller_vacation_reason'].toString();
    sellerVacationMessage = json['seller_vacation_message'].toString();
    sellerRegisterDate = json['seller_register_date'].toString();
    enableSound = json['enable_sound'].toString();
    enableNotifications = json['enable_notifications'].toString();
    sellerActivity = json['seller_activity'].toString();
    sellerTimezone = json['seller_timezone'].toString();
    sellerStatus = json['seller_status'].toString();
    mobileVerified = json['mobile_verified'].toString();
    sellerMobile = json['seller_mobile'].toString();
    sellerPincode = json['seller_pincode'].toString();
    isKycApproved = json['isKycApproved'].toString();
    profilePhoto = json['profile_photo'].toString();
    panCard = json['panCard'].toString();
    adhar = json['adhar'].toString();
    shopEstablisment = json['shopEstablisment'].toString();
    msmeDoc = json['msmeDoc'].toString();
    userLike = json['userLike'].toString();
    usertype = json['usertype'].toString();
    telephoneService = json['telephone_service'].toString();
    category = json['category'].toString();
    subcategory = json['subcategory'].toString();
    experience = json['experience'].toString();
    languageKnown = json['language_known'].toString();
    degree = json['degree'].toString();
    expertise = json['expertise'].toString();
    tagline = json['tagline'].toString();
    remarks = json['remarks'].toString();
    description = json['description'].toString();
    title = json['title'].toString();
    firstname = json['firstname'].toString();
    lastname = json['lastname'].toString();
    platformCommision = json['platform_commision'].toString();
    isOnline = json['isOnline'].toString();
    apiKey = json['apiKey'].toString();
    sellerGrade = json['seller_grade'].toString();
    sellerFollowers = json['seller_followers'].toString();
    sellerAudio = json['seller_audio'].toString();
    sellerVideo = json['seller_video'].toString();
    terms = json['terms'].toString();
    registrationFlag = json['registrationFlag'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_id'] = this.sellerId;
    data['reference_userid'] = this.referenceUserid;
    data['seller_name'] = this.sellerName;
    data['seller_user_name'] = this.sellerUserName;
    data['seller_email'] = this.sellerEmail;
    data['seller_wallet'] = this.sellerWallet;
    data['seller_payouts'] = this.sellerPayouts;
    data['seller_paypal_email'] = this.sellerPaypalEmail;
    data['seller_payoneer_email'] = this.sellerPayoneerEmail;
    data['seller_m_account_number'] = this.sellerMAccountNumber;
    data['seller_m_account_name'] = this.sellerMAccountName;
    data['seller_image'] = this.sellerImage;
    data['seller_cover_image'] = this.sellerCoverImage;
    data['seller_image_s3'] = this.sellerImageS3;
    data['seller_cover_image_s3'] = this.sellerCoverImageS3;
    data['seller_country'] = this.sellerCountry;
    data['seller_city'] = this.sellerCity;
    data['seller_headline'] = this.sellerHeadline;
    data['seller_about'] = this.sellerAbout;
    data['seller_level'] = this.sellerLevel;
    data['seller_language'] = this.sellerLanguage;
    data['seller_recent_delivery'] = this.sellerRecentDelivery;
    data['seller_rating'] = this.sellerRating;
    data['seller_offers'] = this.sellerOffers;
    data['seller_referral'] = this.sellerReferral;
    data['seller_ip'] = this.sellerIp;
    data['seller_verification'] = this.sellerVerification;
    data['seller_vacation'] = this.sellerVacation;
    data['seller_vacation_reason'] = this.sellerVacationReason;
    data['seller_vacation_message'] = this.sellerVacationMessage;
    data['seller_register_date'] = this.sellerRegisterDate;
    data['enable_sound'] = this.enableSound;
    data['enable_notifications'] = this.enableNotifications;
    data['seller_activity'] = this.sellerActivity;
    data['seller_timezone'] = this.sellerTimezone;
    data['seller_status'] = this.sellerStatus;
    data['mobile_verified'] = this.mobileVerified;
    data['seller_mobile'] = this.sellerMobile;
    data['seller_pincode'] = this.sellerPincode;
    data['isKycApproved'] = this.isKycApproved;
    data['profile_photo'] = this.profilePhoto;
    data['panCard'] = this.panCard;
    data['adhar'] = this.adhar;
    data['shopEstablisment'] = this.shopEstablisment;
    data['msmeDoc'] = this.msmeDoc;
    data['userLike'] = this.userLike;
    data['usertype'] = this.usertype;
    data['telephone_service'] = this.telephoneService;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['experience'] = this.experience;
    data['language_known'] = this.languageKnown;
    data['degree'] = this.degree;
    data['expertise'] = this.expertise;
    data['tagline'] = this.tagline;
    data['remarks'] = this.remarks;
    data['description'] = this.description;
    data['title'] = this.title;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['platform_commision'] = this.platformCommision;
    data['isOnline'] = this.isOnline;
    data['apiKey'] = this.apiKey;
    data['seller_grade'] = this.sellerGrade;
    data['seller_followers'] = this.sellerFollowers;
    data['seller_audio'] = this.sellerAudio;
    data['seller_video'] = this.sellerVideo;
    data['terms'] = this.terms;
    data['registrationFlag'] = this.registrationFlag;
    return data;
  }
}

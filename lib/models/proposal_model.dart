class Proposal {
  String proposalId,
      proposalTitle,
      proposalPrice,
      proposalSellerId,
      sellerTitle,
      sellerUserName,
      sellerRating,
      sellerImage,
      languageKnown,
      experience,
      isOnline,
      usertype,
      telephoneService,
      clientUserName;

  Proposal(
      {this.proposalId,
      this.proposalTitle,
      this.proposalPrice,
      this.proposalSellerId,
      this.sellerTitle,
      this.sellerUserName,
      this.sellerRating,
      this.sellerImage,
      this.languageKnown,
      this.experience,
      this.isOnline,
      this.usertype,
      this.telephoneService,
      this.clientUserName});

  Proposal.fromJson(Map<String, dynamic> json) {
    proposalId = json['proposal_id']?.toString();
    proposalTitle = json['proposal_title']?.toString();
    proposalPrice = json['proposal_price']?.toString();
    proposalSellerId = json['proposal_seller_id']?.toString();
    sellerTitle = json['seller_title']?.toString();
    sellerUserName = json['seller_user_name']?.toString();
    sellerRating = json['seller_rating']?.toString();
    sellerImage = json['seller_image']?.toString();
    languageKnown = json['language_known']?.toString();
    experience = json['experience']?.toString();
    isOnline = json['isOnline']?.toString();
    usertype = json['usertype']?.toString();
    telephoneService = json['telephone_service']?.toString();
    clientUserName = json['client_user_name']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proposal_id'] = this.proposalId;
    data['proposal_title'] = this.proposalTitle;
    data['proposal_price'] = this.proposalPrice;
    data['proposal_seller_id'] = this.proposalSellerId;
    data['seller_title'] = this.sellerTitle;
    data['seller_user_name'] = this.sellerUserName;
    data['seller_rating'] = this.sellerRating;
    data['seller_image'] = this.sellerImage;
    data['language_known'] = this.languageKnown;
    data['experience'] = this.experience;
    data['isOnline'] = this.isOnline;
    data['usertype'] = this.usertype;
    data['telephone_service'] = this.telephoneService;
    data['client_user_name'] = this.clientUserName;
    return data;
  }
}

class Card {
  int id = 0;
  String name = '';
  int active = 0;
  int cardNumber = 0;
  String cardFlag = '';
  int securityNumber = 0;
  String dateCardExpiration = '';

  Card(
      { this.id = 0,
         this.name = '',
         this.active = 0,
         this.cardNumber = 0,
         this.cardFlag = '',
         this.securityNumber = 0,
         this.dateCardExpiration = ''});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    cardNumber = json['cardNumber'];
    cardFlag = json['cardFlag'];
    securityNumber = json['securityNumber'];
    dateCardExpiration = json['dateCardExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['active'] = active;
    data['cardNumber'] = cardNumber;
    data['cardFlag'] = cardFlag;
    data['securityNumber'] = securityNumber;
    data['dateCardExpiration'] = dateCardExpiration;
    return data;
  }

  Map<String, dynamic> toSqlite() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['active'] = active;
    data['cardNumber'] = cardNumber;
    data['cardFlag'] = cardFlag;
    data['securityNumber'] = securityNumber;
    data['dateCardExpiration'] = dateCardExpiration;
    return data;
  }

  @override
  String toString() {
    return "id = $id, name = $name, active = $active, cardNumber = $cardNumber, cardFlag = $cardFlag, securityNumber = $securityNumber, dateCardExpiration = $dateCardExpiration";
  }
}
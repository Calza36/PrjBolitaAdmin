class PlayerAbstractEntity {
  String idPlayer;
  String idRegla;
  String namePlayer;
  String nameRegla;
  String estado;
  String typeOfUser;
  String personalRule;

  bool? manageRulesPermit;
  bool? assingRulePermit;
  bool? manageGeneralCollectorsPermit;
  bool? manageCollectorsPermit;
  bool? manageFootCollectorsPermit;

  PlayerAbstractEntity(
    this.idPlayer,
    this.idRegla,
    this.namePlayer,
    this.nameRegla,
    this.estado,
    this.typeOfUser,
    this.personalRule, {
    this.manageRulesPermit,
    this.assingRulePermit,
    this.manageGeneralCollectorsPermit,
    this.manageCollectorsPermit,
    this.manageFootCollectorsPermit,
  });
}

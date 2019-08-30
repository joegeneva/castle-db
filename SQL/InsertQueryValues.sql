INSERT INTO `castle`.`skill` (`idSkill`, `Name`) VALUES ('1', 'Sword');
INSERT INTO `castle`.`skill` (`idSkill`, `Name`) VALUES ('2', 'Bow');
INSERT INTO `castle`.`skill` (`idSkill`, `Name`) VALUES ('3', 'Horse');
INSERT INTO `castle`.`skill` (`idSkill`, `Name`) VALUES ('4', 'Spear');

INSERT INTO `castle`.`person` (`Name`, `Age`) VALUES ('Tom', '17');
INSERT INTO `castle`.`person` (`Name`, `Age`) VALUES ('Bob', '28');

INSERT INTO `castle`.`skill_level` (`Skill`, `Person`, `Level`, `HoursToNext`) VALUES ('1', '1', '3', '3');
INSERT INTO `castle`.`skill_level` (`Skill`, `Person`, `Level`, `HoursToNext`) VALUES ('2', '1', '5', '2');

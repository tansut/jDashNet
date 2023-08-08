

SET FOREIGN_KEY_CHECKS = 0;



CREATE TABLE 

`DashletModule` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(255) CHARACTER SET utf8 

COLLATE utf8_general_ci NOT NULL,
  `title` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config` 

LONGTEXT NOT NULL,
  `paneConfig` LONGTEXT NOT NULL,
  `dashletConfig` LONGTEXT NOT NULL,
  `style` LONGTEXT NULL,
  `cls` 

LONGTEXT NULL,
  `attr` LONGTEXT NULL,
  `description` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  

`createdBy` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modifiedBy` VARCHAR(150) CHARACTER SET 

utf8 COLLATE utf8_general_ci NULL,
  `sharedBy` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created` 

DATETIME NOT NULL,
  `modified` DATETIME NULL,
  `shared` DATETIME NULL,
  `groupName` VARCHAR(150) CHARACTER SET utf8 

COLLATE utf8_general_ci NULL,
  `userData` LONGTEXT NULL,
  `viewOrder` INT(10) NULL,
  `groupOrder` INT(10) NULL,
  

`UserProperty1` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `UserProperty2` VARCHAR(250) CHARACTER SET 

utf8 COLLATE utf8_general_ci NULL,
  `UserProperty3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY 

KEY (`id`),
  INDEX `IX_DashletModule` (`UserProperty1`),
  INDEX `IX_DashletModule_1` (`UserProperty2`),
  INDEX 

`IX_DashletModule_2` (`UserProperty3`)
)
ENGINE = INNODB;

CREATE TABLE 

`EntityAuth` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `entityType` VARCHAR(50) CHARACTER SET utf8 

COLLATE utf8_general_ci NOT NULL,
  `entityId` INT(10) NOT NULL,
  `roleOrUser` VARCHAR(50) CHARACTER SET utf8 COLLATE 

utf8_general_ci NOT NULL,
  `permission` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authType` 

VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IX_EntityAuth` 

(`entityType`, `entityId`, `roleOrUser`, `authType`, `permission`)
)
ENGINE = INNODB;


CREATE TABLE `Tag` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `tagName` 

VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE = INNODB;


CREATE TABLE `TagRelation` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  

`tagId` INT(10) NOT NULL,
  `controlId` INT(10) NOT NULL,
  `controller` VARCHAR(15) CHARACTER SET utf8 COLLATE 

utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_TagRelation_Dashboard` FOREIGN KEY 

`FK_TagRelation_Dashboard` (`controlId`)
    REFERENCES `Dashboard` (`id`)
    ON DELETE NO ACTION
    ON 

UPDATE NO ACTION,
  CONSTRAINT `FK_TagRelation_DashletModule` FOREIGN KEY `FK_TagRelation_DashletModule` (`controlId`)
    

REFERENCES `DashletModule` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 

`FK_TagRelation_Dashlets` FOREIGN KEY `FK_TagRelation_Dashlets` (`controlId`)
    REFERENCES `Dashlet` 

(`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TagRelation_Tags` FOREIGN KEY `FK_TagRelation_Tags` 

(`tagId`)
    REFERENCES `Tag` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE `Dashboard` (
  `id` INT(10) NOT NULL 

AUTO_INCREMENT,
  `title` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `layout` LONGTEXT NOT NULL,
  

`config` LONGTEXT NULL,
  `paneConfig` LONGTEXT NULL,
  `style` LONGTEXT NULL,
  `cls` LONGTEXT NULL,
  `attr` LONGTEXT NULL,
  

`groupName` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` VARCHAR(255) CHARACTER SET utf8 

COLLATE utf8_general_ci NULL,
  `createdBy` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modifiedBy` 

VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sharedBy` VARCHAR(150) CHARACTER SET utf8 COLLATE 

utf8_general_ci NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NULL,
  `shared` DATETIME NULL,
  `userData` 

LONGTEXT NULL,
  `viewOrder` INT(10) NULL,
  `groupOrder` INT(10) NULL,
  `UserProperty1` VARCHAR(250) CHARACTER SET utf8 

COLLATE utf8_general_ci NULL,
  `UserProperty2` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  

`UserProperty3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`),
  INDEX `IX_Dashboard` 

(`UserProperty1`),
  INDEX `IX_Dashboard_1` (`UserProperty2`),
  INDEX `IX_Dashboard_2` (`UserProperty3`)
)
ENGINE = INNODB;


CREATE TABLE `Dashlet` (
  `id` INT(10) NOT NULL 

AUTO_INCREMENT,
  `dashboardId` INT(10) NOT NULL,
  `dashletModuleId` INT(10) NOT NULL,
  `title` VARCHAR(255) CHARACTER SET 

utf8 COLLATE utf8_general_ci NULL,
  `config` LONGTEXT NULL,
  `paneConfig` LONGTEXT NULL,
  `position` LONGTEXT NOT NULL,
  

`style` LONGTEXT NULL,
  `cls` LONGTEXT NULL,
  `attr` LONGTEXT NULL,
  `groupName` VARCHAR(150) CHARACTER SET utf8 COLLATE 

utf8_general_ci NULL,
  `description` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdBy` VARCHAR

(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modifiedBy` VARCHAR(150) CHARACTER SET utf8 COLLATE 

utf8_general_ci NULL,
  `sharedBy` VARCHAR(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created` DATETIME NOT 

NULL,
  `modified` DATETIME NULL,
  `shared` DATETIME NULL,
  `userData` LONGTEXT NULL,
  `UserProperty1` VARCHAR(250) 

CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `UserProperty2` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci 

NULL,
  `UserProperty3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`),
  INDEX 

`IX_Dashlet` (`UserProperty1`),
  INDEX `IX_Dashlet_1` (`UserProperty2`),
  INDEX `IX_Dashlet_2` (`UserProperty3`),
  

CONSTRAINT `FK_Dashlets_Dashboard` FOREIGN KEY `FK_Dashlets_Dashboard` (`dashboardId`)
    REFERENCES 

`Dashboard` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Dashlets_DashletModules` 

FOREIGN KEY `FK_Dashlets_DashletModules` (`dashletModuleId`)
    REFERENCES `DashletModule` (`id`)
    

ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = INNODB;



SET FOREIGN_KEY_CHECKS = 1;


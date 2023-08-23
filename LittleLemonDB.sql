-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Customers_CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Bookings_Customers1_idx` (`Customers_CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `Order date` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `Total_cost` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `Customers_CustomerID` INT NOT NULL,
  `Menus_MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Customers1_idx` (`Customers_CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders_Menus1_idx` (`Menus_MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menus1`
    FOREIGN KEY (`Menus_MenuID`)
    REFERENCES `mydb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `RoleID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StaffInformations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StaffInformations` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `RoleID` INT NOT NULL,
  `Roles_RoleID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `fk_StaffInformations_Roles1_idx` (`Roles_RoleID` ASC) VISIBLE,
  CONSTRAINT `fk_StaffInformations_Roles1`
    FOREIGN KEY (`Roles_RoleID`)
    REFERENCES `mydb`.`Roles` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderDeliveryStatus` (
  `Delivery_date` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `DeliveryID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Order delivery statuscol` VARCHAR(45) NULL,
  `Orders_OrderID` INT NOT NULL,
  `Staff_StaffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  UNIQUE INDEX `DeliveryID_UNIQUE` (`DeliveryID` ASC) VISIBLE,
  INDEX `fk_Order delivery status_Orders1_idx` (`Orders_OrderID` ASC) VISIBLE,
  INDEX `fk_Order delivery status_Staff1_idx` (`Staff_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Order delivery status_Orders1`
    FOREIGN KEY (`Orders_OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order delivery status_Staff1`
    FOREIGN KEY (`Staff_StaffID`)
    REFERENCES `mydb`.`StaffInformations` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ContactDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ContactDetails` (
  `ContactID` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Adress` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `Customers_CustomerID` INT NOT NULL,
  `StaffInformations_StaffID` INT NOT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `fk_ContactDetails_Customers1_idx` (`Customers_CustomerID` ASC) VISIBLE,
  INDEX `fk_ContactDetails_StaffInformations1_idx` (`StaffInformations_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_ContactDetails_Customers1`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContactDetails_StaffInformations1`
    FOREIGN KEY (`StaffInformations_StaffID`)
    REFERENCES `mydb`.`StaffInformations` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Course` VARCHAR(45) NOT NULL,
  `Starter` VARCHAR(45) NOT NULL,
  `Dessert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.` MenuContents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.` MenuContents` (
  `MenuID` INT NOT NULL,
  `MenuItemID` INT NOT NULL,
  `Menus_MenuID` INT NOT NULL,
  `MenuItems_MenuItemID` INT NOT NULL,
  INDEX `fk_ MenuContents_Menus1_idx` (`Menus_MenuID` ASC) VISIBLE,
  INDEX `fk_ MenuContents_MenuItems1_idx` (`MenuItems_MenuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_ MenuContents_Menus1`
    FOREIGN KEY (`Menus_MenuID`)
    REFERENCES `mydb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ MenuContents_MenuItems1`
    FOREIGN KEY (`MenuItems_MenuItemID`)
    REFERENCES `mydb`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

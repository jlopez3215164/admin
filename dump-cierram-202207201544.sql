-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: cierram
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblacc_account_history`
--

DROP TABLE IF EXISTS `tblacc_account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_account_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `debit` decimal(15,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(15,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(45) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `reconcile` int(11) NOT NULL DEFAULT 0,
  `split` int(11) NOT NULL DEFAULT 0,
  `item` int(11) DEFAULT NULL,
  `paid` int(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `payslip_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_account_history`
--

LOCK TABLES `tblacc_account_history` WRITE;
/*!40000 ALTER TABLE `tblacc_account_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_account_type_details`
--

DROP TABLE IF EXISTS `tblacc_account_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_account_type_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `statement_of_cash_flows` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_account_type_details`
--

LOCK TABLES `tblacc_account_type_details` WRITE;
/*!40000 ALTER TABLE `tblacc_account_type_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_account_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_accounts`
--

DROP TABLE IF EXISTS `tblacc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `parent_account` int(11) DEFAULT NULL,
  `account_type_id` int(11) NOT NULL,
  `account_detail_type_id` int(11) NOT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  `balance_as_of` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `default_account` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_accounts`
--

LOCK TABLES `tblacc_accounts` WRITE;
/*!40000 ALTER TABLE `tblacc_accounts` DISABLE KEYS */;
INSERT INTO `tblacc_accounts` VALUES (1,'','acc_accounts_receivable',NULL,NULL,1,1,NULL,NULL,NULL,1,1),(2,'','acc_accrued_holiday_payable',NULL,NULL,9,61,NULL,NULL,NULL,1,1),(3,'','acc_accrued_liabilities',NULL,NULL,8,44,NULL,NULL,NULL,1,1),(4,'','acc_accrued_non_current_liabilities',NULL,NULL,9,62,NULL,NULL,NULL,1,1),(5,'','acc_accumulated_depreciation_on_property_plant_and_equipment',NULL,NULL,4,22,NULL,NULL,NULL,1,1),(6,'','acc_allowance_for_bad_debts',NULL,NULL,2,2,NULL,NULL,NULL,1,1),(7,'','acc_amortisation_expense',NULL,NULL,14,106,NULL,NULL,NULL,1,1),(8,'','acc_assets_held_for_sale',NULL,NULL,5,32,NULL,NULL,NULL,1,1),(9,'','acc_available_for_sale_assets_short_term',NULL,NULL,2,3,NULL,NULL,NULL,1,1),(10,'','acc_bad_debts',NULL,NULL,14,108,NULL,NULL,NULL,1,1),(11,'','acc_bank_charges',NULL,NULL,14,109,NULL,NULL,NULL,1,1),(12,'','acc_billable_expense_income',NULL,NULL,11,89,NULL,NULL,NULL,1,1),(13,'','acc_cash_and_cash_equivalents',NULL,NULL,3,15,NULL,NULL,NULL,1,1),(14,'','acc_change_in_inventory_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(15,'','acc_commissions_and_fees',NULL,NULL,14,111,NULL,NULL,NULL,1,1),(16,'','acc_cost_of_sales',NULL,NULL,13,104,NULL,NULL,NULL,1,1),(17,'','acc_deferred_tax_assets',NULL,NULL,5,33,NULL,NULL,NULL,1,1),(18,'','acc_direct_labour_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(19,'','acc_discounts_given_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(20,'','acc_dividend_disbursed',NULL,NULL,10,69,NULL,NULL,NULL,1,1),(21,'','acc_dividend_income',NULL,NULL,12,92,NULL,NULL,NULL,1,1),(22,'','acc_dividends_payable',NULL,NULL,8,48,NULL,NULL,NULL,1,1),(23,'','acc_dues_and_subscriptions',NULL,NULL,14,113,NULL,NULL,NULL,1,1),(24,'','acc_equipment_rental',NULL,NULL,14,114,NULL,NULL,NULL,1,1),(25,'','acc_equity_in_earnings_of_subsidiaries',NULL,NULL,10,70,NULL,NULL,NULL,1,1),(26,'','acc_freight_and_delivery_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(27,'','acc_goodwill',NULL,NULL,5,34,NULL,NULL,NULL,1,1),(28,'','acc_income_tax_expense',NULL,NULL,14,116,NULL,NULL,NULL,1,1),(29,'','acc_income_tax_payable',NULL,NULL,8,50,NULL,NULL,NULL,1,1),(30,'','acc_insurance_disability',NULL,NULL,14,117,NULL,NULL,NULL,1,1),(31,'','acc_insurance_general',NULL,NULL,14,117,NULL,NULL,NULL,1,1),(32,'','acc_insurance_liability',NULL,NULL,14,117,NULL,NULL,NULL,1,1),(33,'','acc_intangibles',NULL,NULL,5,35,NULL,NULL,NULL,1,1),(34,'','acc_interest_expense',NULL,NULL,14,118,NULL,NULL,NULL,1,1),(35,'','acc_interest_income',NULL,NULL,12,93,NULL,NULL,NULL,1,1),(36,'','acc_inventory',NULL,NULL,2,5,NULL,NULL,NULL,1,1),(37,'','acc_inventory_asset',NULL,NULL,2,5,NULL,NULL,NULL,1,1),(38,'','acc_legal_and_professional_fees',NULL,NULL,14,119,NULL,NULL,NULL,1,1),(39,'','acc_liabilities_related_to_assets_held_for_sale',NULL,NULL,9,63,NULL,NULL,NULL,1,1),(40,'','acc_long_term_debt',NULL,NULL,9,64,NULL,NULL,NULL,1,1),(41,'','acc_long_term_investments',NULL,NULL,5,38,NULL,NULL,NULL,1,1),(42,'','acc_loss_on_discontinued_operations_net_of_tax',NULL,NULL,14,120,NULL,NULL,NULL,1,1),(43,'','acc_loss_on_disposal_of_assets',NULL,NULL,12,94,NULL,NULL,NULL,1,1),(44,'','acc_management_compensation',NULL,NULL,14,121,NULL,NULL,NULL,1,1),(45,'','acc_materials_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(46,'','acc_meals_and_entertainment',NULL,NULL,14,122,NULL,NULL,NULL,1,1),(47,'','acc_office_expenses',NULL,NULL,14,123,NULL,NULL,NULL,1,1),(48,'','acc_other_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(49,'','acc_other_comprehensive_income',NULL,NULL,10,73,NULL,NULL,NULL,1,1),(50,'','acc_other_general_and_administrative_expenses',NULL,NULL,14,123,NULL,NULL,NULL,1,1),(51,'','acc_other_operating_income_expenses',NULL,NULL,12,97,NULL,NULL,NULL,1,1),(52,'','acc_other_selling_expenses',NULL,NULL,14,125,NULL,NULL,NULL,1,1),(53,'','acc_other_type_of_expenses_advertising_expenses',NULL,NULL,14,105,NULL,NULL,NULL,1,1),(54,'','acc_overhead_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(55,'','acc_payroll_clearing',NULL,NULL,8,55,NULL,NULL,NULL,1,1),(56,'','acc_payroll_expenses',NULL,NULL,14,126,NULL,NULL,NULL,1,1),(57,'','acc_payroll_liabilities',NULL,NULL,8,56,NULL,NULL,NULL,1,1),(58,'','acc_prepaid_expenses',NULL,NULL,2,11,NULL,NULL,NULL,1,1),(59,'','acc_property_plant_and_equipment',NULL,NULL,4,26,NULL,NULL,NULL,1,1),(60,'','acc_purchases',NULL,NULL,14,130,NULL,NULL,NULL,1,1),(61,'','acc_reconciliation_discrepancies',NULL,NULL,15,139,NULL,NULL,NULL,1,1),(62,'','acc_rent_or_lease_payments',NULL,NULL,14,127,NULL,NULL,NULL,1,1),(63,'','acc_repair_and_maintenance',NULL,NULL,14,128,NULL,NULL,NULL,1,1),(64,'','acc_retained_earnings',NULL,NULL,10,80,NULL,NULL,NULL,1,1),(65,'','acc_revenue_general',NULL,NULL,11,86,NULL,NULL,NULL,1,1),(66,'','acc_sales',NULL,NULL,11,89,NULL,NULL,NULL,1,1),(67,'','acc_sales_retail',NULL,NULL,11,87,NULL,NULL,NULL,1,1),(68,'','acc_sales_wholesale',NULL,NULL,11,88,NULL,NULL,NULL,1,1),(69,'','acc_sales_of_product_income',NULL,NULL,11,89,NULL,NULL,NULL,1,1),(70,'','acc_share_capital',NULL,NULL,10,81,NULL,NULL,NULL,1,1),(71,'','acc_shipping_and_delivery_expense',NULL,NULL,14,129,NULL,NULL,NULL,1,1),(72,'','acc_short_term_debit',NULL,NULL,8,54,NULL,NULL,NULL,1,1),(73,'','acc_stationery_and_printing',NULL,NULL,14,123,NULL,NULL,NULL,1,1),(74,'','acc_subcontractors_cos',NULL,NULL,13,100,NULL,NULL,NULL,1,1),(75,'','acc_supplies',NULL,NULL,14,130,NULL,NULL,NULL,1,1),(76,'','acc_travel_expenses_general_and_admin_expenses',NULL,NULL,14,132,NULL,NULL,NULL,1,1),(77,'','acc_travel_expenses_selling_expense',NULL,NULL,14,133,NULL,NULL,NULL,1,1),(78,'','acc_unapplied_cash_payment_income',NULL,NULL,11,91,NULL,NULL,NULL,1,1),(79,'','acc_uncategorised_asset',NULL,NULL,2,10,NULL,NULL,NULL,1,1),(80,'','acc_uncategorised_expense',NULL,NULL,14,124,NULL,NULL,NULL,1,1),(81,'','acc_uncategorised_income',NULL,NULL,11,89,NULL,NULL,NULL,1,1),(82,'','acc_undeposited_funds',NULL,NULL,2,13,NULL,NULL,NULL,1,1),(83,'','acc_unrealised_loss_on_securities_net_of_tax',NULL,NULL,12,99,NULL,NULL,NULL,1,1),(84,'','acc_utilities',NULL,NULL,14,135,NULL,NULL,NULL,1,1),(85,'','acc_wage_expenses',NULL,NULL,14,126,NULL,NULL,NULL,1,1),(86,'','acc_credit_card',NULL,NULL,7,43,NULL,NULL,NULL,1,1),(87,'','acc_accounts_payable',NULL,NULL,6,42,NULL,NULL,NULL,1,1),(88,'','acc_opening_balance_equity',NULL,NULL,10,71,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `tblacc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_banking_rule_details`
--

DROP TABLE IF EXISTS `tblacc_banking_rule_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_banking_rule_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `subtype` varchar(45) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `subtype_amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_banking_rule_details`
--

LOCK TABLES `tblacc_banking_rule_details` WRITE;
/*!40000 ALTER TABLE `tblacc_banking_rule_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_banking_rule_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_banking_rules`
--

DROP TABLE IF EXISTS `tblacc_banking_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_banking_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `transaction` varchar(45) DEFAULT NULL,
  `following` varchar(45) DEFAULT NULL,
  `then` varchar(45) DEFAULT NULL,
  `payment_account` int(11) DEFAULT NULL,
  `deposit_to` int(11) DEFAULT NULL,
  `auto_add` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_banking_rules`
--

LOCK TABLES `tblacc_banking_rules` WRITE;
/*!40000 ALTER TABLE `tblacc_banking_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_banking_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_budget_details`
--

DROP TABLE IF EXISTS `tblacc_budget_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_budget_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `account` int(11) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_budget_details`
--

LOCK TABLES `tblacc_budget_details` WRITE;
/*!40000 ALTER TABLE `tblacc_budget_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_budget_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_budgets`
--

DROP TABLE IF EXISTS `tblacc_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `data_source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_budgets`
--

LOCK TABLES `tblacc_budgets` WRITE;
/*!40000 ALTER TABLE `tblacc_budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_expense_category_mappings`
--

DROP TABLE IF EXISTS `tblacc_expense_category_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_expense_category_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  `preferred_payment_method` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_expense_category_mappings`
--

LOCK TABLES `tblacc_expense_category_mappings` WRITE;
/*!40000 ALTER TABLE `tblacc_expense_category_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_expense_category_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_item_automatics`
--

DROP TABLE IF EXISTS `tblacc_item_automatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_item_automatics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `inventory_asset_account` int(11) NOT NULL DEFAULT 0,
  `income_account` int(11) NOT NULL DEFAULT 0,
  `expense_account` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_item_automatics`
--

LOCK TABLES `tblacc_item_automatics` WRITE;
/*!40000 ALTER TABLE `tblacc_item_automatics` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_item_automatics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_journal_entries`
--

DROP TABLE IF EXISTS `tblacc_journal_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_journal_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `journal_date` date DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_journal_entries`
--

LOCK TABLES `tblacc_journal_entries` WRITE;
/*!40000 ALTER TABLE `tblacc_journal_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_journal_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_payment_mode_mappings`
--

DROP TABLE IF EXISTS `tblacc_payment_mode_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_payment_mode_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_mode_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  `expense_payment_account` int(11) NOT NULL DEFAULT 0,
  `expense_deposit_to` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_payment_mode_mappings`
--

LOCK TABLES `tblacc_payment_mode_mappings` WRITE;
/*!40000 ALTER TABLE `tblacc_payment_mode_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_payment_mode_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_reconciles`
--

DROP TABLE IF EXISTS `tblacc_reconciles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_reconciles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `beginning_balance` decimal(15,2) NOT NULL,
  `ending_balance` decimal(15,2) NOT NULL,
  `ending_date` date NOT NULL,
  `expense_date` date DEFAULT NULL,
  `service_charge` decimal(15,2) DEFAULT NULL,
  `expense_account` int(11) DEFAULT NULL,
  `income_date` date DEFAULT NULL,
  `interest_earned` decimal(15,2) DEFAULT NULL,
  `income_account` int(11) DEFAULT NULL,
  `finish` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_reconciles`
--

LOCK TABLES `tblacc_reconciles` WRITE;
/*!40000 ALTER TABLE `tblacc_reconciles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_reconciles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_tax_mappings`
--

DROP TABLE IF EXISTS `tblacc_tax_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_tax_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  `expense_payment_account` int(11) NOT NULL DEFAULT 0,
  `expense_deposit_to` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_tax_mappings`
--

LOCK TABLES `tblacc_tax_mappings` WRITE;
/*!40000 ALTER TABLE `tblacc_tax_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_tax_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_transaction_bankings`
--

DROP TABLE IF EXISTS `tblacc_transaction_bankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_transaction_bankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `withdrawals` decimal(15,2) NOT NULL DEFAULT 0.00,
  `deposits` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payee` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_transaction_bankings`
--

LOCK TABLES `tblacc_transaction_bankings` WRITE;
/*!40000 ALTER TABLE `tblacc_transaction_bankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_transaction_bankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblacc_transfers`
--

DROP TABLE IF EXISTS `tblacc_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblacc_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_funds_from` int(11) NOT NULL,
  `transfer_funds_to` int(11) NOT NULL,
  `transfer_amount` decimal(15,2) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblacc_transfers`
--

LOCK TABLES `tblacc_transfers` WRITE;
/*!40000 ALTER TABLE `tblacc_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblacc_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblactivity_log`
--

DROP TABLE IF EXISTS `tblactivity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblactivity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblactivity_log`
--

LOCK TABLES `tblactivity_log` WRITE;
/*!40000 ALTER TABLE `tblactivity_log` DISABLE KEYS */;
INSERT INTO `tblactivity_log` VALUES (1,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-08 21:55:34','JORGE GARCIA CARDENAS'),(2,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-11 22:35:08','JORGE GARCIA CARDENAS'),(3,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-11 22:52:22','JORGE GARCIA CARDENAS'),(4,'New Staff Member Added [ID: 2, Axel Fagoaga]','2022-07-11 23:14:33','JORGE GARCIA CARDENAS'),(5,'User Successfully Logged In [User Id: 2, Is Staff Member: Yes, IP: 45.167.95.145]','2022-07-11 23:31:53','Axel Fagoaga'),(6,'User Successfully Logged In [User Id: 2, Is Staff Member: Yes, IP: 45.167.95.145]','2022-07-12 02:13:26','Axel Fagoaga'),(7,'Product Category Added[ID:1, Computer, Staff id 1]','2022-07-12 02:13:52','JORGE GARCIA CARDENAS'),(8,'Product Category Added[ID:2, Accesessories, Staff id 1]','2022-07-12 02:14:54','JORGE GARCIA CARDENAS'),(9,'Product Category Added[ID:3, Electronic, Staff id 1]','2022-07-12 02:15:09','JORGE GARCIA CARDENAS'),(10,'New Product Added [ ID:1, AMD Ryzen 7 Mini PC Am02 Mini Computer Athlon 300u Win10PRO/Linux Desktop Gaming PC 4K HD Radeon Vega 3 Graphics 8GB Android TV Box DDR4 256 GB Nvme SSD Mini PC, Staff id 1 ]','2022-07-12 02:20:41','JORGE GARCIA CARDENAS'),(11,'Product Details updated[ ID: 1, AMD Ryzen 7 Mini PC Am02 Mini Computer Athlon 300u Win10PRO/Linux Desktop Gaming PC 4K HD Radeon Vega 3 Graphics 8GB Android TV Box DDR4 256 GB Nvme SSD Mini PC, Staff id 1 ]','2022-07-12 02:20:41','JORGE GARCIA CARDENAS'),(12,'Product Category Added[ID:4, Laptop, Staff id 1]','2022-07-12 02:22:57','JORGE GARCIA CARDENAS'),(13,'New Product Added [ ID:2, Fanless Industrial Ultra Low Power Complete Multifunction Linux Desktop Micro Mini Tower PC Pocket Computer Mini PC Desktop Set, Staff id 2 ]','2022-07-12 02:37:27','Axel Fagoaga'),(14,'Product Details updated[ ID: 2, Fanless Industrial Ultra Low Power Complete Multifunction Linux Desktop Micro Mini Tower PC Pocket Computer Mini PC Desktop Set, Staff id 2 ]','2022-07-12 02:37:27','Axel Fagoaga'),(15,'New Client Created [ID: 1, From Staff: 1]','2022-07-12 02:46:16','JORGE GARCIA CARDENAS'),(16,'Contact Created [ID: 1]','2022-07-12 02:46:42','JORGE GARCIA CARDENAS'),(17,'User Successfully Logged In [User Id: 1, Is Staff Member: No, IP: 38.65.144.97]','2022-07-12 02:48:02','Jorge Garcia'),(18,'User Successfully Logged In [User Id: 1, Is Staff Member: No, IP: 38.65.144.97]','2022-07-12 02:51:27','Jorge Garcia'),(19,'User Successfully Logged In [User Id: 1, Is Staff Member: No, IP: 38.65.144.97]','2022-07-12 02:52:18','Jorge Garcia'),(20,'User Successfully Logged In [User Id: 1, Is Staff Member: No, IP: 38.65.144.97]','2022-07-12 02:52:41','Jorge Garcia'),(21,'Non Existing User Tried to Login [Email: jorgegarcia909@gmail.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-12 16:22:21',NULL),(22,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-12 16:22:30','JORGE GARCIA CARDENAS'),(23,'Invoice Deleted [INV-000002]','2022-07-12 16:22:41','JORGE GARCIA CARDENAS'),(24,'Invoice Deleted [INV-000001]','2022-07-12 16:22:48','JORGE GARCIA CARDENAS'),(25,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-13 09:59:53','JORGE GARCIA CARDENAS'),(26,'New Staff Member Added [ID: 3, FABIOLA RAMIREZ]','2022-07-13 10:00:46','JORGE GARCIA CARDENAS'),(27,'User Successfully Logged In [User Id: 3, Is Staff Member: Yes, IP: 45.167.95.145]','2022-07-13 10:01:54','FABIOLA RAMIREZ'),(28,'New Client Created [ID: 2, From Staff: 1]','2022-07-13 10:07:36','JORGE GARCIA CARDENAS'),(29,'Contact Created [ID: 2]','2022-07-13 10:11:00','JORGE GARCIA CARDENAS'),(30,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 38.65.144.97]','2022-07-13 10:11:37','JESUS DANIEL MACEDO REYES'),(31,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 38.65.144.97]','2022-07-13 10:12:42','JESUS DANIEL MACEDO REYES'),(32,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 38.65.144.97]','2022-07-13 10:13:29','JESUS DANIEL MACEDO REYES'),(33,'New Project Created [ID: 1]','2022-07-13 10:15:00','JORGE GARCIA CARDENAS'),(34,'New Task Added [ID:1, Name: LEVANTAMIENTO DE IMAGEN CORPORATIVA SET 1]','2022-07-13 10:18:08','JORGE GARCIA CARDENAS'),(35,'New Task Added [ID:2, Name: LOGO 3D]','2022-07-13 10:24:29','JORGE GARCIA CARDENAS'),(36,'New Task Added [ID:3, Name: CM STEP#1 ANALISIS DEL ESTADO ACTUAL DE GOOGLE MY BUSINESS]','2022-07-13 10:27:32','JORGE GARCIA CARDENAS'),(37,'Task Updated [ID:2, Name: LOGO 3D]','2022-07-13 10:30:24','JORGE GARCIA CARDENAS'),(38,'Task Updated [ID:3, Name: CM STEP#1 ANALISIS DEL ESTADO ACTUAL DE GOOGLE MY BUSINESS]','2022-07-13 10:32:23','JORGE GARCIA CARDENAS'),(39,'Task Updated [ID:2, Name: LOGO 3D]','2022-07-13 10:34:13','JORGE GARCIA CARDENAS'),(40,'New Task Added [ID:4, Name: VIDEO CORPORATIVO]','2022-07-13 10:38:37','JORGE GARCIA CARDENAS'),(41,'New Task Added [ID:5, Name: Levantamiento de imagen set 2]','2022-07-13 10:58:00','FABIOLA RAMIREZ'),(42,'Project Updated [ID: 1]','2022-07-13 11:04:22','JORGE GARCIA CARDENAS'),(43,'New Task Added [ID:6, Name: ESTRATEGIA DE MARKETING]','2022-07-13 11:19:43','JORGE GARCIA CARDENAS'),(44,'New Task Added [ID:7, Name: ESTUDIO DE MERCADO]','2022-07-13 11:20:49','JORGE GARCIA CARDENAS'),(45,'New Task Added [ID:8, Name: Ejecucion de Sitemap]','2022-07-13 14:03:54','JORGE GARCIA CARDENAS'),(46,'New Task Added [ID:9, Name: configuracion de Google tag]','2022-07-13 14:04:31','JORGE GARCIA CARDENAS'),(47,'Project Updated [ID: 1]','2022-07-13 14:15:20','JORGE GARCIA CARDENAS'),(48,'User Successfully Logged In [User Id: 3, Is Staff Member: Yes, IP: 45.167.95.145]','2022-07-13 16:25:09','FABIOLA RAMIREZ'),(49,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 38.65.144.97]','2022-07-13 16:57:59','JESUS DANIEL MACEDO REYES'),(50,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 187.145.89.171]','2022-07-13 17:13:10','JESUS DANIEL MACEDO REYES'),(51,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 187.145.89.171]','2022-07-13 17:16:57','JESUS DANIEL MACEDO REYES'),(52,'Customer Attachment Deleted [ID: 2]','2022-07-13 23:17:08','JORGE GARCIA CARDENAS'),(53,'New Task Added [ID:10, Name: SITEMAP CREATE]','2022-07-13 23:21:58','JORGE GARCIA CARDENAS'),(54,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-14 21:36:26','JORGE GARCIA CARDENAS'),(55,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 38.65.144.97]','2022-07-18 15:56:32','JESUS DANIEL MACEDO REYES'),(56,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-18 15:58:16','JORGE GARCIA CARDENAS'),(57,'New Task Added [ID:11, Name: CONFIGURACION GOOGLE TOOLS]','2022-07-18 16:00:46','JORGE GARCIA CARDENAS'),(58,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 38.65.144.97]','2022-07-19 10:36:36','JESUS DANIEL MACEDO REYES'),(59,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 10:54:02',NULL),(60,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 10:54:06',NULL),(61,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 10:54:13',NULL),(62,'Non Existing User Tried to Login [Email: admin@admin.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 10:54:19',NULL),(63,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 10:54:36',NULL),(64,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 10:55:58',NULL),(65,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 11:04:23',NULL),(66,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-19 11:04:29','JORGE GARCIA CARDENAS'),(67,'New Department Added [Community manager, ID: 1]','2022-07-19 11:08:30','JORGE GARCIA CARDENAS'),(68,'Department Updated [Name: Community manager, ID: 1]','2022-07-19 11:08:50','JORGE GARCIA CARDENAS'),(69,'Department Updated [Name: Community manager, ID: 1]','2022-07-19 11:09:02','JORGE GARCIA CARDENAS'),(70,'New Custom Field Added [Charts]','2022-07-19 13:41:11','JORGE GARCIA CARDENAS'),(71,'User Successfully Logged In [User Id: 2, Is Staff Member: No, IP: 189.141.36.49]','2022-07-19 16:49:58','JESUS DANIEL MACEDO REYES'),(72,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 38.65.144.97]','2022-07-20 11:29:52','JORGE GARCIA CARDENAS'),(73,'Failed Login Attempt [Email: admin@ltysmx.com, Is Staff Member: Yes, IP: ::1]','2022-07-20 11:58:04',NULL),(74,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: ::1]','2022-07-20 12:00:25','JORGE GARCIA CARDENAS'),(121,'Client Deleted [ID: 2]','2022-07-20 12:07:56','JORGE GARCIA CARDENAS'),(122,'Client Deleted [ID: 1]','2022-07-20 12:08:03','JORGE GARCIA CARDENAS'),(123,'New Role Added [ID: 2.administrador]','2022-07-20 13:04:09','JORGE GARCIA CARDENAS'),(124,'Staff Member Deleted [Name: Axel Fagoaga, Data Transferred To: JORGE GARCIA CARDENAS]','2022-07-20 13:05:41','JORGE GARCIA CARDENAS'),(125,'Staff Member Deleted [Name: FABIOLA RAMIREZ, Data Transferred To: JORGE GARCIA CARDENAS]','2022-07-20 13:06:08','JORGE GARCIA CARDENAS'),(126,'New Staff Member Added [ID: 4, Freskados Administrador]','2022-07-20 13:08:43','JORGE GARCIA CARDENAS'),(127,'User Successfully Logged In [User Id: 4, Is Staff Member: Yes, IP: ::1]','2022-07-20 13:15:57','Freskados Administrador'),(128,'Tried to access page where don\'t have permission [Taxes]','2022-07-20 14:27:36','Freskados Administrador'),(129,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.5.186]','2022-07-20 15:03:20',NULL),(130,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:03:29',NULL),(131,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:03:39',NULL),(132,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.5.186]','2022-07-20 15:03:54',NULL),(133,'User Successfully Logged In [User Id: 4, Is Staff Member: Yes, IP: 192.168.5.186]','2022-07-20 15:04:18','Freskados Administrador'),(134,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:13:58',NULL),(135,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:14:05',NULL),(136,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:14:15',NULL),(137,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:14:27',NULL),(138,'Non Existing User Tried to Login [Email: admin@freskados.com, Is Staff Member: No, IP: 192.168.1.207]','2022-07-20 15:14:55',NULL);
/*!40000 ALTER TABLE `tblactivity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblallowance_type`
--

DROP TABLE IF EXISTS `tblallowance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblallowance_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) NOT NULL,
  `allowance_val` decimal(15,2) NOT NULL,
  `taxable` tinyint(1) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblallowance_type`
--

LOCK TABLES `tblallowance_type` WRITE;
/*!40000 ALTER TABLE `tblallowance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblallowance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblannouncements`
--

DROP TABLE IF EXISTS `tblannouncements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblannouncements` (
  `announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text DEFAULT NULL,
  `showtousers` int(11) NOT NULL,
  `showtostaff` int(11) NOT NULL,
  `showname` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` varchar(100) NOT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblannouncements`
--

LOCK TABLES `tblannouncements` WRITE;
/*!40000 ALTER TABLE `tblannouncements` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblannouncements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbonus_discipline`
--

DROP TABLE IF EXISTS `tblbonus_discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbonus_discipline` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `id_criteria` varchar(200) DEFAULT NULL,
  `type` int(3) NOT NULL,
  `apply_for` varchar(50) DEFAULT NULL,
  `from_time` datetime DEFAULT NULL,
  `lever_bonus` int(11) DEFAULT NULL,
  `approver` int(11) DEFAULT NULL,
  `url_file` longtext DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `id_admin` int(3) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbonus_discipline`
--

LOCK TABLES `tblbonus_discipline` WRITE;
/*!40000 ALTER TABLE `tblbonus_discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbonus_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbonus_discipline_detail`
--

DROP TABLE IF EXISTS `tblbonus_discipline_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbonus_discipline_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_bonus_discipline` int(11) NOT NULL,
  `from_time` datetime DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `department_id` longtext DEFAULT NULL,
  `lever_bonus` int(11) DEFAULT NULL,
  `formality` varchar(50) DEFAULT NULL,
  `formality_value` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbonus_discipline_detail`
--

LOCK TABLES `tblbonus_discipline_detail` WRITE;
/*!40000 ALTER TABLE `tblbonus_discipline_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbonus_discipline_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcart`
--

DROP TABLE IF EXISTS `tblcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_contact` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `voucher` varchar(100) NOT NULL,
  `status` int(11) DEFAULT 0,
  `complete` int(11) DEFAULT 0,
  `datecreator` datetime NOT NULL DEFAULT current_timestamp(),
  `order_number` varchar(100) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel` varchar(150) DEFAULT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `billing_street` varchar(150) DEFAULT NULL,
  `billing_city` varchar(50) DEFAULT NULL,
  `billing_state` varchar(50) DEFAULT NULL,
  `billing_country` varchar(50) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `shipping_street` varchar(150) DEFAULT NULL,
  `shipping_city` varchar(50) DEFAULT NULL,
  `shipping_state` varchar(50) DEFAULT NULL,
  `shipping_country` varchar(50) DEFAULT NULL,
  `shipping_zip` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `admin_action` int(11) DEFAULT 0,
  `discount` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 0,
  `total` varchar(250) DEFAULT NULL,
  `sub_total` varchar(250) DEFAULT NULL,
  `discount_total` varchar(250) NOT NULL DEFAULT '',
  `invoice` varchar(250) NOT NULL DEFAULT '',
  `number_invoice` varchar(250) NOT NULL DEFAULT '',
  `stock_export_number` varchar(250) NOT NULL DEFAULT '',
  `create_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_export` varchar(5) NOT NULL DEFAULT 'off',
  `customers_pay` decimal(15,2) NOT NULL DEFAULT 0.00,
  `amount_returned` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `seller` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcart`
--

LOCK TABLES `tblcart` WRITE;
/*!40000 ALTER TABLE `tblcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcart_detailt`
--

DROP TABLE IF EXISTS `tblcart_detailt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcart_detailt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `classify` varchar(30) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `sku` text NOT NULL,
  `percent_discount` decimal(15,0) NOT NULL,
  `prices_discount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcart_detailt`
--

LOCK TABLES `tblcart_detailt` WRITE;
/*!40000 ALTER TABLE `tblcart_detailt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcart_detailt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcd_care`
--

DROP TABLE IF EXISTS `tblcd_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcd_care` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `care_time` datetime NOT NULL,
  `care_result` text NOT NULL,
  `description` text DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcd_care`
--

LOCK TABLES `tblcd_care` WRITE;
/*!40000 ALTER TABLE `tblcd_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcd_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcd_family_infor`
--

DROP TABLE IF EXISTS `tblcd_family_infor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcd_family_infor` (
  `fi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `fi_birthday` date DEFAULT NULL,
  `job` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  PRIMARY KEY (`fi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcd_family_infor`
--

LOCK TABLES `tblcd_family_infor` WRITE;
/*!40000 ALTER TABLE `tblcd_family_infor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcd_family_infor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcd_interview`
--

DROP TABLE IF EXISTS `tblcd_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcd_interview` (
  `in_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `interview` int(11) NOT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcd_interview`
--

LOCK TABLES `tblcd_interview` WRITE;
/*!40000 ALTER TABLE `tblcd_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcd_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcd_literacy`
--

DROP TABLE IF EXISTS `tblcd_literacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcd_literacy` (
  `li_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `literacy_from_date` date DEFAULT NULL,
  `literacy_to_date` date DEFAULT NULL,
  `diploma` varchar(200) DEFAULT NULL,
  `training_places` varchar(200) DEFAULT NULL,
  `specialized` varchar(200) DEFAULT NULL,
  `training_form` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`li_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcd_literacy`
--

LOCK TABLES `tblcd_literacy` WRITE;
/*!40000 ALTER TABLE `tblcd_literacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcd_literacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcd_skill`
--

DROP TABLE IF EXISTS `tblcd_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcd_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `skill_name` text DEFAULT NULL,
  `skill_description` text DEFAULT NULL,
  PRIMARY KEY (`id`,`candidate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcd_skill`
--

LOCK TABLES `tblcd_skill` WRITE;
/*!40000 ALTER TABLE `tblcd_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcd_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcd_work_experience`
--

DROP TABLE IF EXISTS `tblcd_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcd_work_experience` (
  `we_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `contact_person` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `reason_quitwork` varchar(200) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  PRIMARY KEY (`we_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcd_work_experience`
--

LOCK TABLES `tblcd_work_experience` WRITE;
/*!40000 ALTER TABLE `tblcd_work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcd_work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblchecklist`
--

DROP TABLE IF EXISTS `tblchecklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblchecklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchecklist`
--

LOCK TABLES `tblchecklist` WRITE;
/*!40000 ALTER TABLE `tblchecklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblchecklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblchecklist_allocation`
--

DROP TABLE IF EXISTS `tblchecklist_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblchecklist_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchecklist_allocation`
--

LOCK TABLES `tblchecklist_allocation` WRITE;
/*!40000 ALTER TABLE `tblchecklist_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblchecklist_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclients`
--

DROP TABLE IF EXISTS `tblclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclients` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(191) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `leadid` int(11) DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT 0,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT 0,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int(11) NOT NULL DEFAULT 0,
  `show_primary_contact` int(11) NOT NULL DEFAULT 0,
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int(11) NOT NULL DEFAULT 1,
  `addedfrom` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclients`
--

LOCK TABLES `tblclients` WRITE;
/*!40000 ALTER TABLE `tblclients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconsent_purposes`
--

DROP TABLE IF EXISTS `tblconsent_purposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconsent_purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconsent_purposes`
--

LOCK TABLES `tblconsent_purposes` WRITE;
/*!40000 ALTER TABLE `tblconsent_purposes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblconsent_purposes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconsents`
--

DROP TABLE IF EXISTS `tblconsents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconsents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(40) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `lead_id` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `opt_in_purpose_description` text DEFAULT NULL,
  `purpose_id` int(11) NOT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_id` (`purpose_id`),
  KEY `contact_id` (`contact_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconsents`
--

LOCK TABLES `tblconsents` WRITE;
/*!40000 ALTER TABLE `tblconsents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblconsents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontact_permissions`
--

DROP TABLE IF EXISTS `tblcontact_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontact_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontact_permissions`
--

LOCK TABLES `tblcontact_permissions` WRITE;
/*!40000 ALTER TABLE `tblcontact_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontact_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontacts`
--

DROP TABLE IF EXISTS `tblcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT 1,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT 1,
  `estimate_emails` tinyint(1) NOT NULL DEFAULT 1,
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT 1,
  `contract_emails` tinyint(1) NOT NULL DEFAULT 1,
  `task_emails` tinyint(1) NOT NULL DEFAULT 1,
  `project_emails` tinyint(1) NOT NULL DEFAULT 1,
  `ticket_emails` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `email` (`email`),
  KEY `is_primary` (`is_primary`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontacts`
--

LOCK TABLES `tblcontacts` WRITE;
/*!40000 ALTER TABLE `tblcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontract_comments`
--

DROP TABLE IF EXISTS `tblcontract_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontract_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext DEFAULT NULL,
  `contract_id` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontract_comments`
--

LOCK TABLES `tblcontract_comments` WRITE;
/*!40000 ALTER TABLE `tblcontract_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontract_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontract_renewals`
--

DROP TABLE IF EXISTS `tblcontract_renewals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontract_renewals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `old_start_date` date NOT NULL,
  `new_start_date` date NOT NULL,
  `old_end_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `old_value` decimal(15,2) DEFAULT NULL,
  `new_value` decimal(15,2) DEFAULT NULL,
  `date_renewed` datetime NOT NULL,
  `renewed_by` varchar(100) NOT NULL,
  `renewed_by_staff_id` int(11) NOT NULL DEFAULT 0,
  `is_on_old_expiry_notified` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontract_renewals`
--

LOCK TABLES `tblcontract_renewals` WRITE;
/*!40000 ALTER TABLE `tblcontract_renewals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontract_renewals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontracts`
--

DROP TABLE IF EXISTS `tblcontracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `client` int(11) NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `isexpirynotified` int(11) NOT NULL DEFAULT 0,
  `contract_value` decimal(15,2) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT 0,
  `not_visible_to_client` tinyint(1) NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT 0,
  `signature` varchar(40) DEFAULT NULL,
  `marked_as_signed` tinyint(1) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `contract_type` (`contract_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontracts`
--

LOCK TABLES `tblcontracts` WRITE;
/*!40000 ALTER TABLE `tblcontracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontracts_types`
--

DROP TABLE IF EXISTS `tblcontracts_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontracts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontracts_types`
--

LOCK TABLES `tblcontracts_types` WRITE;
/*!40000 ALTER TABLE `tblcontracts_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontracts_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcountries`
--

DROP TABLE IF EXISTS `tblcountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcountries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `short_name` varchar(80) NOT NULL DEFAULT '',
  `long_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcountries`
--

LOCK TABLES `tblcountries` WRITE;
/*!40000 ALTER TABLE `tblcountries` DISABLE KEYS */;
INSERT INTO `tblcountries` VALUES (1,'AF','Afghanistan','Islamic Republic of Afghanistan','AFG','004','yes','93','.af'),(2,'AX','Aland Islands','&Aring;land Islands','ALA','248','no','358','.ax'),(3,'AL','Albania','Republic of Albania','ALB','008','yes','355','.al'),(4,'DZ','Algeria','People\'s Democratic Republic of Algeria','DZA','012','yes','213','.dz'),(5,'AS','American Samoa','American Samoa','ASM','016','no','1+684','.as'),(6,'AD','Andorra','Principality of Andorra','AND','020','yes','376','.ad'),(7,'AO','Angola','Republic of Angola','AGO','024','yes','244','.ao'),(8,'AI','Anguilla','Anguilla','AIA','660','no','1+264','.ai'),(9,'AQ','Antarctica','Antarctica','ATA','010','no','672','.aq'),(10,'AG','Antigua and Barbuda','Antigua and Barbuda','ATG','028','yes','1+268','.ag'),(11,'AR','Argentina','Argentine Republic','ARG','032','yes','54','.ar'),(12,'AM','Armenia','Republic of Armenia','ARM','051','yes','374','.am'),(13,'AW','Aruba','Aruba','ABW','533','no','297','.aw'),(14,'AU','Australia','Commonwealth of Australia','AUS','036','yes','61','.au'),(15,'AT','Austria','Republic of Austria','AUT','040','yes','43','.at'),(16,'AZ','Azerbaijan','Republic of Azerbaijan','AZE','031','yes','994','.az'),(17,'BS','Bahamas','Commonwealth of The Bahamas','BHS','044','yes','1+242','.bs'),(18,'BH','Bahrain','Kingdom of Bahrain','BHR','048','yes','973','.bh'),(19,'BD','Bangladesh','People\'s Republic of Bangladesh','BGD','050','yes','880','.bd'),(20,'BB','Barbados','Barbados','BRB','052','yes','1+246','.bb'),(21,'BY','Belarus','Republic of Belarus','BLR','112','yes','375','.by'),(22,'BE','Belgium','Kingdom of Belgium','BEL','056','yes','32','.be'),(23,'BZ','Belize','Belize','BLZ','084','yes','501','.bz'),(24,'BJ','Benin','Republic of Benin','BEN','204','yes','229','.bj'),(25,'BM','Bermuda','Bermuda Islands','BMU','060','no','1+441','.bm'),(26,'BT','Bhutan','Kingdom of Bhutan','BTN','064','yes','975','.bt'),(27,'BO','Bolivia','Plurinational State of Bolivia','BOL','068','yes','591','.bo'),(28,'BQ','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius and Saba','BES','535','no','599','.bq'),(29,'BA','Bosnia and Herzegovina','Bosnia and Herzegovina','BIH','070','yes','387','.ba'),(30,'BW','Botswana','Republic of Botswana','BWA','072','yes','267','.bw'),(31,'BV','Bouvet Island','Bouvet Island','BVT','074','no','NONE','.bv'),(32,'BR','Brazil','Federative Republic of Brazil','BRA','076','yes','55','.br'),(33,'IO','British Indian Ocean Territory','British Indian Ocean Territory','IOT','086','no','246','.io'),(34,'BN','Brunei','Brunei Darussalam','BRN','096','yes','673','.bn'),(35,'BG','Bulgaria','Republic of Bulgaria','BGR','100','yes','359','.bg'),(36,'BF','Burkina Faso','Burkina Faso','BFA','854','yes','226','.bf'),(37,'BI','Burundi','Republic of Burundi','BDI','108','yes','257','.bi'),(38,'KH','Cambodia','Kingdom of Cambodia','KHM','116','yes','855','.kh'),(39,'CM','Cameroon','Republic of Cameroon','CMR','120','yes','237','.cm'),(40,'CA','Canada','Canada','CAN','124','yes','1','.ca'),(41,'CV','Cape Verde','Republic of Cape Verde','CPV','132','yes','238','.cv'),(42,'KY','Cayman Islands','The Cayman Islands','CYM','136','no','1+345','.ky'),(43,'CF','Central African Republic','Central African Republic','CAF','140','yes','236','.cf'),(44,'TD','Chad','Republic of Chad','TCD','148','yes','235','.td'),(45,'CL','Chile','Republic of Chile','CHL','152','yes','56','.cl'),(46,'CN','China','People\'s Republic of China','CHN','156','yes','86','.cn'),(47,'CX','Christmas Island','Christmas Island','CXR','162','no','61','.cx'),(48,'CC','Cocos (Keeling) Islands','Cocos (Keeling) Islands','CCK','166','no','61','.cc'),(49,'CO','Colombia','Republic of Colombia','COL','170','yes','57','.co'),(50,'KM','Comoros','Union of the Comoros','COM','174','yes','269','.km'),(51,'CG','Congo','Republic of the Congo','COG','178','yes','242','.cg'),(52,'CK','Cook Islands','Cook Islands','COK','184','some','682','.ck'),(53,'CR','Costa Rica','Republic of Costa Rica','CRI','188','yes','506','.cr'),(54,'CI','Cote d\'ivoire (Ivory Coast)','Republic of C&ocirc;te D\'Ivoire (Ivory Coast)','CIV','384','yes','225','.ci'),(55,'HR','Croatia','Republic of Croatia','HRV','191','yes','385','.hr'),(56,'CU','Cuba','Republic of Cuba','CUB','192','yes','53','.cu'),(57,'CW','Curacao','Cura&ccedil;ao','CUW','531','no','599','.cw'),(58,'CY','Cyprus','Republic of Cyprus','CYP','196','yes','357','.cy'),(59,'CZ','Czech Republic','Czech Republic','CZE','203','yes','420','.cz'),(60,'CD','Democratic Republic of the Congo','Democratic Republic of the Congo','COD','180','yes','243','.cd'),(61,'DK','Denmark','Kingdom of Denmark','DNK','208','yes','45','.dk'),(62,'DJ','Djibouti','Republic of Djibouti','DJI','262','yes','253','.dj'),(63,'DM','Dominica','Commonwealth of Dominica','DMA','212','yes','1+767','.dm'),(64,'DO','Dominican Republic','Dominican Republic','DOM','214','yes','1+809, 8','.do'),(65,'EC','Ecuador','Republic of Ecuador','ECU','218','yes','593','.ec'),(66,'EG','Egypt','Arab Republic of Egypt','EGY','818','yes','20','.eg'),(67,'SV','El Salvador','Republic of El Salvador','SLV','222','yes','503','.sv'),(68,'GQ','Equatorial Guinea','Republic of Equatorial Guinea','GNQ','226','yes','240','.gq'),(69,'ER','Eritrea','State of Eritrea','ERI','232','yes','291','.er'),(70,'EE','Estonia','Republic of Estonia','EST','233','yes','372','.ee'),(71,'ET','Ethiopia','Federal Democratic Republic of Ethiopia','ETH','231','yes','251','.et'),(72,'FK','Falkland Islands (Malvinas)','The Falkland Islands (Malvinas)','FLK','238','no','500','.fk'),(73,'FO','Faroe Islands','The Faroe Islands','FRO','234','no','298','.fo'),(74,'FJ','Fiji','Republic of Fiji','FJI','242','yes','679','.fj'),(75,'FI','Finland','Republic of Finland','FIN','246','yes','358','.fi'),(76,'FR','France','French Republic','FRA','250','yes','33','.fr'),(77,'GF','French Guiana','French Guiana','GUF','254','no','594','.gf'),(78,'PF','French Polynesia','French Polynesia','PYF','258','no','689','.pf'),(79,'TF','French Southern Territories','French Southern Territories','ATF','260','no',NULL,'.tf'),(80,'GA','Gabon','Gabonese Republic','GAB','266','yes','241','.ga'),(81,'GM','Gambia','Republic of The Gambia','GMB','270','yes','220','.gm'),(82,'GE','Georgia','Georgia','GEO','268','yes','995','.ge'),(83,'DE','Germany','Federal Republic of Germany','DEU','276','yes','49','.de'),(84,'GH','Ghana','Republic of Ghana','GHA','288','yes','233','.gh'),(85,'GI','Gibraltar','Gibraltar','GIB','292','no','350','.gi'),(86,'GR','Greece','Hellenic Republic','GRC','300','yes','30','.gr'),(87,'GL','Greenland','Greenland','GRL','304','no','299','.gl'),(88,'GD','Grenada','Grenada','GRD','308','yes','1+473','.gd'),(89,'GP','Guadaloupe','Guadeloupe','GLP','312','no','590','.gp'),(90,'GU','Guam','Guam','GUM','316','no','1+671','.gu'),(91,'GT','Guatemala','Republic of Guatemala','GTM','320','yes','502','.gt'),(92,'GG','Guernsey','Guernsey','GGY','831','no','44','.gg'),(93,'GN','Guinea','Republic of Guinea','GIN','324','yes','224','.gn'),(94,'GW','Guinea-Bissau','Republic of Guinea-Bissau','GNB','624','yes','245','.gw'),(95,'GY','Guyana','Co-operative Republic of Guyana','GUY','328','yes','592','.gy'),(96,'HT','Haiti','Republic of Haiti','HTI','332','yes','509','.ht'),(97,'HM','Heard Island and McDonald Islands','Heard Island and McDonald Islands','HMD','334','no','NONE','.hm'),(98,'HN','Honduras','Republic of Honduras','HND','340','yes','504','.hn'),(99,'HK','Hong Kong','Hong Kong','HKG','344','no','852','.hk'),(100,'HU','Hungary','Hungary','HUN','348','yes','36','.hu'),(101,'IS','Iceland','Republic of Iceland','ISL','352','yes','354','.is'),(102,'IN','India','Republic of India','IND','356','yes','91','.in'),(103,'ID','Indonesia','Republic of Indonesia','IDN','360','yes','62','.id'),(104,'IR','Iran','Islamic Republic of Iran','IRN','364','yes','98','.ir'),(105,'IQ','Iraq','Republic of Iraq','IRQ','368','yes','964','.iq'),(106,'IE','Ireland','Ireland','IRL','372','yes','353','.ie'),(107,'IM','Isle of Man','Isle of Man','IMN','833','no','44','.im'),(108,'IL','Israel','State of Israel','ISR','376','yes','972','.il'),(109,'IT','Italy','Italian Republic','ITA','380','yes','39','.jm'),(110,'JM','Jamaica','Jamaica','JAM','388','yes','1+876','.jm'),(111,'JP','Japan','Japan','JPN','392','yes','81','.jp'),(112,'JE','Jersey','The Bailiwick of Jersey','JEY','832','no','44','.je'),(113,'JO','Jordan','Hashemite Kingdom of Jordan','JOR','400','yes','962','.jo'),(114,'KZ','Kazakhstan','Republic of Kazakhstan','KAZ','398','yes','7','.kz'),(115,'KE','Kenya','Republic of Kenya','KEN','404','yes','254','.ke'),(116,'KI','Kiribati','Republic of Kiribati','KIR','296','yes','686','.ki'),(117,'XK','Kosovo','Republic of Kosovo','---','---','some','381',''),(118,'KW','Kuwait','State of Kuwait','KWT','414','yes','965','.kw'),(119,'KG','Kyrgyzstan','Kyrgyz Republic','KGZ','417','yes','996','.kg'),(120,'LA','Laos','Lao People\'s Democratic Republic','LAO','418','yes','856','.la'),(121,'LV','Latvia','Republic of Latvia','LVA','428','yes','371','.lv'),(122,'LB','Lebanon','Republic of Lebanon','LBN','422','yes','961','.lb'),(123,'LS','Lesotho','Kingdom of Lesotho','LSO','426','yes','266','.ls'),(124,'LR','Liberia','Republic of Liberia','LBR','430','yes','231','.lr'),(125,'LY','Libya','Libya','LBY','434','yes','218','.ly'),(126,'LI','Liechtenstein','Principality of Liechtenstein','LIE','438','yes','423','.li'),(127,'LT','Lithuania','Republic of Lithuania','LTU','440','yes','370','.lt'),(128,'LU','Luxembourg','Grand Duchy of Luxembourg','LUX','442','yes','352','.lu'),(129,'MO','Macao','The Macao Special Administrative Region','MAC','446','no','853','.mo'),(130,'MK','North Macedonia','Republic of North Macedonia','MKD','807','yes','389','.mk'),(131,'MG','Madagascar','Republic of Madagascar','MDG','450','yes','261','.mg'),(132,'MW','Malawi','Republic of Malawi','MWI','454','yes','265','.mw'),(133,'MY','Malaysia','Malaysia','MYS','458','yes','60','.my'),(134,'MV','Maldives','Republic of Maldives','MDV','462','yes','960','.mv'),(135,'ML','Mali','Republic of Mali','MLI','466','yes','223','.ml'),(136,'MT','Malta','Republic of Malta','MLT','470','yes','356','.mt'),(137,'MH','Marshall Islands','Republic of the Marshall Islands','MHL','584','yes','692','.mh'),(138,'MQ','Martinique','Martinique','MTQ','474','no','596','.mq'),(139,'MR','Mauritania','Islamic Republic of Mauritania','MRT','478','yes','222','.mr'),(140,'MU','Mauritius','Republic of Mauritius','MUS','480','yes','230','.mu'),(141,'YT','Mayotte','Mayotte','MYT','175','no','262','.yt'),(142,'MX','Mexico','United Mexican States','MEX','484','yes','52','.mx'),(143,'FM','Micronesia','Federated States of Micronesia','FSM','583','yes','691','.fm'),(144,'MD','Moldava','Republic of Moldova','MDA','498','yes','373','.md'),(145,'MC','Monaco','Principality of Monaco','MCO','492','yes','377','.mc'),(146,'MN','Mongolia','Mongolia','MNG','496','yes','976','.mn'),(147,'ME','Montenegro','Montenegro','MNE','499','yes','382','.me'),(148,'MS','Montserrat','Montserrat','MSR','500','no','1+664','.ms'),(149,'MA','Morocco','Kingdom of Morocco','MAR','504','yes','212','.ma'),(150,'MZ','Mozambique','Republic of Mozambique','MOZ','508','yes','258','.mz'),(151,'MM','Myanmar (Burma)','Republic of the Union of Myanmar','MMR','104','yes','95','.mm'),(152,'NA','Namibia','Republic of Namibia','NAM','516','yes','264','.na'),(153,'NR','Nauru','Republic of Nauru','NRU','520','yes','674','.nr'),(154,'NP','Nepal','Federal Democratic Republic of Nepal','NPL','524','yes','977','.np'),(155,'NL','Netherlands','Kingdom of the Netherlands','NLD','528','yes','31','.nl'),(156,'NC','New Caledonia','New Caledonia','NCL','540','no','687','.nc'),(157,'NZ','New Zealand','New Zealand','NZL','554','yes','64','.nz'),(158,'NI','Nicaragua','Republic of Nicaragua','NIC','558','yes','505','.ni'),(159,'NE','Niger','Republic of Niger','NER','562','yes','227','.ne'),(160,'NG','Nigeria','Federal Republic of Nigeria','NGA','566','yes','234','.ng'),(161,'NU','Niue','Niue','NIU','570','some','683','.nu'),(162,'NF','Norfolk Island','Norfolk Island','NFK','574','no','672','.nf'),(163,'KP','North Korea','Democratic People\'s Republic of Korea','PRK','408','yes','850','.kp'),(164,'MP','Northern Mariana Islands','Northern Mariana Islands','MNP','580','no','1+670','.mp'),(165,'NO','Norway','Kingdom of Norway','NOR','578','yes','47','.no'),(166,'OM','Oman','Sultanate of Oman','OMN','512','yes','968','.om'),(167,'PK','Pakistan','Islamic Republic of Pakistan','PAK','586','yes','92','.pk'),(168,'PW','Palau','Republic of Palau','PLW','585','yes','680','.pw'),(169,'PS','Palestine','State of Palestine (or Occupied Palestinian Territory)','PSE','275','some','970','.ps'),(170,'PA','Panama','Republic of Panama','PAN','591','yes','507','.pa'),(171,'PG','Papua New Guinea','Independent State of Papua New Guinea','PNG','598','yes','675','.pg'),(172,'PY','Paraguay','Republic of Paraguay','PRY','600','yes','595','.py'),(173,'PE','Peru','Republic of Peru','PER','604','yes','51','.pe'),(174,'PH','Philippines','Republic of the Philippines','PHL','608','yes','63','.ph'),(175,'PN','Pitcairn','Pitcairn','PCN','612','no','NONE','.pn'),(176,'PL','Poland','Republic of Poland','POL','616','yes','48','.pl'),(177,'PT','Portugal','Portuguese Republic','PRT','620','yes','351','.pt'),(178,'PR','Puerto Rico','Commonwealth of Puerto Rico','PRI','630','no','1+939','.pr'),(179,'QA','Qatar','State of Qatar','QAT','634','yes','974','.qa'),(180,'RE','Reunion','R&eacute;union','REU','638','no','262','.re'),(181,'RO','Romania','Romania','ROU','642','yes','40','.ro'),(182,'RU','Russia','Russian Federation','RUS','643','yes','7','.ru'),(183,'RW','Rwanda','Republic of Rwanda','RWA','646','yes','250','.rw'),(184,'BL','Saint Barthelemy','Saint Barth&eacute;lemy','BLM','652','no','590','.bl'),(185,'SH','Saint Helena','Saint Helena, Ascension and Tristan da Cunha','SHN','654','no','290','.sh'),(186,'KN','Saint Kitts and Nevis','Federation of Saint Christopher and Nevis','KNA','659','yes','1+869','.kn'),(187,'LC','Saint Lucia','Saint Lucia','LCA','662','yes','1+758','.lc'),(188,'MF','Saint Martin','Saint Martin','MAF','663','no','590','.mf'),(189,'PM','Saint Pierre and Miquelon','Saint Pierre and Miquelon','SPM','666','no','508','.pm'),(190,'VC','Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','VCT','670','yes','1+784','.vc'),(191,'WS','Samoa','Independent State of Samoa','WSM','882','yes','685','.ws'),(192,'SM','San Marino','Republic of San Marino','SMR','674','yes','378','.sm'),(193,'ST','Sao Tome and Principe','Democratic Republic of S&atilde;o Tom&eacute; and Pr&iacute;ncipe','STP','678','yes','239','.st'),(194,'SA','Saudi Arabia','Kingdom of Saudi Arabia','SAU','682','yes','966','.sa'),(195,'SN','Senegal','Republic of Senegal','SEN','686','yes','221','.sn'),(196,'RS','Serbia','Republic of Serbia','SRB','688','yes','381','.rs'),(197,'SC','Seychelles','Republic of Seychelles','SYC','690','yes','248','.sc'),(198,'SL','Sierra Leone','Republic of Sierra Leone','SLE','694','yes','232','.sl'),(199,'SG','Singapore','Republic of Singapore','SGP','702','yes','65','.sg'),(200,'SX','Sint Maarten','Sint Maarten','SXM','534','no','1+721','.sx'),(201,'SK','Slovakia','Slovak Republic','SVK','703','yes','421','.sk'),(202,'SI','Slovenia','Republic of Slovenia','SVN','705','yes','386','.si'),(203,'SB','Solomon Islands','Solomon Islands','SLB','090','yes','677','.sb'),(204,'SO','Somalia','Somali Republic','SOM','706','yes','252','.so'),(205,'ZA','South Africa','Republic of South Africa','ZAF','710','yes','27','.za'),(206,'GS','South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands','SGS','239','no','500','.gs'),(207,'KR','South Korea','Republic of Korea','KOR','410','yes','82','.kr'),(208,'SS','South Sudan','Republic of South Sudan','SSD','728','yes','211','.ss'),(209,'ES','Spain','Kingdom of Spain','ESP','724','yes','34','.es'),(210,'LK','Sri Lanka','Democratic Socialist Republic of Sri Lanka','LKA','144','yes','94','.lk'),(211,'SD','Sudan','Republic of the Sudan','SDN','729','yes','249','.sd'),(212,'SR','Suriname','Republic of Suriname','SUR','740','yes','597','.sr'),(213,'SJ','Svalbard and Jan Mayen','Svalbard and Jan Mayen','SJM','744','no','47','.sj'),(214,'SZ','Swaziland','Kingdom of Swaziland','SWZ','748','yes','268','.sz'),(215,'SE','Sweden','Kingdom of Sweden','SWE','752','yes','46','.se'),(216,'CH','Switzerland','Swiss Confederation','CHE','756','yes','41','.ch'),(217,'SY','Syria','Syrian Arab Republic','SYR','760','yes','963','.sy'),(218,'TW','Taiwan','Republic of China (Taiwan)','TWN','158','former','886','.tw'),(219,'TJ','Tajikistan','Republic of Tajikistan','TJK','762','yes','992','.tj'),(220,'TZ','Tanzania','United Republic of Tanzania','TZA','834','yes','255','.tz'),(221,'TH','Thailand','Kingdom of Thailand','THA','764','yes','66','.th'),(222,'TL','Timor-Leste (East Timor)','Democratic Republic of Timor-Leste','TLS','626','yes','670','.tl'),(223,'TG','Togo','Togolese Republic','TGO','768','yes','228','.tg'),(224,'TK','Tokelau','Tokelau','TKL','772','no','690','.tk'),(225,'TO','Tonga','Kingdom of Tonga','TON','776','yes','676','.to'),(226,'TT','Trinidad and Tobago','Republic of Trinidad and Tobago','TTO','780','yes','1+868','.tt'),(227,'TN','Tunisia','Republic of Tunisia','TUN','788','yes','216','.tn'),(228,'TR','Turkey','Republic of Turkey','TUR','792','yes','90','.tr'),(229,'TM','Turkmenistan','Turkmenistan','TKM','795','yes','993','.tm'),(230,'TC','Turks and Caicos Islands','Turks and Caicos Islands','TCA','796','no','1+649','.tc'),(231,'TV','Tuvalu','Tuvalu','TUV','798','yes','688','.tv'),(232,'UG','Uganda','Republic of Uganda','UGA','800','yes','256','.ug'),(233,'UA','Ukraine','Ukraine','UKR','804','yes','380','.ua'),(234,'AE','United Arab Emirates','United Arab Emirates','ARE','784','yes','971','.ae'),(235,'GB','United Kingdom','United Kingdom of Great Britain and Nothern Ireland','GBR','826','yes','44','.uk'),(236,'US','United States','United States of America','USA','840','yes','1','.us'),(237,'UM','United States Minor Outlying Islands','United States Minor Outlying Islands','UMI','581','no','NONE','NONE'),(238,'UY','Uruguay','Eastern Republic of Uruguay','URY','858','yes','598','.uy'),(239,'UZ','Uzbekistan','Republic of Uzbekistan','UZB','860','yes','998','.uz'),(240,'VU','Vanuatu','Republic of Vanuatu','VUT','548','yes','678','.vu'),(241,'VA','Vatican City','State of the Vatican City','VAT','336','no','39','.va'),(242,'VE','Venezuela','Bolivarian Republic of Venezuela','VEN','862','yes','58','.ve'),(243,'VN','Vietnam','Socialist Republic of Vietnam','VNM','704','yes','84','.vn'),(244,'VG','Virgin Islands, British','British Virgin Islands','VGB','092','no','1+284','.vg'),(245,'VI','Virgin Islands, US','Virgin Islands of the United States','VIR','850','no','1+340','.vi'),(246,'WF','Wallis and Futuna','Wallis and Futuna','WLF','876','no','681','.wf'),(247,'EH','Western Sahara','Western Sahara','ESH','732','no','212','.eh'),(248,'YE','Yemen','Republic of Yemen','YEM','887','yes','967','.ye'),(249,'ZM','Zambia','Republic of Zambia','ZMB','894','yes','260','.zm'),(250,'ZW','Zimbabwe','Republic of Zimbabwe','ZWE','716','yes','263','.zw');
/*!40000 ALTER TABLE `tblcountries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcreditnote_refunds`
--

DROP TABLE IF EXISTS `tblcreditnote_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcreditnote_refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `refunded_on` date NOT NULL,
  `payment_mode` varchar(40) NOT NULL,
  `note` text DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcreditnote_refunds`
--

LOCK TABLES `tblcreditnote_refunds` WRITE;
/*!40000 ALTER TABLE `tblcreditnote_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcreditnote_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcreditnotes`
--

DROP TABLE IF EXISTS `tblcreditnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcreditnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 1,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `adminnote` text DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `clientnote` text DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) NOT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_credit_note` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `reference_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcreditnotes`
--

LOCK TABLES `tblcreditnotes` WRITE;
/*!40000 ALTER TABLE `tblcreditnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcreditnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcredits`
--

DROP TABLE IF EXISTS `tblcredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcredits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `credit_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcredits`
--

LOCK TABLES `tblcredits` WRITE;
/*!40000 ALTER TABLE `tblcredits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcredits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcurrencies`
--

DROP TABLE IF EXISTS `tblcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `decimal_separator` varchar(5) DEFAULT NULL,
  `thousand_separator` varchar(5) DEFAULT NULL,
  `placement` varchar(10) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcurrencies`
--

LOCK TABLES `tblcurrencies` WRITE;
/*!40000 ALTER TABLE `tblcurrencies` DISABLE KEYS */;
INSERT INTO `tblcurrencies` VALUES (1,'$','USD','.',',','before',1),(2,'â‚¬','EUR',',','.','before',0);
/*!40000 ALTER TABLE `tblcurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer_admins`
--

DROP TABLE IF EXISTS `tblcustomer_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomer_admins` (
  `staff_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_assigned` text NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer_admins`
--

LOCK TABLES `tblcustomer_admins` WRITE;
/*!40000 ALTER TABLE `tblcustomer_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomer_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer_groups`
--

DROP TABLE IF EXISTS `tblcustomer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer_groups`
--

LOCK TABLES `tblcustomer_groups` WRITE;
/*!40000 ALTER TABLE `tblcustomer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomers_groups`
--

DROP TABLE IF EXISTS `tblcustomers_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomers_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomers_groups`
--

LOCK TABLES `tblcustomers_groups` WRITE;
/*!40000 ALTER TABLE `tblcustomers_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomers_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomfields`
--

DROP TABLE IF EXISTS `tblcustomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldto` varchar(30) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `display_inline` tinyint(1) NOT NULL DEFAULT 0,
  `field_order` int(11) DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `show_on_pdf` int(11) NOT NULL DEFAULT 0,
  `show_on_ticket_form` tinyint(1) NOT NULL DEFAULT 0,
  `only_admin` tinyint(1) NOT NULL DEFAULT 0,
  `show_on_table` tinyint(1) NOT NULL DEFAULT 0,
  `show_on_client_portal` int(11) NOT NULL DEFAULT 0,
  `disalow_client_to_edit` int(11) NOT NULL DEFAULT 0,
  `bs_column` int(11) NOT NULL DEFAULT 12,
  `default_value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomfields`
--

LOCK TABLES `tblcustomfields` WRITE;
/*!40000 ALTER TABLE `tblcustomfields` DISABLE KEYS */;
INSERT INTO `tblcustomfields` VALUES (1,'projects','Charts','projects_charts',0,'textarea','',0,3,1,0,0,0,1,1,0,12,'imput this code');
/*!40000 ALTER TABLE `tblcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomfieldsvalues`
--

DROP TABLE IF EXISTS `tblcustomfieldsvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcustomfieldsvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `fieldto` varchar(15) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldto` (`fieldto`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomfieldsvalues`
--

LOCK TABLES `tblcustomfieldsvalues` WRITE;
/*!40000 ALTER TABLE `tblcustomfieldsvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomfieldsvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblday_off`
--

DROP TABLE IF EXISTS `tblday_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblday_off` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `off_reason` varchar(255) NOT NULL,
  `off_type` varchar(100) NOT NULL,
  `break_date` date NOT NULL,
  `timekeeping` varchar(45) DEFAULT NULL,
  `department` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0,
  `add_from` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblday_off`
--

LOCK TABLES `tblday_off` WRITE;
/*!40000 ALTER TABLE `tblday_off` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblday_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldepartments`
--

DROP TABLE IF EXISTS `tbldepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldepartments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `imap_username` varchar(191) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_from_header` tinyint(1) NOT NULL DEFAULT 0,
  `host` varchar(150) DEFAULT NULL,
  `password` mediumtext DEFAULT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(191) NOT NULL DEFAULT 'INBOX',
  `delete_after_import` int(11) NOT NULL DEFAULT 0,
  `calendar_id` mediumtext DEFAULT NULL,
  `hidefromclient` tinyint(1) NOT NULL DEFAULT 0,
  `manager_id` int(11) DEFAULT 0,
  `parent_id` int(11) DEFAULT 0,
  PRIMARY KEY (`departmentid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldepartments`
--

LOCK TABLES `tbldepartments` WRITE;
/*!40000 ALTER TABLE `tbldepartments` DISABLE KEYS */;
INSERT INTO `tbldepartments` VALUES (1,'Community manager','admin@ltysmx.com',NULL,0,'','','','INBOX',0,NULL,0,0,0);
/*!40000 ALTER TABLE `tbldepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldismissed_announcements`
--

DROP TABLE IF EXISTS `tbldismissed_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldismissed_announcements` (
  `dismissedannouncementid` int(11) NOT NULL AUTO_INCREMENT,
  `announcementid` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldismissed_announcements`
--

LOCK TABLES `tbldismissed_announcements` WRITE;
/*!40000 ALTER TABLE `tbldismissed_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldismissed_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemaillists`
--

DROP TABLE IF EXISTS `tblemaillists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemaillists` (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `creator` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL,
  PRIMARY KEY (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemaillists`
--

LOCK TABLES `tblemaillists` WRITE;
/*!40000 ALTER TABLE `tblemaillists` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemaillists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemailtemplates`
--

DROP TABLE IF EXISTS `tblemailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemailtemplates` (
  `emailtemplateid` int(11) NOT NULL AUTO_INCREMENT,
  `type` mediumtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  `language` varchar(40) DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `subject` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `fromname` mediumtext NOT NULL,
  `fromemail` varchar(100) DEFAULT NULL,
  `plaintext` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`emailtemplateid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemailtemplates`
--

LOCK TABLES `tblemailtemplates` WRITE;
/*!40000 ALTER TABLE `tblemailtemplates` DISABLE KEYS */;
INSERT INTO `tblemailtemplates` VALUES (1,'client','new-client-created','english','New Contact Added/Registered (Welcome Email)','Welcome aboard','Dear {contact_firstname} {contact_lastname}<br /><br />Thank you for registering on the <strong>{companyname}</strong> CRM System.<br /><br />We just wanted to say welcome.<br /><br />Please contact us if you need any help.<br /><br />Click here to view your profile: <a href=\"{crm_url}\">{crm_url}</a><br /><br />Kind Regards, <br />{email_signature}<br /><br />(This is an automated email, so please don\'t reply to this email address)','{companyname} | CRM','',0,1,0),(2,'invoice','invoice-send-to-client','english','Send Invoice to Customer','Invoice with number {invoice_number} created','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">We have prepared the following invoice for you: <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Invoice status</strong>: {invoice_status}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(3,'ticket','new-ticket-opened-admin','english','New Ticket Opened (Opened by Staff, Sent to Customer)','New Support Ticket Opened','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">New support ticket has been opened.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department:</strong> {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a><br /><br />Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(4,'ticket','ticket-reply','english','Ticket Reply (Sent to Customer)','New Ticket Reply','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">You have a new ticket reply to ticket <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket Subject:</strong> {ticket_subject}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(5,'ticket','ticket-autoresponse','english','New Ticket Opened - Autoresponse','New Support Ticket Opened','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Thank you for contacting our support team. A support ticket has now been opened for your request. You will be notified when a response is made by email.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(6,'invoice','invoice-payment-recorded','english','Invoice Payment Recorded (Sent to Customer)','Invoice Payment Recorded','<span style=\"font-size: 12pt;\">Hello {contact_firstname}&nbsp;{contact_lastname}<br /><br /></span>Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br /><br />Amount:&nbsp;<strong>{payment_total}<br /></strong>Date:&nbsp;<strong>{payment_date}</strong><br />Invoice number:&nbsp;<span style=\"font-size: 12pt;\"><strong># {invoice_number}<br /><br /></strong></span>-------------------------------------------------<br /><br />You can always view the invoice for this payment at the following link:&nbsp;<a href=\"{invoice_link}\"><span style=\"font-size: 12pt;\">{invoice_number}</span></a><br /><br />We are looking forward working with you.<br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(7,'invoice','invoice-overdue-notice','english','Invoice Overdue Notice','Invoice Overdue Notice - {invoice_number}','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">This is an overdue notice for invoice <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\">This invoice was due: {invoice_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(8,'invoice','invoice-already-send','english','Invoice Already Sent to Customer','Invoice # {invoice_number} ','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">At your request, here is the invoice with number <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(9,'ticket','new-ticket-created-staff','english','New Ticket Created (Opened by Customer, Sent to Staff Members)','New Ticket Created','<span style=\"font-size: 12pt;\">A new support ticket has been opened.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\" rel=\"noreferrer\">#{ticket_id}</a></span><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(10,'estimate','estimate-send-to-client','english','Send Estimate to Customer','Estimate # {estimate_number} created','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Please find the attached estimate <strong># {estimate_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Estimate status:</strong> {estimate_status}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">We look forward to your communication.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}<br /></span>','{companyname} | CRM','',0,1,0),(11,'ticket','ticket-reply-to-admin','english','Ticket Reply (Sent to Staff)','New Support Ticket Reply','<span style=\"font-size: 12pt;\">A new support ticket reply from {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(12,'estimate','estimate-already-send','english','Estimate Already Sent to Customer','Estimate # {estimate_number} ','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /> <br /><span style=\"font-size: 12pt;\">Thank you for your estimate request.</span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(13,'contract','contract-expiration','english','Contract Expiration Reminder (Sent to Customer Contacts)','Contract Expiration Reminder','<span style=\"font-size: 12pt;\">Dear {client_company}</span><br /><br /><span style=\"font-size: 12pt;\">This is a reminder that the following contract will expire soon:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {contract_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Description:</strong> {contract_description}</span><br /><span style=\"font-size: 12pt;\"><strong>Date Start:</strong> {contract_datestart}</span><br /><span style=\"font-size: 12pt;\"><strong>Date End:</strong> {contract_dateend}</span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(14,'tasks','task-assigned','english','New Task Assigned (Sent to Staff)','New Task Assigned to You - {task_name}','<span style=\"font-size: 12pt;\">Dear {staff_firstname}</span><br /><br /><span style=\"font-size: 12pt;\">You have been assigned to a new task:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}<br /></span><strong>Start Date:</strong> {task_startdate}<br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {task_priority}<br /><br /></span><span style=\"font-size: 12pt;\"><span>You can view the task on the following link</span>: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(15,'tasks','task-added-as-follower','english','Staff Member Added as Follower on Task (Sent to Staff)','You are added as follower on task - {task_name}','<span style=\"font-size: 12pt;\">Hi {staff_firstname}<br /></span><br /><span style=\"font-size: 12pt;\">You have been added as follower on the following task:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Start date:</strong> {task_startdate}</span><br /><br /><span>You can view the task on the following link</span><span>: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(16,'tasks','task-commented','english','New Comment on Task (Sent to Staff)','New Comment on Task - {task_name}','Dear {staff_firstname}<br /><br />A comment has been made on the following task:<br /><br /><strong>Name:</strong> {task_name}<br /><strong>Comment:</strong> {task_comment}<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(17,'tasks','task-added-attachment','english','New Attachment(s) on Task (Sent to Staff)','New Attachment on Task - {task_name}','Hi {staff_firstname}<br /><br /><strong>{task_user_take_action}</strong> added an attachment on the following task:<br /><br /><strong>Name:</strong> {task_name}<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(18,'estimate','estimate-declined-to-staff','english','Estimate Declined (Sent to Staff)','Customer Declined Estimate','<span style=\"font-size: 12pt;\">Hi</span><br /> <br /><span style=\"font-size: 12pt;\">Customer ({client_company}) declined estimate with number <strong># {estimate_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(19,'estimate','estimate-accepted-to-staff','english','Estimate Accepted (Sent to Staff)','Customer Accepted Estimate','<span style=\"font-size: 12pt;\">Hi</span><br /> <br /><span style=\"font-size: 12pt;\">Customer ({client_company}) accepted estimate with number <strong># {estimate_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(20,'proposals','proposal-client-accepted','english','Customer Action - Accepted (Sent to Staff)','Customer Accepted Proposal','<div>Hi<br /> <br />Client <strong>{proposal_proposal_to}</strong> accepted the following proposal:<br /> <br /><strong>Number:</strong> {proposal_number}<br /><strong>Subject</strong>: {proposal_subject}<br /><strong>Total</strong>: {proposal_total}<br /> <br />View the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /> <br />Kind Regards,<br />{email_signature}</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>','{companyname} | CRM','',0,1,0),(21,'proposals','proposal-send-to-customer','english','Send Proposal to Customer','Proposal With Number {proposal_number} Created','Dear {proposal_proposal_to}<br /><br />Please find our attached proposal.<br /><br />This proposal is valid until: {proposal_open_till}<br />You can view the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /><br />Please don\'t hesitate to comment online if you have any questions.<br /><br />We look forward to your communication.<br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(22,'proposals','proposal-client-declined','english','Customer Action - Declined (Sent to Staff)','Client Declined Proposal','Hi<br /> <br />Customer <strong>{proposal_proposal_to}</strong> declined the proposal <strong>{proposal_subject}</strong><br /> <br />View the proposal on the following link <a href=\"{proposal_link}\">{proposal_number}</a>&nbsp;or from the admin area.<br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(23,'proposals','proposal-client-thank-you','english','Thank You Email (Sent to Customer After Accept)','Thank for you accepting proposal','Dear {proposal_proposal_to}<br /> <br />Thank for for accepting the proposal.<br /> <br />We look forward to doing business with you.<br /> <br />We will contact you as soon as possible<br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(24,'proposals','proposal-comment-to-client','english','New Comment Â (Sent to Customer/Lead)','New Proposal Comment','Dear {proposal_proposal_to}<br /> <br />A new comment has been made on the following proposal: <strong>{proposal_number}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(25,'proposals','proposal-comment-to-admin','english','New Comment (Sent to Staff) ','New Proposal Comment','Hi<br /> <br />A new comment has been made to the proposal <strong>{proposal_subject}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{proposal_link}\">{proposal_number}</a>&nbsp;or from the admin area.<br /> <br />{email_signature}','{companyname} | CRM','',0,1,0),(26,'estimate','estimate-thank-you-to-customer','english','Thank You Email (Sent to Customer After Accept)','Thank for you accepting estimate','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /> <br /><span style=\"font-size: 12pt;\">Thank for for accepting the estimate.</span><br /> <br /><span style=\"font-size: 12pt;\">We look forward to doing business with you.</span><br /> <br /><span style=\"font-size: 12pt;\">We will contact you as soon as possible.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(27,'tasks','task-deadline-notification','english','Task Deadline Reminder - Sent to Assigned Members','Task Deadline Reminder','Hi {staff_firstname}&nbsp;{staff_lastname}<br /><br />This is an automated email from {companyname}.<br /><br />The task <strong>{task_name}</strong> deadline is on <strong>{task_duedate}</strong>. <br />This task is still not finished.<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(28,'contract','send-contract','english','Send Contract to Customer','Contract - {contract_subject}','<p><span style=\"font-size: 12pt;\">Hi&nbsp;{contact_firstname}&nbsp;{contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Please find the <a href=\"{contract_link}\">{contract_subject}</a> attached.<br /><br />Description: {contract_description}<br /><br /></span><span style=\"font-size: 12pt;\">Looking forward to hear from you.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(29,'invoice','invoice-payment-recorded-to-staff','english','Invoice Payment Recorded (Sent to Staff)','New Invoice Payment','<span style=\"font-size: 12pt;\">Hi</span><br /><br /><span style=\"font-size: 12pt;\">Customer recorded payment for invoice <strong># {invoice_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(30,'ticket','auto-close-ticket','english','Auto Close Ticket','Ticket Auto Closed','<p><span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Ticket {ticket_subject} has been auto close due to inactivity.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket #</strong>: <a href=\"{ticket_public_url}\">{ticket_id}</a></span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(31,'project','new-project-discussion-created-to-staff','english','New Project Discussion (Sent to Project Members)','New Project Discussion Created - {project_name}','<p>Hi {staff_firstname}<br /><br />New project discussion created from <strong>{discussion_creator}</strong><br /><br /><strong>Subject:</strong> {discussion_subject}<br /><strong>Description:</strong> {discussion_description}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(32,'project','new-project-discussion-created-to-customer','english','New Project Discussion (Sent to Customer Contacts)','New Project Discussion Created - {project_name}','<p>Hello {contact_firstname} {contact_lastname}<br /><br />New project discussion created from <strong>{discussion_creator}</strong><br /><br /><strong>Subject:</strong> {discussion_subject}<br /><strong>Description:</strong> {discussion_description}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(33,'project','new-project-file-uploaded-to-customer','english','New Project File(s) Uploaded (Sent to Customer Contacts)','New Project File(s) Uploaded - {project_name}','<p>Hello {contact_firstname} {contact_lastname}<br /><br />New project file is uploaded on <strong>{project_name}</strong> from <strong>{file_creator}</strong><br /><br />You can view the project on the following link: <a href=\"{project_link}\">{project_name}</a><br /><br />To view the file in our CRM you can click on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(34,'project','new-project-file-uploaded-to-staff','english','New Project File(s) Uploaded (Sent to Project Members)','New Project File(s) Uploaded - {project_name}','<p>Hello&nbsp;{staff_firstname}</p>\r\n<p>New project&nbsp;file is uploaded on&nbsp;<strong>{project_name}</strong> from&nbsp;<strong>{file_creator}</strong></p>\r\n<p>You can view the project on the following link: <a href=\"{project_link}\">{project_name}<br /></a><br />To view&nbsp;the file you can click on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a></p>\r\n<p>Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(35,'project','new-project-discussion-comment-to-customer','english','New Discussion Comment  (Sent to Customer Contacts)','New Discussion Comment','<p><span style=\"font-size: 12pt;\">Hello {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">New discussion comment has been made on <strong>{discussion_subject}</strong> from <strong>{comment_creator}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Discussion subject:</strong> {discussion_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Comment</strong>: {discussion_comment}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(36,'project','new-project-discussion-comment-to-staff','english','New Discussion Comment (Sent to Project Members)','New Discussion Comment','<p>Hi {staff_firstname}<br /><br />New discussion comment has been made on <strong>{discussion_subject}</strong> from <strong>{comment_creator}</strong><br /><br /><strong>Discussion subject:</strong> {discussion_subject}<br /><strong>Comment:</strong> {discussion_comment}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(37,'project','staff-added-as-project-member','english','Staff Added as Project Member','New project assigned to you','<p>Hi {staff_firstname}<br /><br />New project has been assigned to you.<br /><br />You can view the project on the following link <a href=\"{project_link}\">{project_name}</a><br /><br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(38,'estimate','estimate-expiry-reminder','english','Estimate Expiration Reminder','Estimate Expiration Reminder','<p><span style=\"font-size: 12pt;\">Hello {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">The estimate with <strong># {estimate_number}</strong> will expire on <strong>{estimate_expirydate}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(39,'proposals','proposal-expiry-reminder','english','Proposal Expiration Reminder','Proposal Expiration Reminder','<p>Hello {proposal_proposal_to}<br /><br />The proposal {proposal_number}&nbsp;will expire on <strong>{proposal_open_till}</strong><br /><br />You can view the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(40,'staff','new-staff-created','english','New Staff Created (Welcome Email)','You are added as staff member','Hi {staff_firstname}<br /><br />You are added as member on our CRM.<br /><br />Please use the following logic credentials:<br /><br /><strong>Email:</strong> {staff_email}<br /><strong>Password:</strong> {password}<br /><br />Click <a href=\"{admin_url}\">here </a>to login in the dashboard.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(41,'client','contact-forgot-password','english','Forgot Password','Create New Password','<h2>Create a new password</h2>\r\nForgot your password?<br /> To create a new password, just follow this link:<br /> <br /><a href=\"{reset_password_url}\">Reset Password</a><br /> <br /> You received this email, because it was requested by a {companyname}&nbsp;user. This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same. <br /><br /> {email_signature}','{companyname} | CRM','',0,1,0),(42,'client','contact-password-reseted','english','Password Reset - Confirmation','Your password has been changed','<strong><span style=\"font-size: 14pt;\">You have changed your password.</span><br /></strong><br /> Please, keep it in your records so you don\'t forget it.<br /> <br /> Your email address for login is: {contact_email}<br /><br />If this wasnt you, please contact us.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(43,'client','contact-set-password','english','Set New Password','Set new password on {companyname} ','<h2><span style=\"font-size: 14pt;\">Setup your new password on {companyname}</span></h2>\r\nPlease use the following link to set up your new password:<br /><br /><a href=\"{set_password_url}\">Set new password</a><br /><br />Keep it in your records so you don\'t forget it.<br /><br />Please set your new password in <strong>48 hours</strong>. After that, you won\'t be able to set your password because this link will expire.<br /><br />You can login at: <a href=\"{crm_url}\">{crm_url}</a><br />Your email address for login: {contact_email}<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(44,'staff','staff-forgot-password','english','Forgot Password','Create New Password','<h2><span style=\"font-size: 14pt;\">Create a new password</span></h2>\r\nForgot your password?<br /> To create a new password, just follow this link:<br /> <br /><a href=\"{reset_password_url}\">Reset Password</a><br /> <br /> You received this email, because it was requested by a <strong>{companyname}</strong>&nbsp;user. This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same. <br /><br /> {email_signature}','{companyname} | CRM','',0,1,0),(45,'staff','staff-password-reseted','english','Password Reset - Confirmation','Your password has been changed','<span style=\"font-size: 14pt;\"><strong>You have changed your password.<br /></strong></span><br /> Please, keep it in your records so you don\'t forget it.<br /> <br /> Your email address for login is: {staff_email}<br /><br /> If this wasnt you, please contact us.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(46,'project','assigned-to-project','english','New Project Created (Sent to Customer Contacts)','New Project Created','<p>Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}</p>\r\n<p>New project is assigned to your company.<br /><br /><strong>Project Name:</strong>&nbsp;{project_name}<br /><strong>Project Start Date:</strong>&nbsp;{project_start_date}</p>\r\n<p>You can view the project on the following link:&nbsp;<a href=\"{project_link}\">{project_name}</a></p>\r\n<p>We are looking forward hearing from you.<br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(47,'tasks','task-added-attachment-to-contacts','english','New Attachment(s) on Task (Sent to Customer Contacts)','New Attachment on Task - {task_name}','<span>Hi {contact_firstname} {contact_lastname}</span><br /><br /><strong>{task_user_take_action}</strong><span> added an attachment on the following task:</span><br /><br /><strong>Name:</strong><span> {task_name}</span><br /><br /><span>You can view the task on the following link: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span>Kind Regards,</span><br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(48,'tasks','task-commented-to-contacts','english','New Comment on Task (Sent to Customer Contacts)','New Comment on Task - {task_name}','<span>Dear {contact_firstname} {contact_lastname}</span><br /><br /><span>A comment has been made on the following task:</span><br /><br /><strong>Name:</strong><span> {task_name}</span><br /><strong>Comment:</strong><span> {task_comment}</span><br /><br /><span>You can view the task on the following link: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span>Kind Regards,</span><br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(49,'leads','new-lead-assigned','english','New Lead Assigned to Staff Member','New lead assigned to you','<p>Hello {lead_assigned}<br /><br />New lead is assigned to you.<br /><br /><strong>Lead Name:</strong>&nbsp;{lead_name}<br /><strong>Lead Email:</strong>&nbsp;{lead_email}<br /><br />You can view the lead on the following link: <a href=\"{lead_link}\">{lead_name}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(50,'client','client-statement','english','Statement - Account Summary','Account Statement from {statement_from} to {statement_to}','Dear {contact_firstname} {contact_lastname}, <br /><br />Its been a great experience working with you.<br /><br />Attached with this email is a list of all transactions for the period between {statement_from} to {statement_to}<br /><br />For your information your account balance due is total:&nbsp;{statement_balance_due}<br /><br />Please contact us if you need more information.<br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(51,'ticket','ticket-assigned-to-admin','english','New Ticket Assigned (Sent to Staff)','New support ticket has been assigned to you','<p><span style=\"font-size: 12pt;\">Hi</span></p>\r\n<p><span style=\"font-size: 12pt;\">A new support ticket&nbsp;has been assigned to you.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(52,'client','new-client-registered-to-admin','english','New Customer Registration (Sent to admins)','New Customer Registration','Hello.<br /><br />New customer registration on your customer portal:<br /><br /><strong>Firstname:</strong>&nbsp;{contact_firstname}<br /><strong>Lastname:</strong>&nbsp;{contact_lastname}<br /><strong>Company:</strong>&nbsp;{client_company}<br /><strong>Email:</strong>&nbsp;{contact_email}<br /><br />Best Regards','{companyname} | CRM','',0,1,0),(53,'leads','new-web-to-lead-form-submitted','english','Web to lead form submitted - Sent to lead','{lead_name} - We Received Your Request','Hello {lead_name}.<br /><br /><strong>Your request has been received.</strong><br /><br />This email is to let you know that we received your request and we will get back to you as soon as possible with more information.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,0,0),(54,'staff','two-factor-authentication','english','Two Factor Authentication','Confirm Your Login','<p>Hi {staff_firstname}</p>\r\n<p style=\"text-align: left;\">You received this email because you have enabled two factor authentication in your account.<br />Use the following code to confirm your login:</p>\r\n<p style=\"text-align: left;\"><span style=\"font-size: 18pt;\"><strong>{two_factor_auth_code}<br /><br /></strong><span style=\"font-size: 12pt;\">{email_signature}</span><strong><br /><br /><br /><br /></strong></span></p>','{companyname} | CRM','',0,1,0),(55,'project','project-finished-to-customer','english','Project Marked as Finished (Sent to Customer Contacts)','Project Marked as Finished','<p>Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}</p>\r\n<p>You are receiving this email because project&nbsp;<strong>{project_name}</strong> has been marked as finished. This project is assigned under your company and we just wanted to keep you up to date.<br /><br />You can view the project on the following link:&nbsp;<a href=\"{project_link}\">{project_name}</a></p>\r\n<p>If you have any questions don\'t hesitate to contact us.<br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(56,'credit_note','credit-note-send-to-client','english','Send Credit Note To Email','Credit Note With Number #{credit_note_number} Created','Dear&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />We have attached the credit note with number <strong>#{credit_note_number} </strong>for your reference.<br /><br /><strong>Date:</strong>&nbsp;{credit_note_date}<br /><strong>Total Amount:</strong>&nbsp;{credit_note_total}<br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(57,'tasks','task-status-change-to-staff','english','Task Status Changed (Sent to Staff)','Task Status Changed','<span style=\"font-size: 12pt;\">Hi {staff_firstname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>{task_user_take_action}</strong> marked task as <strong>{task_status}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(58,'tasks','task-status-change-to-contacts','english','Task Status Changed (Sent to Customer Contacts)','Task Status Changed','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>{task_user_take_action}</strong> marked task as <strong>{task_status}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(59,'staff','reminder-email-staff','english','Staff Reminder Email','You Have a New Reminder!','<p>Hello&nbsp;{staff_firstname}<br /><br /><strong>You have a new reminder&nbsp;linked to&nbsp;{staff_reminder_relation_name}!<br /><br />Reminder description:</strong><br />{staff_reminder_description}<br /><br />Click <a href=\"{staff_reminder_relation_link}\">here</a> to view&nbsp;<a href=\"{staff_reminder_relation_link}\">{staff_reminder_relation_name}</a><br /><br />Best Regards<br /><br /></p>','{companyname} | CRM','',0,1,0),(60,'contract','contract-comment-to-client','english','New Comment Â (Sent to Customer Contacts)','New Contract Comment','Dear {contact_firstname} {contact_lastname}<br /> <br />A new comment has been made on the following contract: <strong>{contract_subject}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{contract_link}\">{contract_subject}</a><br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(61,'contract','contract-comment-to-admin','english','New Comment (Sent to Staff) ','New Contract Comment','Hi {staff_firstname}<br /><br />A new comment has been made to the contract&nbsp;<strong>{contract_subject}</strong><br /><br />You can view and reply to the comment on the following link: <a href=\"{contract_link}\">{contract_subject}</a>&nbsp;or from the admin area.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(62,'subscriptions','send-subscription','english','Send Subscription to Customer','Subscription Created','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />We have prepared the subscription&nbsp;<strong>{subscription_name}</strong> for your company.<br /><br />Click <a href=\"{subscription_link}\">here</a> to review the subscription and subscribe.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(63,'subscriptions','subscription-payment-failed','english','Subscription Payment Failed','Your most recent invoice payment failed','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br br=\"\" />Unfortunately, your most recent invoice payment for&nbsp;<strong>{subscription_name}</strong> was declined.<br /><br />This could be due to a change in your card number, your card expiring,<br />cancellation of your credit card, or the card issuer not recognizing the<br />payment and therefore taking action to prevent it.<br /><br />Please update your payment information as soon as possible by logging in here:<br /><a href=\"{crm_url}/login\">{crm_url}/login</a><br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(64,'subscriptions','subscription-canceled','english','Subscription Canceled (Sent to customer primary contact)','Your subscription has been canceled','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />Your subscription&nbsp;<strong>{subscription_name} </strong>has been canceled, if you have any questions don\'t hesitate to contact us.<br /><br />It was a pleasure doing business with you.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(65,'subscriptions','subscription-payment-succeeded','english','Subscription Payment Succeeded (Sent to customer primary contact)','Subscription  Payment Receipt - {subscription_name}','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />This email is to let you know that we received your payment for subscription&nbsp;<strong>{subscription_name}&nbsp;</strong>of&nbsp;<strong><span>{payment_total}<br /><br /></span></strong>The invoice associated with it is now with status&nbsp;<strong>{invoice_status}<br /></strong><br />Thank you for your confidence.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(66,'contract','contract-expiration-to-staff','english','Contract Expiration Reminder (Sent to Staff)','Contract Expiration Reminder','Hi {staff_firstname}<br /><br /><span style=\"font-size: 12pt;\">This is a reminder that the following contract will expire soon:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {contract_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Description:</strong> {contract_description}</span><br /><span style=\"font-size: 12pt;\"><strong>Date Start:</strong> {contract_datestart}</span><br /><span style=\"font-size: 12pt;\"><strong>Date End:</strong> {contract_dateend}</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(67,'gdpr','gdpr-removal-request','english','Removal Request From Contact (Sent to administrators)','Data Removal Request Received','Hello&nbsp;{staff_firstname}&nbsp;{staff_lastname}<br /><br />Data removal has been requested by&nbsp;{contact_firstname} {contact_lastname}<br /><br />You can review this request and take proper actions directly from the admin area.','{companyname} | CRM','',0,1,0),(68,'gdpr','gdpr-removal-request-lead','english','Removal Request From Lead (Sent to administrators)','Data Removal Request Received','Hello&nbsp;{staff_firstname}&nbsp;{staff_lastname}<br /><br />Data removal has been requested by {lead_name}<br /><br />You can review this request and take proper actions directly from the admin area.<br /><br />To view the lead inside the admin area click here:&nbsp;<a href=\"{lead_link}\">{lead_link}</a>','{companyname} | CRM','',0,1,0),(69,'client','client-registration-confirmed','english','Customer Registration Confirmed','Your registration is confirmed','<p>Dear {contact_firstname} {contact_lastname}<br /><br />We just wanted to let you know that your registration at&nbsp;{companyname} is successfully confirmed and your account is now active.<br /><br />You can login at&nbsp;<a href=\"{crm_url}\">{crm_url}</a> with the email and password you provided during registration.<br /><br />Please contact us if you need any help.<br /><br />Kind Regards, <br />{email_signature}</p>\r\n<p><br />(This is an automated email, so please don\'t reply to this email address)</p>','{companyname} | CRM','',0,1,0),(70,'contract','contract-signed-to-staff','english','Contract Signed (Sent to Staff)','Customer Signed a Contract','Hi {staff_firstname}<br /><br />A contract with subject&nbsp;<strong>{contract_subject} </strong>has been successfully signed by the customer.<br /><br />You can view the contract at the following link: <a href=\"{contract_link}\">{contract_subject}</a>&nbsp;or from the admin area.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(71,'subscriptions','customer-subscribed-to-staff','english','Customer Subscribed to a Subscription (Sent to administrators and subscription creator)','Customer Subscribed to a Subscription','The customer <strong>{client_company}</strong> subscribed to a subscription with name&nbsp;<strong>{subscription_name}</strong><br /><br /><strong>ID</strong>:&nbsp;{subscription_id}<br /><strong>Subscription name</strong>:&nbsp;{subscription_name}<br /><strong>Subscription description</strong>:&nbsp;{subscription_description}<br /><br />You can view the subscription by clicking <a href=\"{subscription_link}\">here</a><br />\r\n<div style=\"text-align: center;\"><span style=\"font-size: 10pt;\">&nbsp;</span></div>\r\nBest Regards,<br />{email_signature}<br /><br /><span style=\"font-size: 10pt;\"><span style=\"color: #999999;\">You are receiving this email because you are either administrator or you are creator of the subscription.</span></span>','{companyname} | CRM','',0,1,0),(72,'client','contact-verification-email','english','Email Verification (Sent to Contact After Registration)','Verify Email Address','<p>Hello&nbsp;{contact_firstname}<br /><br />Please click the button below to verify your email address.<br /><br /><a href=\"{email_verification_url}\">Verify Email Address</a><br /><br />If you did not create an account, no further action is required</p>\r\n<p><br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(73,'client','new-customer-profile-file-uploaded-to-staff','english','New Customer Profile File(s) Uploaded (Sent to Staff)','Customer Uploaded New File(s) in Profile','Hi!<br /><br />New file(s) is uploaded into the customer ({client_company}) profile by&nbsp;{contact_firstname}<br /><br />You can check the uploaded files into the admin area by clicking <a href=\"{customer_profile_files_admin_link}\">here</a> or at the following link:&nbsp;{customer_profile_files_admin_link}<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(74,'staff','event-notification-to-staff','english','Event Notification (Calendar)','Upcoming Event - {event_title}','Hi {staff_firstname}! <br /><br />This is a reminder for event <a href=\\\"{event_link}\\\">{event_title}</a> scheduled at {event_start_date}. <br /><br />Regards.','','',0,1,0),(75,'subscriptions','subscription-payment-requires-action','english','Credit Card Authorization Required - SCA','Important: Confirm your subscription {subscription_name} payment','<p>Hello {contact_firstname}</p>\r\n<p><strong>Your bank sometimes requires an additional step to make sure an online transaction was authorized.</strong><br /><br />Because of European regulation to protect consumers, many online payments now require two-factor authentication. Your bank ultimately decides when authentication is required to confirm a payment, but you may notice this step when you start paying for a service or when the cost changes.<br /><br />In order to pay the subscription <strong>{subscription_name}</strong>, you will need to&nbsp;confirm your payment by clicking on the follow link: <strong><a href=\"{subscription_authorize_payment_link}\">{subscription_authorize_payment_link}</a></strong><br /><br />To view the subscription, please click at the following link: <a href=\"{subscription_link}\"><span>{subscription_link}</span></a><br />or you can login in our dedicated area here: <a href=\"{crm_url}/login\">{crm_url}/login</a> in case you want to update your credit card or view the subscriptions you are subscribed.<br /><br />Best Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(76,'invoice','invoice-due-notice','english','Invoice Due Notice','Your {invoice_number} will be due soon','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}<br /><br /></span>You invoice <span style=\"font-size: 12pt;\"><strong># {invoice_number} </strong>will be due on <strong>{invoice_duedate}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(77,'estimate_request','estimate-request-submitted-to-staff','english','Estimate Request Submitted (Sent to Staff)','New Estimate Request Submitted','<span> Hello,&nbsp;</span><br /><br />{estimate_request_email} submitted an estimate request via the {estimate_request_form_name} form.<br /><br />You can view the request at the following link: <a href=\"{estimate_request_link}\">{estimate_request_link}</a><br /><br />==<br /><br />{estimate_request_submitted_data}<br /><br />Kind Regards,<br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(78,'estimate_request','estimate-request-assigned','english','Estimate Request Assigned (Sent to Staff)','New Estimate Request Assigned','<span> Hello {estimate_request_assigned},&nbsp;</span><br /><br />Estimate request #{estimate_request_id} has been assigned to you.<br /><br />You can view the request at the following link: <a href=\"{estimate_request_link}\">{estimate_request_link}</a><br /><br />Kind Regards,<br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(79,'estimate_request','estimate-request-received-to-user','english','Estimate Request Received (Sent to User)','Estimate Request Received','Hello,<br /><br /><strong>Your request has been received.</strong><br /><br />This email is to let you know that we received your request and we will get back to you as soon as possible with more information.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,0,0),(80,'notifications','non-billed-tasks-reminder','english','Non-billed tasks reminder (sent to selected staff members)','Action required: Completed tasks are not billed','Hello {staff_firstname}<br><br>The following tasks are marked as complete but not yet billed:<br><br>{unbilled_tasks_list}<br><br>Kind Regards,<br><br>{email_signature}','{companyname} | CRM','',0,1,0),(81,'invoice','invoices-batch-payments','english','Invoices Payments Recorded in Batch (Sent to Customer)','We have received your payments','Hello {contact_firstname} {contact_lastname}<br><br>Thank you for the payments. Please find the payments details below:<br><br>{batch_payments_list}<br><br>We are looking forward working with you.<br><br>Kind Regards,<br><br>{email_signature}','{companyname} | CRM','',0,1,0),(82,'inventory_warning','inventory-warning-to-staff','english','Inventory warning (Sent to staff)','Inventory warning','Hi {staff_name}! <br /><br />This is a inventory warning<br />{<span 12pt=\"\">notification_content</span>}. <br /><br />Regards.','{companyname} | CRM',NULL,0,1,0),(83,'purchase_order','purchase-order-to-contact','english','Purchase Order (Sent to contact)','Purchase Order','<span style=\\\"font-size: 12pt;\\\"> Hello !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> We would like to share with you a link of Purchase Order information with the number {po_number} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Please click on the link to view information: {public_link}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(84,'approve','send-request-approve','english','Send Approval Request','Require Approval','<p>Hi {staff_firstname}<br /><br />You have received a request to approve the {object_type}.<br /><br />You can view the {object_type} on the following link <a href=\"{object_link}\">{object_name}</a><br /><br />{email_signature}</p>','{companyname} | CRM',NULL,0,1,0),(85,'approve','send-request-approve','vietnamese','Gửi yêu cầu phê duyệt','Yêu cầu phê duyệt','Xin ch&agrave;o {staff_firstname} {staff_lastname}<br /><br />Bạn đã nhận được yêu cầu phê duyệt {object_type} mới.<br /><br />Bạn c&oacute; thể xem hóa đơn tại đ&acirc;y&nbsp;<a href=\"{object_link}\">{object_name}</a><br /><br />{email_signature}','{companyname} | CRM',NULL,0,1,0),(86,'approve','send_rejected','english','Send Rejected','The {object_type} has been rejected','<p>Hi {staff_firstname}<br /><br />Your {object_type} has been rejected.<br /><br />You can view the {object_type} on the following link <a href=\"{object_link}\">{object_name}</a><br /><br />{email_signature}</p>','{companyname} | CRM',NULL,0,1,0),(87,'approve','send_rejected','vietnamese','Gửi từ chối','{object_type} đã bị từ chối','Xin ch&agrave;o {staff_firstname} {staff_lastname}<br /><br />{object_type} của bạn đã bị từ chối.<br /><br />Bạn c&oacute; thể xem {object_type} tại đ&acirc;y&nbsp;<a href=\"{object_link}\">{object_name}</a><br /><br />{email_signature}','{companyname} | CRM',NULL,0,1,0),(88,'approve','send_approve','english','Send Approve','The {object_type} has been approved','<p>Hi {staff_firstname}<br /><br />Your {object_type} has been approved.<br /><br />You can view the {object_type} on the following link <a href=\"{object_link}\">{object_name}</a><br /><br />{email_signature}</p>','{companyname} | CRM',NULL,0,1,0),(89,'approve','send_approve','vietnamese','Gửi phê duyệt','{object_type} đã được phê duyệt','Xin ch&agrave;o {staff_firstname} {staff_lastname}<br /><br />{object_type} của bạn đã được phê duyệt.<br /><br />Bạn c&oacute; thể xem {object_type} tại đ&acirc;y&nbsp;<a href=\"{object_link}\">{object_name}</a><br /><br />{email_signature}','{companyname} | CRM',NULL,0,1,0),(90,'order','order-to-admin','english','Success Order For Admin','Order Paid Successfully','<em>You received a new order {order_id} with a total amount of {total} {currency}  {invoice_number}{invoice_link}</em>','{companyname}',NULL,0,1,0),(91,'order','order-to-client','english','Success Order For Customer','Order Placed Successfully','<em>Your payment for order {order_id} is paid through {invoice_number}{invoice_link} with a total amount of {total} {currency}</em>','{companyname}',NULL,0,1,0);
/*!40000 ALTER TABLE `tblemailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestimate_request_forms`
--

DROP TABLE IF EXISTS `tblestimate_request_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblestimate_request_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `form_data` mediumtext DEFAULT NULL,
  `recaptcha` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `submit_btn_name` varchar(100) DEFAULT NULL,
  `submit_btn_bg_color` varchar(10) DEFAULT '#84c529',
  `submit_btn_text_color` varchar(10) DEFAULT '#ffffff',
  `success_submit_msg` text DEFAULT NULL,
  `submit_action` int(11) DEFAULT 0,
  `submit_redirect_url` mediumtext DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `notify_type` varchar(100) DEFAULT NULL,
  `notify_ids` mediumtext DEFAULT NULL,
  `responsible` int(11) DEFAULT NULL,
  `notify_request_submitted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestimate_request_forms`
--

LOCK TABLES `tblestimate_request_forms` WRITE;
/*!40000 ALTER TABLE `tblestimate_request_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblestimate_request_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestimate_request_status`
--

DROP TABLE IF EXISTS `tblestimate_request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblestimate_request_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `flag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestimate_request_status`
--

LOCK TABLES `tblestimate_request_status` WRITE;
/*!40000 ALTER TABLE `tblestimate_request_status` DISABLE KEYS */;
INSERT INTO `tblestimate_request_status` VALUES (1,'Cancelled',1,'#808080','cancelled'),(2,'Processing',2,'#007bff','processing'),(3,'Completed',3,'#28a745','completed');
/*!40000 ALTER TABLE `tblestimate_request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestimate_requests`
--

DROP TABLE IF EXISTS `tblestimate_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblestimate_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `submission` longtext NOT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `date_estimated` datetime DEFAULT NULL,
  `from_form_id` int(11) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `default_language` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestimate_requests`
--

LOCK TABLES `tblestimate_requests` WRITE;
/*!40000 ALTER TABLE `tblestimate_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblestimate_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblestimates`
--

DROP TABLE IF EXISTS `tblestimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblestimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `clientnote` text DEFAULT NULL,
  `adminnote` text DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT 0,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `pipeline_order` int(11) DEFAULT 1,
  `is_expiry_notified` int(11) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblestimates`
--

LOCK TABLES `tblestimates` WRITE;
/*!40000 ALTER TABLE `tblestimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblestimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblevents`
--

DROP TABLE IF EXISTS `tblevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblevents` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext NOT NULL,
  `description` text DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  `isstartnotified` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_before` int(11) NOT NULL DEFAULT 0,
  `reminder_before_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblevents`
--

LOCK TABLES `tblevents` WRITE;
/*!40000 ALTER TABLE `tblevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexpenses`
--

DROP TABLE IF EXISTS `tblexpenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexpenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) NOT NULL DEFAULT 0,
  `reference_no` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `expense_name` varchar(191) DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `billable` int(11) DEFAULT 0,
  `invoiceid` int(11) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `custom_recurring` int(11) NOT NULL DEFAULT 0,
  `last_recurring_date` date DEFAULT NULL,
  `create_invoice_billable` tinyint(1) DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) NOT NULL,
  `recurring_from` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `vendor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexpenses`
--

LOCK TABLES `tblexpenses` WRITE;
/*!40000 ALTER TABLE `tblexpenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexpenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexpenses_categories`
--

DROP TABLE IF EXISTS `tblexpenses_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexpenses_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexpenses_categories`
--

LOCK TABLES `tblexpenses_categories` WRITE;
/*!40000 ALTER TABLE `tblexpenses_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexpenses_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfiles`
--

DROP TABLE IF EXISTS `tblfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(40) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT 0,
  `attachment_key` varchar(32) DEFAULT NULL,
  `external` varchar(40) DEFAULT NULL,
  `external_link` text DEFAULT NULL,
  `thumbnail_link` text DEFAULT NULL COMMENT 'For external usage',
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT 0,
  `task_comment_id` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfiles`
--

LOCK TABLES `tblfiles` WRITE;
/*!40000 ALTER TABLE `tblfiles` DISABLE KEYS */;
INSERT INTO `tblfiles` VALUES (1,1,'task','Captura de Pantalla 2022-07-13 a la(s) 10.19.31.png','image/png',0,'251515981f3dab136626027a67e7ac5a',NULL,NULL,NULL,1,0,0,'2022-07-13 10:19:49'),(2,3,'task','Captura de Pantalla 2022-07-13 a la(s) 10.28.06.png','image/png',0,'12cca5f22747507e8220541b5d73fc98',NULL,NULL,NULL,1,0,0,'2022-07-13 10:28:14'),(3,3,'task','Captura de Pantalla 2022-07-13 a la(s) 10.29.05.png','image/png',0,'b745f6d9da1c1e85e4286a35e8112dfb',NULL,NULL,NULL,1,0,0,'2022-07-13 10:29:15'),(5,10,'task','Captura de Pantalla 2022-07-13 a la(s) 23.22.53.png','image/png',0,'f0456a960fb973427a8e9d11dfea52e1',NULL,NULL,NULL,1,0,0,'2022-07-13 23:23:09'),(6,10,'task','Captura de Pantalla 2022-07-13 a la(s) 23.23.55.png','image/png',0,'c09f7677c9c323b0fd97c5e597c3442f',NULL,NULL,NULL,1,0,0,'2022-07-13 23:24:04'),(7,8,'task','sitemap.txt','text/plain',0,'72ef387dda508437a14c2b4134a11fd6',NULL,NULL,NULL,1,0,0,'2022-07-13 23:27:27'),(8,11,'task','Captura de Pantalla 2022-07-18 a la(s) 11.35.48.png','image/png',0,'c09ad8243e0aaed3e3bc14f8d6d857f6',NULL,NULL,NULL,1,0,0,'2022-07-18 16:02:04');
/*!40000 ALTER TABLE `tblfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblform_question_box`
--

DROP TABLE IF EXISTS `tblform_question_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblform_question_box` (
  `boxid` int(11) NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblform_question_box`
--

LOCK TABLES `tblform_question_box` WRITE;
/*!40000 ALTER TABLE `tblform_question_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblform_question_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblform_question_box_description`
--

DROP TABLE IF EXISTS `tblform_question_box_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblform_question_box_description` (
  `questionboxdescriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblform_question_box_description`
--

LOCK TABLES `tblform_question_box_description` WRITE;
/*!40000 ALTER TABLE `tblform_question_box_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblform_question_box_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblform_questions`
--

DROP TABLE IF EXISTS `tblform_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblform_questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `question_order` int(11) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblform_questions`
--

LOCK TABLES `tblform_questions` WRITE;
/*!40000 ALTER TABLE `tblform_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblform_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblform_results`
--

DROP TABLE IF EXISTS `tblform_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblform_results` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `boxid` int(11) NOT NULL,
  `boxdescriptionid` int(11) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int(11) NOT NULL,
  `answer` text DEFAULT NULL,
  `resultsetid` int(11) NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblform_results`
--

LOCK TABLES `tblform_results` WRITE;
/*!40000 ALTER TABLE `tblform_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblform_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgdpr_requests`
--

DROP TABLE IF EXISTS `tblgdpr_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgdpr_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `lead_id` int(11) NOT NULL DEFAULT 0,
  `request_type` varchar(191) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_from` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgdpr_requests`
--

LOCK TABLES `tblgdpr_requests` WRITE;
/*!40000 ALTER TABLE `tblgdpr_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgdpr_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoals`
--

DROP TABLE IF EXISTS `tblgoals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `goal_type` int(11) NOT NULL,
  `contract_type` int(11) NOT NULL DEFAULT 0,
  `achievement` int(11) NOT NULL,
  `notify_when_fail` tinyint(1) NOT NULL DEFAULT 1,
  `notify_when_achieve` tinyint(1) NOT NULL DEFAULT 1,
  `notified` int(11) NOT NULL DEFAULT 0,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoals`
--

LOCK TABLES `tblgoals` WRITE;
/*!40000 ALTER TABLE `tblgoals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoods_delivery`
--

DROP TABLE IF EXISTS `tblgoods_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoods_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` int(11) DEFAULT NULL COMMENT 'type goods delivery',
  `rel_document` int(11) DEFAULT NULL COMMENT 'document id of goods delivery',
  `customer_code` text DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `to_` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL COMMENT 'the reason delivery',
  `staff_id` int(11) DEFAULT NULL COMMENT 'salesman',
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `goods_delivery_code` varchar(100) DEFAULT NULL COMMENT 'số chứng từ xuất kho',
  `warehouse_id` int(11) DEFAULT NULL,
  `total_money` varchar(200) DEFAULT NULL,
  `approval` int(11) DEFAULT 0 COMMENT 'status approval ',
  `addedfrom` int(11) DEFAULT NULL,
  `total_discount` varchar(100) DEFAULT NULL,
  `after_discount` varchar(100) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `project` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `requester` int(11) DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `pr_order_id` int(11) DEFAULT NULL,
  `type_of_delivery` varchar(100) DEFAULT 'total',
  `additional_discount` decimal(15,2) DEFAULT 0.00,
  `sub_total` decimal(15,2) DEFAULT 0.00,
  `delivery_status` varchar(100) DEFAULT 'ready_for_packing',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoods_delivery`
--

LOCK TABLES `tblgoods_delivery` WRITE;
/*!40000 ALTER TABLE `tblgoods_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoods_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoods_delivery_detail`
--

DROP TABLE IF EXISTS `tblgoods_delivery_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoods_delivery_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_delivery_id` int(11) NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `unit_id` text DEFAULT NULL,
  `quantities` text DEFAULT NULL,
  `unit_price` varchar(100) DEFAULT NULL,
  `total_money` varchar(200) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `discount_money` varchar(100) DEFAULT NULL,
  `available_quantity` varchar(100) DEFAULT NULL,
  `tax_id` varchar(100) DEFAULT NULL,
  `total_after_discount` varchar(100) DEFAULT NULL,
  `expiry_date` text DEFAULT NULL,
  `lot_number` text DEFAULT NULL,
  `guarantee_period` text DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `sub_total` decimal(15,2) DEFAULT 0.00,
  `packing_qty` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoods_delivery_detail`
--

LOCK TABLES `tblgoods_delivery_detail` WRITE;
/*!40000 ALTER TABLE `tblgoods_delivery_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoods_delivery_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoods_delivery_invoices_pr_orders`
--

DROP TABLE IF EXISTS `tblgoods_delivery_invoices_pr_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoods_delivery_invoices_pr_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL COMMENT 'goods_delivery_id',
  `rel_type` int(11) DEFAULT NULL COMMENT 'invoice_id or purchase order id',
  `type` varchar(100) DEFAULT NULL COMMENT 'invoice,  purchase_orders',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoods_delivery_invoices_pr_orders`
--

LOCK TABLES `tblgoods_delivery_invoices_pr_orders` WRITE;
/*!40000 ALTER TABLE `tblgoods_delivery_invoices_pr_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoods_delivery_invoices_pr_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoods_receipt`
--

DROP TABLE IF EXISTS `tblgoods_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoods_receipt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(100) DEFAULT NULL,
  `supplier_name` text DEFAULT NULL,
  `deliver_name` text DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pr_order_id` int(11) DEFAULT NULL COMMENT 'code puchase request agree',
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `goods_receipt_code` varchar(100) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `total_tax_money` varchar(100) DEFAULT NULL,
  `total_goods_money` varchar(100) DEFAULT NULL,
  `value_of_inventory` varchar(100) DEFAULT NULL,
  `total_money` varchar(100) DEFAULT NULL COMMENT 'total_money = total_tax_money +total_goods_money ',
  `addedfrom` int(11) DEFAULT NULL,
  `approval` int(11) DEFAULT 0,
  `project` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `requester` int(11) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoods_receipt`
--

LOCK TABLES `tblgoods_receipt` WRITE;
/*!40000 ALTER TABLE `tblgoods_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoods_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoods_receipt_detail`
--

DROP TABLE IF EXISTS `tblgoods_receipt_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoods_receipt_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_receipt_id` int(11) NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `unit_id` text DEFAULT NULL,
  `quantities` text DEFAULT NULL,
  `unit_price` varchar(100) DEFAULT NULL,
  `tax` varchar(100) DEFAULT NULL,
  `tax_money` varchar(100) DEFAULT NULL,
  `goods_money` varchar(100) DEFAULT NULL,
  `date_manufacture` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `discount_money` varchar(100) DEFAULT NULL,
  `lot_number` varchar(100) DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `sub_total` decimal(15,2) DEFAULT 0.00,
  `tax_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoods_receipt_detail`
--

LOCK TABLES `tblgoods_receipt_detail` WRITE;
/*!40000 ALTER TABLE `tblgoods_receipt_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoods_receipt_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgoods_transaction_detail`
--

DROP TABLE IF EXISTS `tblgoods_transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgoods_transaction_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_receipt_id` int(11) DEFAULT NULL COMMENT 'id_goods_receipt_id or goods_delivery_id',
  `goods_id` int(11) NOT NULL COMMENT ' is id commodity',
  `old_quantity` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `commodity_id` int(11) NOT NULL,
  `warehouse_id` text NOT NULL,
  `note` text DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '1:Goods receipt note 2:Goods delivery note',
  `purchase_price` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `expiry_date` text DEFAULT NULL,
  `lot_number` text DEFAULT NULL,
  `from_stock_name` int(11) DEFAULT NULL,
  `to_stock_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgoods_transaction_detail`
--

LOCK TABLES `tblgoods_transaction_detail` WRITE;
/*!40000 ALTER TABLE `tblgoods_transaction_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgoods_transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgroup_checklist`
--

DROP TABLE IF EXISTS `tblgroup_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgroup_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `meta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgroup_checklist`
--

LOCK TABLES `tblgroup_checklist` WRITE;
/*!40000 ALTER TABLE `tblgroup_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgroup_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgroup_checklist_allocation`
--

DROP TABLE IF EXISTS `tblgroup_checklist_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgroup_checklist_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `meta` varchar(100) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgroup_checklist_allocation`
--

LOCK TABLES `tblgroup_checklist_allocation` WRITE;
/*!40000 ALTER TABLE `tblgroup_checklist_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgroup_checklist_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_allocation_asset`
--

DROP TABLE IF EXISTS `tblhr_allocation_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_allocation_asset` (
  `allocation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned NOT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
  `assets_amount` int(11) unsigned NOT NULL,
  `status_allocation` int(11) unsigned DEFAULT 0 COMMENT '1: Allocated 0: Unallocated',
  PRIMARY KEY (`allocation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_allocation_asset`
--

LOCK TABLES `tblhr_allocation_asset` WRITE;
/*!40000 ALTER TABLE `tblhr_allocation_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_allocation_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_allowance_type`
--

DROP TABLE IF EXISTS `tblhr_allowance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_allowance_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) NOT NULL,
  `allowance_val` decimal(15,2) NOT NULL,
  `taxable` tinyint(1) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_allowance_type`
--

LOCK TABLES `tblhr_allowance_type` WRITE;
/*!40000 ALTER TABLE `tblhr_allowance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_allowance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_checklist_allocation`
--

DROP TABLE IF EXISTS `tblhr_checklist_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_checklist_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_checklist_allocation`
--

LOCK TABLES `tblhr_checklist_allocation` WRITE;
/*!40000 ALTER TABLE `tblhr_checklist_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_checklist_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_dependent_person`
--

DROP TABLE IF EXISTS `tblhr_dependent_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_dependent_person` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int(11) unsigned DEFAULT NULL,
  `dependent_name` varchar(100) DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `dependent_bir` date DEFAULT NULL,
  `start_month` date DEFAULT NULL,
  `end_month` date DEFAULT NULL,
  `dependent_iden` varchar(20) NOT NULL,
  `reason` longtext DEFAULT NULL,
  `status` int(11) unsigned DEFAULT 0,
  `status_comment` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`dependent_iden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_dependent_person`
--

LOCK TABLES `tblhr_dependent_person` WRITE;
/*!40000 ALTER TABLE `tblhr_dependent_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_dependent_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_education`
--

DROP TABLE IF EXISTS `tblhr_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `programe_id` int(11) DEFAULT NULL,
  `training_programs_name` text NOT NULL,
  `training_places` text DEFAULT NULL,
  `training_time_from` datetime DEFAULT NULL,
  `training_time_to` datetime DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `training_result` varchar(150) DEFAULT NULL,
  `degree` varchar(150) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_education`
--

LOCK TABLES `tblhr_education` WRITE;
/*!40000 ALTER TABLE `tblhr_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_group_checklist_allocation`
--

DROP TABLE IF EXISTS `tblhr_group_checklist_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_group_checklist_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `meta` varchar(100) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_group_checklist_allocation`
--

LOCK TABLES `tblhr_group_checklist_allocation` WRITE;
/*!40000 ALTER TABLE `tblhr_group_checklist_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_group_checklist_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_job_p`
--

DROP TABLE IF EXISTS `tblhr_job_p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_job_p` (
  `job_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_job_p`
--

LOCK TABLES `tblhr_job_p` WRITE;
/*!40000 ALTER TABLE `tblhr_job_p` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_job_p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_job_position`
--

DROP TABLE IF EXISTS `tblhr_job_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_job_position` (
  `position_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(200) NOT NULL,
  `job_position_description` text DEFAULT NULL,
  `job_p_id` int(11) unsigned NOT NULL,
  `position_code` varchar(50) DEFAULT NULL,
  `department_id` text DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_job_position`
--

LOCK TABLES `tblhr_job_position` WRITE;
/*!40000 ALTER TABLE `tblhr_job_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_job_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_jp_interview_training`
--

DROP TABLE IF EXISTS `tblhr_jp_interview_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_jp_interview_training` (
  `training_process_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_position_id` longtext DEFAULT NULL,
  `training_name` varchar(100) DEFAULT NULL,
  `training_type` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `position_training_id` text DEFAULT NULL,
  `mint_point` int(11) DEFAULT NULL,
  `additional_training` varchar(100) DEFAULT '',
  `staff_id` text DEFAULT NULL,
  `time_to_start` date DEFAULT NULL,
  `time_to_end` date DEFAULT NULL,
  PRIMARY KEY (`training_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_jp_interview_training`
--

LOCK TABLES `tblhr_jp_interview_training` WRITE;
/*!40000 ALTER TABLE `tblhr_jp_interview_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_jp_interview_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_jp_salary_scale`
--

DROP TABLE IF EXISTS `tblhr_jp_salary_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_jp_salary_scale` (
  `salary_scale_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_position_id` int(11) unsigned NOT NULL,
  `rel_type` varchar(100) DEFAULT NULL COMMENT 'salary:allowance:insurance',
  `rel_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`salary_scale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_jp_salary_scale`
--

LOCK TABLES `tblhr_jp_salary_scale` WRITE;
/*!40000 ALTER TABLE `tblhr_jp_salary_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_jp_salary_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_knowedge_base_article_feedback`
--

DROP TABLE IF EXISTS `tblhr_knowedge_base_article_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_knowedge_base_article_feedback` (
  `articleanswerid` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_knowedge_base_article_feedback`
--

LOCK TABLES `tblhr_knowedge_base_article_feedback` WRITE;
/*!40000 ALTER TABLE `tblhr_knowedge_base_article_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_knowedge_base_article_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_knowledge_base`
--

DROP TABLE IF EXISTS `tblhr_knowledge_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_knowledge_base` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `articlegroup` int(11) NOT NULL,
  `subject` mediumtext NOT NULL,
  `description` text NOT NULL,
  `slug` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int(11) NOT NULL DEFAULT 0,
  `staff_article` int(11) NOT NULL DEFAULT 0,
  `question_answers` int(11) DEFAULT 0,
  `file_name` varchar(255) DEFAULT '',
  `curator` varchar(11) DEFAULT '',
  `benchmark` int(11) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_knowledge_base`
--

LOCK TABLES `tblhr_knowledge_base` WRITE;
/*!40000 ALTER TABLE `tblhr_knowledge_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_knowledge_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_knowledge_base_groups`
--

DROP TABLE IF EXISTS `tblhr_knowledge_base_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_knowledge_base_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` text DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int(11) DEFAULT 0,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_knowledge_base_groups`
--

LOCK TABLES `tblhr_knowledge_base_groups` WRITE;
/*!40000 ALTER TABLE `tblhr_knowledge_base_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_knowledge_base_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_list_staff_quitting_work`
--

DROP TABLE IF EXISTS `tblhr_list_staff_quitting_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_list_staff_quitting_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) DEFAULT NULL,
  `staff_name` text DEFAULT NULL,
  `department_name` text DEFAULT NULL,
  `role_name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `dateoff` datetime NOT NULL DEFAULT current_timestamp(),
  `approval` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_list_staff_quitting_work`
--

LOCK TABLES `tblhr_list_staff_quitting_work` WRITE;
/*!40000 ALTER TABLE `tblhr_list_staff_quitting_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_list_staff_quitting_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_p_t_form_question_box`
--

DROP TABLE IF EXISTS `tblhr_p_t_form_question_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_p_t_form_question_box` (
  `boxid` int(11) NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_p_t_form_question_box`
--

LOCK TABLES `tblhr_p_t_form_question_box` WRITE;
/*!40000 ALTER TABLE `tblhr_p_t_form_question_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_p_t_form_question_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_p_t_form_question_box_description`
--

DROP TABLE IF EXISTS `tblhr_p_t_form_question_box_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_p_t_form_question_box_description` (
  `questionboxdescriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int(11) NOT NULL,
  `correct` int(11) DEFAULT 1 COMMENT '0: correct 1: incorrect',
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_p_t_form_question_box_description`
--

LOCK TABLES `tblhr_p_t_form_question_box_description` WRITE;
/*!40000 ALTER TABLE `tblhr_p_t_form_question_box_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_p_t_form_question_box_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_p_t_form_results`
--

DROP TABLE IF EXISTS `tblhr_p_t_form_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_p_t_form_results` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `boxid` int(11) NOT NULL,
  `boxdescriptionid` int(11) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int(11) NOT NULL,
  `answer` text DEFAULT NULL,
  `resultsetid` int(11) NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_p_t_form_results`
--

LOCK TABLES `tblhr_p_t_form_results` WRITE;
/*!40000 ALTER TABLE `tblhr_p_t_form_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_p_t_form_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_p_t_surveyresultsets`
--

DROP TABLE IF EXISTS `tblhr_p_t_surveyresultsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_p_t_surveyresultsets` (
  `resultsetid` int(11) NOT NULL AUTO_INCREMENT,
  `trainingid` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `useragent` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  `staff_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`resultsetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_p_t_surveyresultsets`
--

LOCK TABLES `tblhr_p_t_surveyresultsets` WRITE;
/*!40000 ALTER TABLE `tblhr_p_t_surveyresultsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_p_t_surveyresultsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_position_training`
--

DROP TABLE IF EXISTS `tblhr_position_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_position_training` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext NOT NULL,
  `training_type` int(11) unsigned NOT NULL,
  `slug` mediumtext NOT NULL,
  `description` text DEFAULT NULL,
  `viewdescription` text DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `redirect_url` varchar(100) DEFAULT NULL,
  `send` tinyint(1) NOT NULL DEFAULT 0,
  `onlyforloggedin` int(11) DEFAULT 0,
  `fromname` varchar(100) DEFAULT NULL,
  `iprestrict` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `hash` varchar(32) NOT NULL,
  `mint_point` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_position_training`
--

LOCK TABLES `tblhr_position_training` WRITE;
/*!40000 ALTER TABLE `tblhr_position_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_position_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_position_training_question_form`
--

DROP TABLE IF EXISTS `tblhr_position_training_question_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_position_training_question_form` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `question_order` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_position_training_question_form`
--

LOCK TABLES `tblhr_position_training_question_form` WRITE;
/*!40000 ALTER TABLE `tblhr_position_training_question_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_position_training_question_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_procedure_retire`
--

DROP TABLE IF EXISTS `tblhr_procedure_retire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_procedure_retire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_name` text DEFAULT NULL,
  `option_name` text DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `people_handle_id` int(11) NOT NULL,
  `procedure_retire_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_procedure_retire`
--

LOCK TABLES `tblhr_procedure_retire` WRITE;
/*!40000 ALTER TABLE `tblhr_procedure_retire` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_procedure_retire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_procedure_retire_manage`
--

DROP TABLE IF EXISTS `tblhr_procedure_retire_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_procedure_retire_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_procedure_retire` text NOT NULL,
  `department` varchar(250) NOT NULL,
  `datecreator` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_procedure_retire_manage`
--

LOCK TABLES `tblhr_procedure_retire_manage` WRITE;
/*!40000 ALTER TABLE `tblhr_procedure_retire_manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_procedure_retire_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_procedure_retire_of_staff`
--

DROP TABLE IF EXISTS `tblhr_procedure_retire_of_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_procedure_retire_of_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL,
  `option_name` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_procedure_retire_of_staff`
--

LOCK TABLES `tblhr_procedure_retire_of_staff` WRITE;
/*!40000 ALTER TABLE `tblhr_procedure_retire_of_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_procedure_retire_of_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_procedure_retire_of_staff_by_id`
--

DROP TABLE IF EXISTS `tblhr_procedure_retire_of_staff_by_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_procedure_retire_of_staff_by_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_name` text DEFAULT NULL,
  `people_handle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_procedure_retire_of_staff_by_id`
--

LOCK TABLES `tblhr_procedure_retire_of_staff_by_id` WRITE;
/*!40000 ALTER TABLE `tblhr_procedure_retire_of_staff_by_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_procedure_retire_of_staff_by_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_profile_option`
--

DROP TABLE IF EXISTS `tblhr_profile_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_profile_option` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext DEFAULT NULL,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_profile_option`
--

LOCK TABLES `tblhr_profile_option` WRITE;
/*!40000 ALTER TABLE `tblhr_profile_option` DISABLE KEYS */;
INSERT INTO `tblhr_profile_option` VALUES (1,'job_position_prefix','#JOB',1),(2,'job_position_number','1',1),(3,'contract_code_prefix','#CONTRACT',1),(4,'contract_code_number','1',1),(5,'staff_code_prefix','EC',1),(6,'staff_code_number','1',1);
/*!40000 ALTER TABLE `tblhr_profile_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_rec_transfer_records`
--

DROP TABLE IF EXISTS `tblhr_rec_transfer_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_rec_transfer_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `staff_identifi` varchar(20) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_rec_transfer_records`
--

LOCK TABLES `tblhr_rec_transfer_records` WRITE;
/*!40000 ALTER TABLE `tblhr_rec_transfer_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_rec_transfer_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_salary_form`
--

DROP TABLE IF EXISTS `tblhr_salary_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_salary_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_name` varchar(200) NOT NULL,
  `salary_val` decimal(15,2) NOT NULL,
  `tax` tinyint(1) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_salary_form`
--

LOCK TABLES `tblhr_salary_form` WRITE;
/*!40000 ALTER TABLE `tblhr_salary_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_salary_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_staff_contract`
--

DROP TABLE IF EXISTS `tblhr_staff_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_staff_contract` (
  `id_contract` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_code` varchar(200) NOT NULL,
  `name_contract` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `start_valid` date DEFAULT NULL,
  `end_valid` date DEFAULT NULL,
  `contract_status` varchar(100) DEFAULT NULL,
  `sign_day` date DEFAULT NULL,
  `staff_delegate` int(11) DEFAULT NULL,
  `hourly_or_month` longtext DEFAULT NULL,
  PRIMARY KEY (`id_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_staff_contract`
--

LOCK TABLES `tblhr_staff_contract` WRITE;
/*!40000 ALTER TABLE `tblhr_staff_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_staff_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_staff_contract_detail`
--

DROP TABLE IF EXISTS `tblhr_staff_contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_staff_contract_detail` (
  `contract_detail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_contract_id` int(11) unsigned NOT NULL,
  `type` text DEFAULT NULL,
  `rel_type` text DEFAULT NULL,
  `rel_value` decimal(15,2) DEFAULT 0.00,
  `since_date` date DEFAULT NULL,
  `contract_note` text DEFAULT NULL,
  PRIMARY KEY (`contract_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_staff_contract_detail`
--

LOCK TABLES `tblhr_staff_contract_detail` WRITE;
/*!40000 ALTER TABLE `tblhr_staff_contract_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_staff_contract_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_staff_contract_type`
--

DROP TABLE IF EXISTS `tblhr_staff_contract_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_staff_contract_type` (
  `id_contracttype` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_contracttype` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `insurance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_contracttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_staff_contract_type`
--

LOCK TABLES `tblhr_staff_contract_type` WRITE;
/*!40000 ALTER TABLE `tblhr_staff_contract_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_staff_contract_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_training_allocation`
--

DROP TABLE IF EXISTS `tblhr_training_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_training_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_process_id` varchar(100) NOT NULL,
  `staffid` int(11) DEFAULT NULL,
  `training_type` int(11) DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `training_name` varchar(150) DEFAULT NULL,
  `jp_interview_training_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_training_allocation`
--

LOCK TABLES `tblhr_training_allocation` WRITE;
/*!40000 ALTER TABLE `tblhr_training_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_training_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_type_of_trainings`
--

DROP TABLE IF EXISTS `tblhr_type_of_trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_type_of_trainings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_type_of_trainings`
--

LOCK TABLES `tblhr_type_of_trainings` WRITE;
/*!40000 ALTER TABLE `tblhr_type_of_trainings` DISABLE KEYS */;
INSERT INTO `tblhr_type_of_trainings` VALUES (1,'Basic training');
/*!40000 ALTER TABLE `tblhr_type_of_trainings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_views_tracking`
--

DROP TABLE IF EXISTS `tblhr_views_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_views_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_views_tracking`
--

LOCK TABLES `tblhr_views_tracking` WRITE;
/*!40000 ALTER TABLE `tblhr_views_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_views_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhr_workplace`
--

DROP TABLE IF EXISTS `tblhr_workplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhr_workplace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `workplace_address` varchar(400) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhr_workplace`
--

LOCK TABLES `tblhr_workplace` WRITE;
/*!40000 ALTER TABLE `tblhr_workplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhr_workplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhrm_option`
--

DROP TABLE IF EXISTS `tblhrm_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhrm_option` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext DEFAULT NULL,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhrm_option`
--

LOCK TABLES `tblhrm_option` WRITE;
/*!40000 ALTER TABLE `tblhrm_option` DISABLE KEYS */;
INSERT INTO `tblhrm_option` VALUES (1,'hrm_contract_form','[]',1),(2,'hrm_leave_position','[]',1),(3,'hrm_leave_contract_type','[]',1),(4,'hrm_leave_start_date',NULL,1),(5,'hrm_max_leave_in_year',NULL,1),(6,'hrm_start_leave_from_month',NULL,1),(7,'hrm_start_leave_to_month',NULL,1),(8,'hrm_add_new_leave_month_from_date',NULL,1),(9,'hrm_accumulated_leave_to_month',NULL,1),(10,'hrm_leave_contract_sign_day',NULL,1),(11,'hrm_start_date_seniority',NULL,1),(12,'hrm_seniority_year',NULL,1),(13,'hrm_seniority_year_leave',NULL,1),(14,'hrm_next_year',NULL,1),(15,'hrm_next_year_leave',NULL,1),(16,'alow_borrow_leave',NULL,1),(17,'contract_type_borrow','[]',1),(18,'max_leave_borrow',NULL,1),(19,'day_increases_monthly','15',1),(20,'sign_a_labor_contract','1',1),(21,'maternity_leave_to_return_to_work','1',1),(22,'unpaid_leave_to_return_to_work','1',1),(23,'increase_the_premium','1',1),(24,'day_decreases_monthly','5',1),(25,'contract_paid_for_unemployment','1',1),(26,'maternity_leave_regime','1',1),(27,'unpaid_leave_of_more_than','10',1),(28,'reduced_premiums','1',1);
/*!40000 ALTER TABLE `tblhrm_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhrm_timesheet`
--

DROP TABLE IF EXISTS `tblhrm_timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhrm_timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `date_work` date NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhrm_timesheet`
--

LOCK TABLES `tblhrm_timesheet` WRITE;
/*!40000 ALTER TABLE `tblhrm_timesheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhrm_timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinsurance_type`
--

DROP TABLE IF EXISTS `tblinsurance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinsurance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_month` date NOT NULL,
  `social_company` varchar(15) DEFAULT NULL,
  `social_staff` varchar(15) DEFAULT NULL,
  `labor_accident_company` varchar(15) DEFAULT NULL,
  `labor_accident_staff` varchar(15) DEFAULT NULL,
  `health_company` varchar(15) DEFAULT NULL,
  `health_staff` varchar(15) DEFAULT NULL,
  `unemployment_company` varchar(15) DEFAULT NULL,
  `unemployment_staff` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinsurance_type`
--

LOCK TABLES `tblinsurance_type` WRITE;
/*!40000 ALTER TABLE `tblinsurance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinsurance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinternal_delivery_note`
--

DROP TABLE IF EXISTS `tblinternal_delivery_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinternal_delivery_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `internal_delivery_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `internal_delivery_code` varchar(100) DEFAULT NULL,
  `approval` int(11) DEFAULT 0 COMMENT 'status approval ',
  `addedfrom` int(11) DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinternal_delivery_note`
--

LOCK TABLES `tblinternal_delivery_note` WRITE;
/*!40000 ALTER TABLE `tblinternal_delivery_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinternal_delivery_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinternal_delivery_note_detail`
--

DROP TABLE IF EXISTS `tblinternal_delivery_note_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinternal_delivery_note_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `internal_delivery_id` int(11) NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `from_stock_name` text DEFAULT NULL,
  `to_stock_name` text DEFAULT NULL,
  `unit_id` text DEFAULT NULL,
  `available_quantity` text DEFAULT NULL,
  `quantities` text DEFAULT NULL,
  `unit_price` varchar(100) DEFAULT NULL,
  `into_money` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinternal_delivery_note_detail`
--

LOCK TABLES `tblinternal_delivery_note_detail` WRITE;
/*!40000 ALTER TABLE `tblinternal_delivery_note_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinternal_delivery_note_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinventory_commodity_min`
--

DROP TABLE IF EXISTS `tblinventory_commodity_min`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinventory_commodity_min` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` varchar(100) DEFAULT NULL,
  `inventory_number_min` varchar(100) DEFAULT NULL,
  `inventory_number_max` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`,`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinventory_commodity_min`
--

LOCK TABLES `tblinventory_commodity_min` WRITE;
/*!40000 ALTER TABLE `tblinventory_commodity_min` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinventory_commodity_min` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinventory_manage`
--

DROP TABLE IF EXISTS `tblinventory_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinventory_manage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `inventory_number` varchar(100) DEFAULT NULL,
  `date_manufacture` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `lot_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`commodity_id`,`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinventory_manage`
--

LOCK TABLES `tblinventory_manage` WRITE;
/*!40000 ALTER TABLE `tblinventory_manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinventory_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoicepaymentrecords`
--

DROP TABLE IF EXISTS `tblinvoicepaymentrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoicepaymentrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` varchar(40) DEFAULT NULL,
  `paymentmethod` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentmethod` (`paymentmethod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoicepaymentrecords`
--

LOCK TABLES `tblinvoicepaymentrecords` WRITE;
/*!40000 ALTER TABLE `tblinvoicepaymentrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoicepaymentrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoices`
--

DROP TABLE IF EXISTS `tblinvoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinvoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 0,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `status` int(11) DEFAULT 1,
  `clientnote` text DEFAULT NULL,
  `adminnote` text DEFAULT NULL,
  `last_overdue_reminder` date DEFAULT NULL,
  `last_due_reminder` date DEFAULT NULL,
  `cancel_overdue_reminders` int(11) NOT NULL DEFAULT 0,
  `allowed_payment_modes` mediumtext DEFAULT NULL,
  `token` mediumtext DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) NOT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `is_recurring_from` int(11) DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT 0,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_invoice` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `project_id` int(11) DEFAULT 0,
  `subscription_id` int(11) NOT NULL DEFAULT 0,
  `short_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `total` (`total`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoices`
--

LOCK TABLES `tblinvoices` WRITE;
/*!40000 ALTER TABLE `tblinvoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblitem_tax`
--

DROP TABLE IF EXISTS `tblitem_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblitem_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  `taxname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitem_tax`
--

LOCK TABLES `tblitem_tax` WRITE;
/*!40000 ALTER TABLE `tblitem_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblitem_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblitemable`
--

DROP TABLE IF EXISTS `tblitemable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblitemable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `description` mediumtext NOT NULL,
  `long_description` mediumtext DEFAULT NULL,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  `wh_delivered_quantity` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `qty` (`qty`),
  KEY `rate` (`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitemable`
--

LOCK TABLES `tblitemable` WRITE;
/*!40000 ALTER TABLE `tblitemable` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblitemable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblitems`
--

DROP TABLE IF EXISTS `tblitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `long_description` text DEFAULT NULL,
  `rate` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `commodity_code` varchar(100) NOT NULL,
  `commodity_barcode` text DEFAULT NULL,
  `commodity_type` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sku_code` varchar(200) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `purchase_price` decimal(15,2) DEFAULT NULL,
  `sub_group` varchar(200) DEFAULT NULL,
  `commodity_name` varchar(200) NOT NULL,
  `color` text DEFAULT NULL,
  `guarantee` text DEFAULT NULL,
  `profif_ratio` text DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `long_descriptions` longtext DEFAULT NULL,
  `without_checking_warehouse` int(11) DEFAULT 0,
  `series_id` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL,
  `parent_attributes` longtext DEFAULT NULL,
  `can_be_sold` varchar(100) DEFAULT 'can_be_sold',
  `can_be_purchased` varchar(100) DEFAULT 'can_be_purchased',
  `can_be_manufacturing` varchar(100) DEFAULT 'can_be_manufacturing',
  `can_be_inventory` varchar(100) DEFAULT 'can_be_inventory',
  `product_type` varchar(100) DEFAULT NULL,
  `description_internal_transfers` text DEFAULT NULL,
  `description_receipts` text DEFAULT NULL,
  `description_delivery_orders` text DEFAULT NULL,
  `customer_lead_time` decimal(15,2) DEFAULT 0.00,
  `replenish_on_order` varchar(100) DEFAULT NULL,
  `supplier_taxes_id` text DEFAULT NULL,
  `description_sale` text DEFAULT NULL,
  `invoice_policy` varchar(100) DEFAULT 'ordered_quantities',
  `purchase_unit_measure` int(11) DEFAULT NULL,
  `manufacture` varchar(100) DEFAULT NULL,
  `manufacturing_lead_time` decimal(15,2) DEFAULT 0.00,
  `weight` decimal(15,2) DEFAULT 0.00,
  `volume` decimal(15,2) DEFAULT 0.00,
  `hs_code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`),
  KEY `tax2` (`tax2`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitems`
--

LOCK TABLES `tblitems` WRITE;
/*!40000 ALTER TABLE `tblitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblitems_groups`
--

DROP TABLE IF EXISTS `tblitems_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblitems_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `commodity_group_code` varchar(100) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitems_groups`
--

LOCK TABLES `tblitems_groups` WRITE;
/*!40000 ALTER TABLE `tblitems_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblitems_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbljob_industry`
--

DROP TABLE IF EXISTS `tbljob_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbljob_industry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(200) NOT NULL,
  `industry_description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbljob_industry`
--

LOCK TABLES `tbljob_industry` WRITE;
/*!40000 ALTER TABLE `tbljob_industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbljob_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbljob_position`
--

DROP TABLE IF EXISTS `tbljob_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbljob_position` (
  `position_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(200) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbljob_position`
--

LOCK TABLES `tbljob_position` WRITE;
/*!40000 ALTER TABLE `tbljob_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbljob_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowedge_base_article_feedback`
--

DROP TABLE IF EXISTS `tblknowedge_base_article_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowedge_base_article_feedback` (
  `articleanswerid` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowedge_base_article_feedback`
--

LOCK TABLES `tblknowedge_base_article_feedback` WRITE;
/*!40000 ALTER TABLE `tblknowedge_base_article_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowedge_base_article_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledge_base`
--

DROP TABLE IF EXISTS `tblknowledge_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledge_base` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `articlegroup` int(11) NOT NULL,
  `subject` mediumtext NOT NULL,
  `description` text NOT NULL,
  `slug` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int(11) NOT NULL DEFAULT 0,
  `staff_article` int(11) NOT NULL DEFAULT 0,
  `question_answers` int(11) DEFAULT 0,
  `file_name` varchar(255) DEFAULT '',
  `curator` varchar(11) DEFAULT '',
  `benchmark` int(11) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledge_base`
--

LOCK TABLES `tblknowledge_base` WRITE;
/*!40000 ALTER TABLE `tblknowledge_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledge_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledge_base_groups`
--

DROP TABLE IF EXISTS `tblknowledge_base_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblknowledge_base_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` text DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int(11) DEFAULT 0,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblknowledge_base_groups`
--

LOCK TABLES `tblknowledge_base_groups` WRITE;
/*!40000 ALTER TABLE `tblknowledge_base_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledge_base_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllead_activity_log`
--

DROP TABLE IF EXISTS `tbllead_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllead_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leadid` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `additional_data` text DEFAULT NULL,
  `date` datetime NOT NULL,
  `staffid` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `custom_activity` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllead_activity_log`
--

LOCK TABLES `tbllead_activity_log` WRITE;
/*!40000 ALTER TABLE `tbllead_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllead_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllead_integration_emails`
--

DROP TABLE IF EXISTS `tbllead_integration_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllead_integration_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `leadid` int(11) NOT NULL,
  `emailid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllead_integration_emails`
--

LOCK TABLES `tbllead_integration_emails` WRITE;
/*!40000 ALTER TABLE `tbllead_integration_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllead_integration_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleads`
--

DROP TABLE IF EXISTS `tblleads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(65) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  `from_form_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `lastcontact` datetime DEFAULT NULL,
  `dateassigned` date DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `leadorder` int(11) DEFAULT 1,
  `phonenumber` varchar(50) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `lost` tinyint(1) NOT NULL DEFAULT 0,
  `junk` int(11) NOT NULL DEFAULT 0,
  `last_lead_status` int(11) NOT NULL DEFAULT 0,
  `is_imported_from_email_integration` tinyint(1) NOT NULL DEFAULT 0,
  `email_integration_uid` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `default_language` varchar(40) DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `lead_value` decimal(15,2) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company` (`company`),
  KEY `email` (`email`),
  KEY `assigned` (`assigned`),
  KEY `status` (`status`),
  KEY `source` (`source`),
  KEY `lastcontact` (`lastcontact`),
  KEY `dateadded` (`dateadded`),
  KEY `leadorder` (`leadorder`),
  KEY `from_form_id` (`from_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleads`
--

LOCK TABLES `tblleads` WRITE;
/*!40000 ALTER TABLE `tblleads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblleads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleads_email_integration`
--

DROP TABLE IF EXISTS `tblleads_email_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleads_email_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'the ID always must be 1',
  `active` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `imap_server` varchar(100) NOT NULL,
  `password` mediumtext NOT NULL,
  `check_every` int(11) NOT NULL DEFAULT 5,
  `responsible` int(11) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(100) NOT NULL,
  `last_run` varchar(50) DEFAULT NULL,
  `notify_lead_imported` tinyint(1) NOT NULL DEFAULT 1,
  `notify_lead_contact_more_times` tinyint(1) NOT NULL DEFAULT 1,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext DEFAULT NULL,
  `mark_public` int(11) NOT NULL DEFAULT 0,
  `only_loop_on_unseen_emails` tinyint(1) NOT NULL DEFAULT 1,
  `delete_after_import` int(11) NOT NULL DEFAULT 0,
  `create_task_if_customer` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleads_email_integration`
--

LOCK TABLES `tblleads_email_integration` WRITE;
/*!40000 ALTER TABLE `tblleads_email_integration` DISABLE KEYS */;
INSERT INTO `tblleads_email_integration` VALUES (1,0,'','','',10,0,0,0,'tls','INBOX','',1,1,'assigned','',0,1,0,1);
/*!40000 ALTER TABLE `tblleads_email_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleads_sources`
--

DROP TABLE IF EXISTS `tblleads_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleads_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleads_sources`
--

LOCK TABLES `tblleads_sources` WRITE;
/*!40000 ALTER TABLE `tblleads_sources` DISABLE KEYS */;
INSERT INTO `tblleads_sources` VALUES (2,'Facebook'),(1,'Google');
/*!40000 ALTER TABLE `tblleads_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleads_status`
--

DROP TABLE IF EXISTS `tblleads_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleads_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `isdefault` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleads_status`
--

LOCK TABLES `tblleads_status` WRITE;
/*!40000 ALTER TABLE `tblleads_status` DISABLE KEYS */;
INSERT INTO `tblleads_status` VALUES (1,'Customer',1000,'#7cb342',1);
/*!40000 ALTER TABLE `tblleads_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllistemails`
--

DROP TABLE IF EXISTS `tbllistemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllistemails` (
  `emailid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllistemails`
--

LOCK TABLES `tbllistemails` WRITE;
/*!40000 ALTER TABLE `tbllistemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllistemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmail_queue`
--

DROP TABLE IF EXISTS `tblmail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `alt_message` mediumtext DEFAULT NULL,
  `status` enum('pending','sending','sent','failed') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `attachments` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmail_queue`
--

LOCK TABLES `tblmail_queue` WRITE;
/*!40000 ALTER TABLE `tblmail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmaillistscustomfields`
--

DROP TABLE IF EXISTS `tblmaillistscustomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmaillistscustomfields` (
  `customfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `fieldslug` varchar(100) NOT NULL,
  PRIMARY KEY (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmaillistscustomfields`
--

LOCK TABLES `tblmaillistscustomfields` WRITE;
/*!40000 ALTER TABLE `tblmaillistscustomfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmaillistscustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmaillistscustomfieldvalues`
--

DROP TABLE IF EXISTS `tblmaillistscustomfieldvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmaillistscustomfieldvalues` (
  `customfieldvalueid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `customfieldid` int(11) NOT NULL,
  `emailid` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`customfieldvalueid`),
  KEY `listid` (`listid`),
  KEY `customfieldid` (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmaillistscustomfieldvalues`
--

LOCK TABLES `tblmaillistscustomfieldvalues` WRITE;
/*!40000 ALTER TABLE `tblmaillistscustomfieldvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmaillistscustomfieldvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmanage_leave`
--

DROP TABLE IF EXISTS `tblmanage_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmanage_leave` (
  `leave_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_staff` int(11) NOT NULL,
  `leave_date` int(11) DEFAULT NULL,
  `leave_year` int(11) DEFAULT NULL,
  `accumulated_leave` int(11) DEFAULT NULL,
  `seniority_leave` int(11) DEFAULT NULL,
  `borrow_leave` int(11) DEFAULT NULL,
  `actual_leave` int(11) DEFAULT NULL,
  `expected_leave` int(11) DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmanage_leave`
--

LOCK TABLES `tblmanage_leave` WRITE;
/*!40000 ALTER TABLE `tblmanage_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmanage_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmigrations`
--

DROP TABLE IF EXISTS `tblmigrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmigrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmigrations`
--

LOCK TABLES `tblmigrations` WRITE;
/*!40000 ALTER TABLE `tblmigrations` DISABLE KEYS */;
INSERT INTO `tblmigrations` VALUES (293);
/*!40000 ALTER TABLE `tblmigrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmilestones`
--

DROP TABLE IF EXISTS `tblmilestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmilestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `description_visible_to_customer` tinyint(1) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `milestone_order` int(11) NOT NULL DEFAULT 0,
  `datecreated` date NOT NULL,
  `hide_from_customer` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmilestones`
--

LOCK TABLES `tblmilestones` WRITE;
/*!40000 ALTER TABLE `tblmilestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmilestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmodules`
--

DROP TABLE IF EXISTS `tblmodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(55) NOT NULL,
  `installed_version` varchar(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmodules`
--

LOCK TABLES `tblmodules` WRITE;
/*!40000 ALTER TABLE `tblmodules` DISABLE KEYS */;
INSERT INTO `tblmodules` VALUES (1,'backup','2.3.0',1),(2,'goals','2.3.0',1),(3,'menu_setup','2.3.0',1),(4,'surveys','2.3.0',1),(5,'theme_style','2.3.0',1),(6,'warehouse','1.2.5',1),(7,'purchase','1.0.9',1),(8,'support_contact','1.0',1),(9,'manufacturing','1.0.2',1),(10,'hr_profile','1.0.3',1),(11,'hrm','2.3.0',1),(12,'omni_sales','1.0.0',1),(13,'accounting','1.0.8',1),(15,'products','1.1.0',1),(16,'recruitment','1.1.6',1);
/*!40000 ALTER TABLE `tblmodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_bill_of_material_details`
--

DROP TABLE IF EXISTS `tblmrp_bill_of_material_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_bill_of_material_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bill_of_material_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT 'Only Product variant do not get parent Product',
  `product_qty` decimal(15,2) DEFAULT 0.00,
  `unit_id` int(11) DEFAULT NULL,
  `apply_on_variants` text DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `display_order` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_bill_of_material_details`
--

LOCK TABLES `tblmrp_bill_of_material_details` WRITE;
/*!40000 ALTER TABLE `tblmrp_bill_of_material_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_bill_of_material_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_bill_of_materials`
--

DROP TABLE IF EXISTS `tblmrp_bill_of_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_bill_of_materials` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bom_code` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `product_qty` decimal(15,2) DEFAULT 0.00,
  `unit_id` int(11) DEFAULT NULL,
  `routing_id` int(11) DEFAULT NULL,
  `bom_type` varchar(100) DEFAULT NULL,
  `ready_to_produce` varchar(200) DEFAULT NULL,
  `consumption` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_bill_of_materials`
--

LOCK TABLES `tblmrp_bill_of_materials` WRITE;
/*!40000 ALTER TABLE `tblmrp_bill_of_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_bill_of_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_manufacturing_order_details`
--

DROP TABLE IF EXISTS `tblmrp_manufacturing_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_manufacturing_order_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturing_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `qty_to_consume` decimal(15,2) DEFAULT 0.00,
  `qty_reserved` decimal(15,2) DEFAULT 0.00,
  `qty_done` decimal(15,2) DEFAULT 0.00,
  `check_inventory_qty` varchar(10) DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `lot_number` text DEFAULT NULL,
  `expiry_date` text DEFAULT NULL,
  `available_quantity` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_manufacturing_order_details`
--

LOCK TABLES `tblmrp_manufacturing_order_details` WRITE;
/*!40000 ALTER TABLE `tblmrp_manufacturing_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_manufacturing_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_manufacturing_orders`
--

DROP TABLE IF EXISTS `tblmrp_manufacturing_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_manufacturing_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturing_order_code` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT 'Only Product variant do not get parent Product',
  `product_qty` decimal(15,2) DEFAULT 0.00,
  `unit_id` int(11) DEFAULT NULL,
  `bom_id` int(11) DEFAULT NULL,
  `routing_id` int(11) DEFAULT NULL,
  `date_deadline` datetime DEFAULT NULL,
  `date_plan_from` datetime DEFAULT NULL,
  `date_planned_start` datetime DEFAULT NULL,
  `date_planned_finished` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT 'draft',
  `material_availability_status` varchar(100) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `components_warehouse_id` text DEFAULT NULL,
  `finished_products_warehouse_id` text DEFAULT NULL,
  `purchase_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_manufacturing_orders`
--

LOCK TABLES `tblmrp_manufacturing_orders` WRITE;
/*!40000 ALTER TABLE `tblmrp_manufacturing_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_manufacturing_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_option`
--

DROP TABLE IF EXISTS `tblmrp_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_option` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext DEFAULT NULL,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_option`
--

LOCK TABLES `tblmrp_option` WRITE;
/*!40000 ALTER TABLE `tblmrp_option` DISABLE KEYS */;
INSERT INTO `tblmrp_option` VALUES (1,'bom_prefix','#BOM_',1),(2,'bom_number','1',1),(3,'routing_prefix','#RO_',1),(4,'routing_number','1',1),(5,'mo_prefix','#MO_',1),(6,'mo_number','1',1);
/*!40000 ALTER TABLE `tblmrp_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_routing_details`
--

DROP TABLE IF EXISTS `tblmrp_routing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_routing_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `routing_id` int(11) NOT NULL,
  `operation` varchar(200) DEFAULT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `duration_computation` varchar(200) DEFAULT NULL,
  `based_on` decimal(15,2) DEFAULT 0.00,
  `default_duration` decimal(15,2) DEFAULT 0.00,
  `start_next_operation` varchar(200) DEFAULT NULL,
  `quantity_process` decimal(15,2) DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `display_order` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_routing_details`
--

LOCK TABLES `tblmrp_routing_details` WRITE;
/*!40000 ALTER TABLE `tblmrp_routing_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_routing_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_routings`
--

DROP TABLE IF EXISTS `tblmrp_routings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_routings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `routing_code` varchar(200) DEFAULT NULL,
  `routing_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_routings`
--

LOCK TABLES `tblmrp_routings` WRITE;
/*!40000 ALTER TABLE `tblmrp_routings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_routings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_unit_measure_categories`
--

DROP TABLE IF EXISTS `tblmrp_unit_measure_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_unit_measure_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_unit_measure_categories`
--

LOCK TABLES `tblmrp_unit_measure_categories` WRITE;
/*!40000 ALTER TABLE `tblmrp_unit_measure_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_unit_measure_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_work_centers`
--

DROP TABLE IF EXISTS `tblmrp_work_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_work_centers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_center_name` varchar(200) DEFAULT NULL,
  `work_center_code` varchar(200) DEFAULT NULL,
  `working_hours` varchar(200) DEFAULT NULL,
  `time_efficiency` decimal(15,2) DEFAULT 0.00,
  `capacity` decimal(15,2) DEFAULT 0.00,
  `oee_target` decimal(15,2) DEFAULT 0.00,
  `time_start` decimal(15,2) DEFAULT 0.00,
  `time_stop` decimal(15,2) DEFAULT 0.00,
  `costs_hour` decimal(15,2) DEFAULT 0.00,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_work_centers`
--

LOCK TABLES `tblmrp_work_centers` WRITE;
/*!40000 ALTER TABLE `tblmrp_work_centers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_work_centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_work_order_details`
--

DROP TABLE IF EXISTS `tblmrp_work_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_work_order_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `to_consume` decimal(15,2) DEFAULT 0.00,
  `reserved` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_work_order_details`
--

LOCK TABLES `tblmrp_work_order_details` WRITE;
/*!40000 ALTER TABLE `tblmrp_work_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_work_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_work_order_time_trackings`
--

DROP TABLE IF EXISTS `tblmrp_work_order_time_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_work_order_time_trackings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_order_id` int(11) NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `duration` decimal(15,2) DEFAULT 0.00,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_work_order_time_trackings`
--

LOCK TABLES `tblmrp_work_order_time_trackings` WRITE;
/*!40000 ALTER TABLE `tblmrp_work_order_time_trackings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_work_order_time_trackings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_work_orders`
--

DROP TABLE IF EXISTS `tblmrp_work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_work_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturing_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty_produced` decimal(15,2) DEFAULT 0.00,
  `qty_production` decimal(15,2) DEFAULT 0.00,
  `qty_producing` decimal(15,2) DEFAULT 0.00,
  `unit_id` int(11) DEFAULT NULL,
  `routing_detail_id` int(11) DEFAULT NULL,
  `operation_name` text DEFAULT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `date_planned_start` datetime DEFAULT NULL,
  `date_planned_finished` datetime DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_finished` datetime DEFAULT NULL,
  `duration_expected` decimal(15,2) DEFAULT 0.00,
  `real_duration` decimal(15,2) DEFAULT 0.00,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_work_orders`
--

LOCK TABLES `tblmrp_work_orders` WRITE;
/*!40000 ALTER TABLE `tblmrp_work_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_work_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_working_hour_time_off`
--

DROP TABLE IF EXISTS `tblmrp_working_hour_time_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_working_hour_time_off` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `working_hour_id` int(11) NOT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_working_hour_time_off`
--

LOCK TABLES `tblmrp_working_hour_time_off` WRITE;
/*!40000 ALTER TABLE `tblmrp_working_hour_time_off` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_working_hour_time_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_working_hour_times`
--

DROP TABLE IF EXISTS `tblmrp_working_hour_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_working_hour_times` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `working_hour_id` int(11) NOT NULL,
  `working_hour_name` varchar(200) DEFAULT NULL,
  `day_of_week` varchar(100) DEFAULT NULL,
  `day_period` varchar(100) DEFAULT NULL,
  `work_from` time DEFAULT NULL,
  `work_to` time DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_working_hour_times`
--

LOCK TABLES `tblmrp_working_hour_times` WRITE;
/*!40000 ALTER TABLE `tblmrp_working_hour_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_working_hour_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmrp_working_hours`
--

DROP TABLE IF EXISTS `tblmrp_working_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmrp_working_hours` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `working_hour_name` varchar(200) DEFAULT NULL,
  `hours_per_day` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmrp_working_hours`
--

LOCK TABLES `tblmrp_working_hours` WRITE;
/*!40000 ALTER TABLE `tblmrp_working_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmrp_working_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnewsfeed_comment_likes`
--

DROP TABLE IF EXISTS `tblnewsfeed_comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnewsfeed_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnewsfeed_comment_likes`
--

LOCK TABLES `tblnewsfeed_comment_likes` WRITE;
/*!40000 ALTER TABLE `tblnewsfeed_comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnewsfeed_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnewsfeed_post_comments`
--

DROP TABLE IF EXISTS `tblnewsfeed_post_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnewsfeed_post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnewsfeed_post_comments`
--

LOCK TABLES `tblnewsfeed_post_comments` WRITE;
/*!40000 ALTER TABLE `tblnewsfeed_post_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnewsfeed_post_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnewsfeed_post_likes`
--

DROP TABLE IF EXISTS `tblnewsfeed_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnewsfeed_post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnewsfeed_post_likes`
--

LOCK TABLES `tblnewsfeed_post_likes` WRITE;
/*!40000 ALTER TABLE `tblnewsfeed_post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnewsfeed_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnewsfeed_posts`
--

DROP TABLE IF EXISTS `tblnewsfeed_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnewsfeed_posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `visibility` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `pinned` int(11) NOT NULL,
  `datepinned` datetime DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnewsfeed_posts`
--

LOCK TABLES `tblnewsfeed_posts` WRITE;
/*!40000 ALTER TABLE `tblnewsfeed_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnewsfeed_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotes`
--

DROP TABLE IF EXISTS `tblnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `date_contacted` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotes`
--

LOCK TABLES `tblnotes` WRITE;
/*!40000 ALTER TABLE `tblnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotifications`
--

DROP TABLE IF EXISTS `tblnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isread` int(11) NOT NULL DEFAULT 0,
  `isread_inline` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `fromuserid` int(11) NOT NULL,
  `fromclientid` int(11) NOT NULL DEFAULT 0,
  `from_fullname` varchar(100) NOT NULL,
  `touserid` int(11) NOT NULL,
  `fromcompany` int(11) DEFAULT NULL,
  `link` mediumtext DEFAULT NULL,
  `additional_data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotifications`
--

LOCK TABLES `tblnotifications` WRITE;
/*!40000 ALTER TABLE `tblnotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblomni_log_discount`
--

DROP TABLE IF EXISTS `tblomni_log_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblomni_log_discount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_discount` varchar(250) NOT NULL,
  `client` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quality` int(11) NOT NULL,
  `total_product` int(11) NOT NULL,
  `date_apply` datetime NOT NULL DEFAULT current_timestamp(),
  `voucher_coupon` varchar(250) DEFAULT NULL,
  `order_number` varchar(100) DEFAULT NULL,
  `total_order` varchar(100) DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `tax` varchar(100) DEFAULT NULL,
  `total_after` varchar(100) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblomni_log_discount`
--

LOCK TABLES `tblomni_log_discount` WRITE;
/*!40000 ALTER TABLE `tblomni_log_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblomni_log_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblomni_log_sync_woo`
--

DROP TABLE IF EXISTS `tblomni_log_sync_woo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblomni_log_sync_woo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `regular_price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `date_on_sale_from` date DEFAULT NULL,
  `date_on_sale_to` date DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `sku` text NOT NULL,
  `type` varchar(225) NOT NULL,
  `date_sync` datetime NOT NULL DEFAULT current_timestamp(),
  `stock_quantity_history` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL,
  `chanel` varchar(250) NOT NULL DEFAULT '',
  `company` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblomni_log_sync_woo`
--

LOCK TABLES `tblomni_log_sync_woo` WRITE;
/*!40000 ALTER TABLE `tblomni_log_sync_woo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblomni_log_sync_woo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblomni_master_channel_woocommere`
--

DROP TABLE IF EXISTS `tblomni_master_channel_woocommere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblomni_master_channel_woocommere` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_channel` text NOT NULL,
  `consumer_key` text NOT NULL,
  `consumer_secret` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblomni_master_channel_woocommere`
--

LOCK TABLES `tblomni_master_channel_woocommere` WRITE;
/*!40000 ALTER TABLE `tblomni_master_channel_woocommere` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblomni_master_channel_woocommere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblomni_trade_discount`
--

DROP TABLE IF EXISTS `tblomni_trade_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblomni_trade_discount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_trade_discount` varchar(250) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `group_clients` text NOT NULL,
  `clients` text NOT NULL,
  `group_items` text NOT NULL,
  `items` text NOT NULL,
  `formal` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `voucher` text DEFAULT NULL,
  `channel` int(11) NOT NULL DEFAULT 0,
  `store` varchar(11) NOT NULL DEFAULT '',
  `minimum_order_value` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblomni_trade_discount`
--

LOCK TABLES `tblomni_trade_discount` WRITE;
/*!40000 ALTER TABLE `tblomni_trade_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblomni_trade_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbloptions`
--

DROP TABLE IF EXISTS `tbloptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbloptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbloptions`
--

LOCK TABLES `tbloptions` WRITE;
/*!40000 ALTER TABLE `tbloptions` DISABLE KEYS */;
INSERT INTO `tbloptions` VALUES (1,'dateformat','Y-m-d|%Y-%m-%d',1),(2,'companyname','FRESKADOS',1),(3,'services','1',1),(4,'maximum_allowed_ticket_attachments','4',1),(5,'ticket_attachments_file_extensions','.jpg,.png,.pdf,.doc,.zip,.rar',1),(6,'staff_access_only_assigned_departments','1',1),(7,'use_knowledge_base','1',1),(8,'smtp_email','',1),(9,'smtp_password','',1),(10,'company_info_format','{company_name}<br />\r\n{address}<br />\r\n{city} {state}<br />\r\n{country_code} {zip_code}<br />\r\n{vat_number_with_label}',0),(11,'smtp_port','',1),(12,'smtp_host','',1),(13,'smtp_email_charset','utf-8',1),(14,'default_timezone','America/Caracas',1),(15,'clients_default_theme','perfex',1),(16,'company_logo','',1),(17,'tables_pagination_limit','25',1),(18,'main_domain','',1),(19,'allow_registration','0',1),(20,'knowledge_base_without_registration','1',1),(21,'email_signature','',1),(22,'default_staff_role','1',1),(23,'newsfeed_maximum_files_upload','10',1),(24,'contract_expiration_before','4',1),(25,'invoice_prefix','INV-',1),(26,'decimal_separator','.',1),(27,'thousand_separator',',',1),(28,'invoice_company_name','CORPORACION FESKAVARLUG CA',1),(29,'invoice_company_address','Av Santa fe surcasa parcela nro 91 urb santa fe',1),(30,'invoice_company_city','Caracas',1),(31,'invoice_company_country_code','1080',1),(32,'invoice_company_postal_code','1080',1),(33,'invoice_company_phonenumber','',1),(34,'view_invoice_only_logged_in','0',1),(35,'invoice_number_format','1',1),(36,'next_invoice_number','1',0),(37,'active_language','english',1),(38,'invoice_number_decrement_on_delete','1',1),(39,'automatically_send_invoice_overdue_reminder_after','1',1),(40,'automatically_resend_invoice_overdue_reminder_after','3',1),(41,'expenses_auto_operations_hour','21',1),(42,'delete_only_on_last_invoice','1',1),(43,'delete_only_on_last_estimate','1',1),(44,'create_invoice_from_recurring_only_on_paid_invoices','0',1),(45,'allow_payment_amount_to_be_modified','1',1),(46,'rtl_support_client','0',1),(47,'limit_top_search_bar_results_to','10',1),(48,'estimate_prefix','EST-',1),(49,'next_estimate_number','1',0),(50,'estimate_number_decrement_on_delete','1',1),(51,'estimate_number_format','1',1),(52,'estimate_auto_convert_to_invoice_on_client_accept','1',1),(53,'exclude_estimate_from_client_area_with_draft_status','1',1),(54,'rtl_support_admin','0',1),(55,'last_cron_run','',1),(56,'show_sale_agent_on_estimates','1',1),(57,'show_sale_agent_on_invoices','1',1),(58,'predefined_terms_invoice','',1),(59,'predefined_terms_estimate','',1),(60,'default_task_priority','2',1),(61,'dropbox_app_key','',1),(62,'show_expense_reminders_on_calendar','1',1),(63,'only_show_contact_tickets','1',1),(64,'predefined_clientnote_invoice','',1),(65,'predefined_clientnote_estimate','',1),(66,'custom_pdf_logo_image_url','',1),(67,'favicon','',1),(68,'invoice_due_after','30',1),(69,'google_api_key','',1),(70,'google_calendar_main_calendar','',1),(71,'default_tax','a:0:{}',1),(72,'show_invoices_on_calendar','1',1),(73,'show_estimates_on_calendar','1',1),(74,'show_contracts_on_calendar','1',1),(75,'show_tasks_on_calendar','1',1),(76,'show_customer_reminders_on_calendar','1',1),(77,'output_client_pdfs_from_admin_area_in_client_language','0',1),(78,'show_lead_reminders_on_calendar','1',1),(79,'send_estimate_expiry_reminder_before','4',1),(80,'leads_default_source','',1),(81,'leads_default_status','',1),(82,'proposal_expiry_reminder_enabled','1',1),(83,'send_proposal_expiry_reminder_before','4',1),(84,'default_contact_permissions','a:6:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";}',1),(85,'pdf_logo_width','150',1),(86,'access_tickets_to_none_staff_members','0',1),(87,'customer_default_country','',1),(88,'view_estimate_only_logged_in','0',1),(89,'show_status_on_pdf_ei','1',1),(90,'email_piping_only_replies','0',1),(91,'email_piping_only_registered','0',1),(92,'default_view_calendar','dayGridMonth',1),(93,'email_piping_default_priority','2',1),(94,'total_to_words_lowercase','0',1),(95,'show_tax_per_item','1',1),(96,'total_to_words_enabled','0',1),(97,'receive_notification_on_new_ticket','1',0),(98,'autoclose_tickets_after','0',1),(99,'media_max_file_size_upload','10',1),(100,'client_staff_add_edit_delete_task_comments_first_hour','0',1),(101,'show_projects_on_calendar','1',1),(102,'leads_kanban_limit','50',1),(103,'tasks_reminder_notification_before','2',1),(104,'pdf_font','freesans',1),(105,'pdf_table_heading_color','#323a45',1),(106,'pdf_table_heading_text_color','#ffffff',1),(107,'pdf_font_size','10',1),(108,'default_leads_kanban_sort','leadorder',1),(109,'default_leads_kanban_sort_type','asc',1),(110,'allowed_files','.png,.jpg,.pdf,.doc,.docx,.xls,.xlsx,.zip,.rar,.txt',1),(111,'show_all_tasks_for_project_member','1',1),(112,'email_protocol','smtp',1),(113,'calendar_first_day','0',1),(114,'recaptcha_secret_key','',1),(115,'show_help_on_setup_menu','1',1),(116,'show_proposals_on_calendar','1',1),(117,'smtp_encryption','',1),(118,'recaptcha_site_key','',1),(119,'smtp_username','',1),(120,'auto_stop_tasks_timers_on_new_timer','1',1),(121,'notification_when_customer_pay_invoice','1',1),(122,'calendar_invoice_color','#FF6F00',1),(123,'calendar_estimate_color','#FF6F00',1),(124,'calendar_proposal_color','#84c529',1),(125,'new_task_auto_assign_current_member','1',1),(126,'calendar_reminder_color','#03A9F4',1),(127,'calendar_contract_color','#B72974',1),(128,'calendar_project_color','#B72974',1),(129,'update_info_message','',1),(130,'show_estimate_reminders_on_calendar','1',1),(131,'show_invoice_reminders_on_calendar','1',1),(132,'show_proposal_reminders_on_calendar','1',1),(133,'proposal_due_after','7',1),(134,'allow_customer_to_change_ticket_status','0',1),(135,'lead_lock_after_convert_to_customer','0',1),(136,'default_proposals_pipeline_sort','pipeline_order',1),(137,'default_proposals_pipeline_sort_type','asc',1),(138,'default_estimates_pipeline_sort','pipeline_order',1),(139,'default_estimates_pipeline_sort_type','asc',1),(140,'use_recaptcha_customers_area','0',1),(141,'remove_decimals_on_zero','0',1),(142,'remove_tax_name_from_item_table','0',1),(143,'pdf_format_invoice','A4-PORTRAIT',1),(144,'pdf_format_estimate','A4-PORTRAIT',1),(145,'pdf_format_proposal','A4-PORTRAIT',1),(146,'pdf_format_payment','A4-PORTRAIT',1),(147,'pdf_format_contract','A4-PORTRAIT',1),(148,'swap_pdf_info','0',1),(149,'exclude_invoice_from_client_area_with_draft_status','1',1),(150,'cron_has_run_from_cli','0',1),(151,'hide_cron_is_required_message','0',0),(152,'auto_assign_customer_admin_after_lead_convert','1',1),(153,'show_transactions_on_invoice_pdf','1',1),(154,'show_pay_link_to_invoice_pdf','1',1),(155,'tasks_kanban_limit','50',1),(156,'purchase_key','',1),(157,'estimates_pipeline_limit','50',1),(158,'proposals_pipeline_limit','50',1),(159,'proposal_number_prefix','PRO-',1),(160,'number_padding_prefixes','6',1),(161,'show_page_number_on_pdf','0',1),(162,'calendar_events_limit','4',1),(163,'show_setup_menu_item_only_on_hover','0',1),(164,'company_requires_vat_number_field','1',1),(165,'company_is_required','1',1),(166,'allow_contact_to_delete_files','0',1),(167,'company_vat','J501021872',1),(168,'di','1657335305',1),(169,'invoice_auto_operations_hour','21',1),(170,'use_minified_files','1',1),(171,'only_own_files_contacts','0',1),(172,'allow_primary_contact_to_view_edit_billing_and_shipping','0',1),(173,'estimate_due_after','7',1),(174,'staff_members_open_tickets_to_all_contacts','1',1),(175,'time_format','24',1),(176,'delete_activity_log_older_then','1',1),(177,'disable_language','0',1),(178,'company_state','Miranda',1),(179,'email_header','<!doctype html>\r\n                            <html>\r\n                            <head>\r\n                              <meta name=\"viewport\" content=\"width=device-width\" />\r\n                              <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n                              <style>\r\n                                body {\r\n                                 background-color: #f6f6f6;\r\n                                 font-family: sans-serif;\r\n                                 -webkit-font-smoothing: antialiased;\r\n                                 font-size: 14px;\r\n                                 line-height: 1.4;\r\n                                 margin: 0;\r\n                                 padding: 0;\r\n                                 -ms-text-size-adjust: 100%;\r\n                                 -webkit-text-size-adjust: 100%;\r\n                               }\r\n                               table {\r\n                                 border-collapse: separate;\r\n                                 mso-table-lspace: 0pt;\r\n                                 mso-table-rspace: 0pt;\r\n                                 width: 100%;\r\n                               }\r\n                               table td {\r\n                                 font-family: sans-serif;\r\n                                 font-size: 14px;\r\n                                 vertical-align: top;\r\n                               }\r\n                                   /* -------------------------------------\r\n                                     BODY & CONTAINER\r\n                                     ------------------------------------- */\r\n                                     .body {\r\n                                       background-color: #f6f6f6;\r\n                                       width: 100%;\r\n                                     }\r\n                                     /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\r\n\r\n                                     .container {\r\n                                       display: block;\r\n                                       margin: 0 auto !important;\r\n                                       /* makes it centered */\r\n                                       max-width: 680px;\r\n                                       padding: 10px;\r\n                                       width: 680px;\r\n                                     }\r\n                                     /* This should also be a block element, so that it will fill 100% of the .container */\r\n\r\n                                     .content {\r\n                                       box-sizing: border-box;\r\n                                       display: block;\r\n                                       margin: 0 auto;\r\n                                       max-width: 680px;\r\n                                       padding: 10px;\r\n                                     }\r\n                                   /* -------------------------------------\r\n                                     HEADER, FOOTER, MAIN\r\n                                     ------------------------------------- */\r\n\r\n                                     .main {\r\n                                       background: #fff;\r\n                                       border-radius: 3px;\r\n                                       width: 100%;\r\n                                     }\r\n                                     .wrapper {\r\n                                       box-sizing: border-box;\r\n                                       padding: 20px;\r\n                                     }\r\n                                     .footer {\r\n                                       clear: both;\r\n                                       padding-top: 10px;\r\n                                       text-align: center;\r\n                                       width: 100%;\r\n                                     }\r\n                                     .footer td,\r\n                                     .footer p,\r\n                                     .footer span,\r\n                                     .footer a {\r\n                                       color: #999999;\r\n                                       font-size: 12px;\r\n                                       text-align: center;\r\n                                     }\r\n                                     hr {\r\n                                       border: 0;\r\n                                       border-bottom: 1px solid #f6f6f6;\r\n                                       margin: 20px 0;\r\n                                     }\r\n                                   /* -------------------------------------\r\n                                     RESPONSIVE AND MOBILE FRIENDLY STYLES\r\n                                     ------------------------------------- */\r\n\r\n                                     @media only screen and (max-width: 620px) {\r\n                                       table[class=body] .content {\r\n                                         padding: 0 !important;\r\n                                       }\r\n                                       table[class=body] .container {\r\n                                         padding: 0 !important;\r\n                                         width: 100% !important;\r\n                                       }\r\n                                       table[class=body] .main {\r\n                                         border-left-width: 0 !important;\r\n                                         border-radius: 0 !important;\r\n                                         border-right-width: 0 !important;\r\n                                       }\r\n                                     }\r\n                                   </style>\r\n                                 </head>\r\n                                 <body class=\"\">\r\n                                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\r\n                                    <tr>\r\n                                     <td>&nbsp;</td>\r\n                                     <td class=\"container\">\r\n                                      <div class=\"content\">\r\n                                        <!-- START CENTERED WHITE CONTAINER -->\r\n                                        <table class=\"main\">\r\n                                          <!-- START MAIN CONTENT AREA -->\r\n                                          <tr>\r\n                                           <td class=\"wrapper\">\r\n                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                              <tr>\r\n                                               <td>',1),(180,'show_pdf_signature_invoice','1',0),(181,'show_pdf_signature_estimate','1',0),(182,'signature_image','',0),(183,'email_footer','</td>\r\n                             </tr>\r\n                           </table>\r\n                         </td>\r\n                       </tr>\r\n                       <!-- END MAIN CONTENT AREA -->\r\n                     </table>\r\n                     <!-- START FOOTER -->\r\n                     <div class=\"footer\">\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                          <td class=\"content-block\">\r\n                            <span>{companyname}</span>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </div>\r\n                    <!-- END FOOTER -->\r\n                    <!-- END CENTERED WHITE CONTAINER -->\r\n                  </div>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n              </tr>\r\n            </table>\r\n            </body>\r\n            </html>',1),(184,'exclude_proposal_from_client_area_with_draft_status','1',1),(185,'pusher_app_key','',1),(186,'pusher_app_secret','',1),(187,'pusher_app_id','',1),(188,'pusher_realtime_notifications','0',1),(189,'pdf_format_statement','A4-PORTRAIT',1),(190,'pusher_cluster','',1),(191,'show_table_export_button','to_all',1),(192,'allow_staff_view_proposals_assigned','1',1),(193,'show_cloudflare_notice','1',0),(194,'task_modal_class','modal-lg',1),(195,'lead_modal_class','modal-lg',1),(196,'show_timesheets_overview_all_members_notice_admins','1',0),(197,'desktop_notifications','0',1),(198,'hide_notified_reminders_from_calendar','1',0),(199,'customer_info_format','{company_name}<br />\r\n{street}<br />\r\n{city} {state}<br />\r\n{country_code} {zip_code}<br />\r\n{vat_number_with_label}',0),(200,'timer_started_change_status_in_progress','1',0),(201,'default_ticket_reply_status','3',1),(202,'default_task_status','auto',1),(203,'email_queue_skip_with_attachments','1',1),(204,'email_queue_enabled','0',1),(205,'last_email_queue_retry','',1),(206,'auto_dismiss_desktop_notifications_after','0',1),(207,'proposal_info_format','{proposal_to}<br />\r\n{address}<br />\r\n{city} {state}<br />\r\n{country_code} {zip_code}<br />\r\n{phone}<br />\r\n{email}',0),(208,'ticket_replies_order','asc',1),(209,'new_recurring_invoice_action','generate_and_send',0),(210,'bcc_emails','',0),(211,'email_templates_language_checks','',0),(212,'proposal_accept_identity_confirmation','1',0),(213,'estimate_accept_identity_confirmation','1',0),(214,'new_task_auto_follower_current_member','0',1),(215,'task_biillable_checked_on_creation','1',1),(216,'predefined_clientnote_credit_note','',1),(217,'predefined_terms_credit_note','',1),(218,'next_credit_note_number','1',1),(219,'credit_note_prefix','CN-',1),(220,'credit_note_number_decrement_on_delete','1',1),(221,'pdf_format_credit_note','A4-PORTRAIT',1),(222,'show_pdf_signature_credit_note','1',0),(223,'show_credit_note_reminders_on_calendar','1',1),(224,'show_amount_due_on_invoice','1',1),(225,'show_total_paid_on_invoice','1',1),(226,'show_credits_applied_on_invoice','1',1),(227,'staff_members_create_inline_lead_status','1',1),(228,'staff_members_create_inline_customer_groups','1',1),(229,'staff_members_create_inline_ticket_services','1',1),(230,'staff_members_save_tickets_predefined_replies','1',1),(231,'staff_members_create_inline_contract_types','1',1),(232,'staff_members_create_inline_expense_categories','1',1),(233,'show_project_on_credit_note','1',1),(234,'proposals_auto_operations_hour','21',1),(235,'estimates_auto_operations_hour','21',1),(236,'contracts_auto_operations_hour','21',1),(237,'credit_note_number_format','1',1),(238,'allow_non_admin_members_to_import_leads','0',1),(239,'e_sign_legal_text','By clicking on \"Sign\", I consent to be legally bound by this electronic representation of my signature.',1),(240,'show_pdf_signature_contract','1',1),(241,'view_contract_only_logged_in','0',1),(242,'show_subscriptions_in_customers_area','1',1),(243,'calendar_only_assigned_tasks','0',1),(244,'after_subscription_payment_captured','send_invoice_and_receipt',1),(245,'mail_engine','phpmailer',1),(246,'gdpr_enable_terms_and_conditions','0',1),(247,'privacy_policy','',1),(248,'terms_and_conditions','',1),(249,'gdpr_enable_terms_and_conditions_lead_form','0',1),(250,'gdpr_enable_terms_and_conditions_ticket_form','0',1),(251,'gdpr_contact_enable_right_to_be_forgotten','0',1),(252,'show_gdpr_in_customers_menu','1',1),(253,'show_gdpr_link_in_footer','1',1),(254,'enable_gdpr','0',1),(255,'gdpr_on_forgotten_remove_invoices_credit_notes','0',1),(256,'gdpr_on_forgotten_remove_estimates','0',1),(257,'gdpr_enable_consent_for_contacts','0',1),(258,'gdpr_consent_public_page_top_block','',1),(259,'gdpr_page_top_information_block','',1),(260,'gdpr_enable_lead_public_form','0',1),(261,'gdpr_show_lead_custom_fields_on_public_form','0',1),(262,'gdpr_lead_attachments_on_public_form','0',1),(263,'gdpr_enable_consent_for_leads','0',1),(264,'gdpr_lead_enable_right_to_be_forgotten','0',1),(265,'allow_staff_view_invoices_assigned','1',1),(266,'gdpr_data_portability_leads','0',1),(267,'gdpr_lead_data_portability_allowed','',1),(268,'gdpr_contact_data_portability_allowed','',1),(269,'gdpr_data_portability_contacts','0',1),(270,'allow_staff_view_estimates_assigned','1',1),(271,'gdpr_after_lead_converted_delete','0',1),(272,'gdpr_show_terms_and_conditions_in_footer','0',1),(273,'save_last_order_for_tables','0',1),(274,'company_logo_dark','',1),(275,'customers_register_require_confirmation','0',1),(276,'allow_non_admin_staff_to_delete_ticket_attachments','0',1),(277,'receive_notification_on_new_ticket_replies','1',0),(278,'google_client_id','',1),(279,'enable_google_picker','1',1),(280,'show_ticket_reminders_on_calendar','1',1),(281,'ticket_import_reply_only','0',1),(282,'visible_customer_profile_tabs','all',0),(283,'show_project_on_invoice','1',1),(284,'show_project_on_estimate','1',1),(285,'staff_members_create_inline_lead_source','1',1),(286,'lead_unique_validation','[\"email\"]',1),(287,'last_upgrade_copy_data','',1),(288,'custom_js_admin_scripts','',1),(289,'custom_js_customer_scripts','0',1),(290,'stripe_webhook_id','',1),(291,'stripe_webhook_signing_secret','',1),(292,'stripe_ideal_webhook_id','',1),(293,'stripe_ideal_webhook_signing_secret','',1),(294,'show_php_version_notice','1',0),(295,'recaptcha_ignore_ips','',1),(296,'show_task_reminders_on_calendar','1',1),(297,'customer_settings','true',1),(298,'tasks_reminder_notification_hour','21',1),(299,'allow_primary_contact_to_manage_other_contacts','0',1),(300,'items_table_amounts_exclude_currency_symbol','1',1),(301,'round_off_task_timer_option','0',1),(302,'round_off_task_timer_time','5',1),(303,'bitly_access_token','',1),(304,'enable_support_menu_badges','0',1),(305,'attach_invoice_to_payment_receipt_email','0',1),(306,'invoice_due_notice_before','2',1),(307,'invoice_due_notice_resend_after','0',1),(308,'_leads_settings','true',1),(309,'show_estimate_request_in_customers_area','0',1),(310,'gdpr_enable_terms_and_conditions_estimate_request_form','0',1),(311,'upgraded_from_version','',0),(312,'identification_key','569390182165733533462c8ee2660319',1),(313,'automatically_stop_task_timer_after_hours','8',1),(314,'automatically_assign_ticket_to_first_staff_responding','0',1),(315,'reminder_for_completed_but_not_billed_tasks','0',1),(316,'staff_notify_completed_but_not_billed_tasks','',1),(317,'reminder_for_completed_but_not_billed_tasks_days','',1),(318,'tasks_reminder_notification_last_notified_day','',1),(319,'sms_clickatell_api_key','',1),(320,'sms_clickatell_active','0',1),(321,'sms_clickatell_initialized','1',1),(322,'sms_msg91_sender_id','',1),(323,'sms_msg91_api_type','api',1),(324,'sms_msg91_auth_key','',1),(325,'sms_msg91_active','0',1),(326,'sms_msg91_initialized','1',1),(327,'sms_twilio_account_sid','',1),(328,'sms_twilio_auth_token','',1),(329,'sms_twilio_phone_number','',1),(330,'sms_twilio_sender_id','',1),(331,'sms_twilio_active','0',1),(332,'sms_twilio_initialized','1',1),(333,'auto_backup_enabled','0',1),(334,'auto_backup_every','7',1),(335,'last_auto_backup','',1),(336,'delete_backups_older_then','0',1),(337,'auto_backup_hour','6',1),(338,'aside_menu_active','[]',1),(339,'setup_menu_active','[]',1),(340,'survey_send_emails_per_cron_run','100',1),(341,'last_survey_send_cron','',1),(342,'theme_style','[]',1),(343,'theme_style_custom_admin_area','',1),(344,'theme_style_custom_clients_area','',1),(345,'theme_style_custom_clients_and_admin_area','',1),(346,'paymentmethod_authorize_acceptjs_active','0',1),(347,'paymentmethod_authorize_acceptjs_label','Authorize.net Accept.js',1),(348,'paymentmethod_authorize_acceptjs_public_key','',0),(349,'paymentmethod_authorize_acceptjs_api_login_id','',0),(350,'paymentmethod_authorize_acceptjs_api_transaction_key','',0),(351,'paymentmethod_authorize_acceptjs_description_dashboard','Payment for Invoice {invoice_number}',0),(352,'paymentmethod_authorize_acceptjs_currencies','USD',0),(353,'paymentmethod_authorize_acceptjs_test_mode_enabled','0',0),(354,'paymentmethod_authorize_acceptjs_default_selected','1',1),(355,'paymentmethod_authorize_acceptjs_initialized','1',1),(356,'paymentmethod_instamojo_active','0',1),(357,'paymentmethod_instamojo_label','Instamojo',1),(358,'paymentmethod_instamojo_api_key','',0),(359,'paymentmethod_instamojo_auth_token','',0),(360,'paymentmethod_instamojo_description_dashboard','Payment for Invoice {invoice_number}',0),(361,'paymentmethod_instamojo_currencies','INR',0),(362,'paymentmethod_instamojo_test_mode_enabled','1',0),(363,'paymentmethod_instamojo_default_selected','1',1),(364,'paymentmethod_instamojo_initialized','1',1),(365,'paymentmethod_mollie_active','0',1),(366,'paymentmethod_mollie_label','Mollie',1),(367,'paymentmethod_mollie_api_key','',0),(368,'paymentmethod_mollie_description_dashboard','Payment for Invoice {invoice_number}',0),(369,'paymentmethod_mollie_currencies','EUR',0),(370,'paymentmethod_mollie_test_mode_enabled','1',0),(371,'paymentmethod_mollie_default_selected','1',1),(372,'paymentmethod_mollie_initialized','1',1),(373,'paymentmethod_paypal_braintree_active','0',1),(374,'paymentmethod_paypal_braintree_label','Braintree',1),(375,'paymentmethod_paypal_braintree_merchant_id','',0),(376,'paymentmethod_paypal_braintree_api_public_key','',0),(377,'paymentmethod_paypal_braintree_api_private_key','',0),(378,'paymentmethod_paypal_braintree_currencies','USD',0),(379,'paymentmethod_paypal_braintree_paypal_enabled','1',0),(380,'paymentmethod_paypal_braintree_test_mode_enabled','1',0),(381,'paymentmethod_paypal_braintree_default_selected','1',1),(382,'paymentmethod_paypal_braintree_initialized','1',1),(383,'paymentmethod_paypal_checkout_active','1',1),(384,'paymentmethod_paypal_checkout_label','Paypal Smart Checkout',1),(385,'paymentmethod_paypal_checkout_client_id','AXowujtgCLP_P493asNbn7eTmu6f3tC0lioyD_FF2_2x2UiW_7pqto9RessJ0RDUgWVAIyilqSOXjZ9c',0),(386,'paymentmethod_paypal_checkout_secret','56b4fd6a3b18199bd7f620320eab6c5012aea1587ef48d8733face18c74b454e5298a5f8ba23b60edbb75ee9ad421661b7ea994b337860b344b9fcd0e1f4690doVeKt/VCvvFdQHCY9PQcF4bLBvzzEPNkrvju705bk83qDh0iQUG8OouuUdvrLeZTd3FN0WngrAdeDdDyZbgFKDr3YBKOz5+23IdbUuO9+b3Yf9/UBgwEuejpY2nTVdHVeDaiApRA9q0nfV14tqNbBQ==',0),(387,'paymentmethod_paypal_checkout_payment_description','Payment for Invoice {invoice_number}',0),(388,'paymentmethod_paypal_checkout_currencies','USD,CAD,EUR',0),(389,'paymentmethod_paypal_checkout_test_mode_enabled','1',0),(390,'paymentmethod_paypal_checkout_default_selected','1',1),(391,'paymentmethod_paypal_checkout_initialized','1',1),(392,'paymentmethod_paypal_active','0',1),(393,'paymentmethod_paypal_label','Paypal',1),(394,'paymentmethod_paypal_username','',0),(395,'paymentmethod_paypal_password','',0),(396,'paymentmethod_paypal_signature','',0),(397,'paymentmethod_paypal_description_dashboard','Payment for Invoice {invoice_number}',0),(398,'paymentmethod_paypal_currencies','EUR,USD',0),(399,'paymentmethod_paypal_test_mode_enabled','1',0),(400,'paymentmethod_paypal_default_selected','1',1),(401,'paymentmethod_paypal_initialized','1',1),(402,'paymentmethod_payu_money_active','0',1),(403,'paymentmethod_payu_money_label','PayU Money',1),(404,'paymentmethod_payu_money_key','',0),(405,'paymentmethod_payu_money_salt','',0),(406,'paymentmethod_payu_money_description_dashboard','Payment for Invoice {invoice_number}',0),(407,'paymentmethod_payu_money_currencies','INR',0),(408,'paymentmethod_payu_money_test_mode_enabled','1',0),(409,'paymentmethod_payu_money_default_selected','1',1),(410,'paymentmethod_payu_money_initialized','1',1),(411,'paymentmethod_stripe_active','0',1),(412,'paymentmethod_stripe_label','Stripe Checkout',1),(413,'paymentmethod_stripe_api_publishable_key','',0),(414,'paymentmethod_stripe_api_secret_key','',0),(415,'paymentmethod_stripe_description_dashboard','Payment for Invoice {invoice_number}',0),(416,'paymentmethod_stripe_currencies','USD,CAD',0),(417,'paymentmethod_stripe_allow_primary_contact_to_update_credit_card','1',0),(418,'paymentmethod_stripe_default_selected','1',1),(419,'paymentmethod_stripe_initialized','1',1),(420,'paymentmethod_stripe_ideal_active','0',1),(421,'paymentmethod_stripe_ideal_label','Stripe iDEAL',1),(422,'paymentmethod_stripe_ideal_api_secret_key','',0),(423,'paymentmethod_stripe_ideal_api_publishable_key','',0),(424,'paymentmethod_stripe_ideal_description_dashboard','Payment for Invoice {invoice_number}',0),(425,'paymentmethod_stripe_ideal_statement_descriptor','Payment for Invoice {invoice_number}',0),(426,'paymentmethod_stripe_ideal_currencies','EUR',0),(427,'paymentmethod_stripe_ideal_default_selected','1',1),(428,'paymentmethod_stripe_ideal_initialized','1',1),(429,'paymentmethod_two_checkout_active','0',1),(430,'paymentmethod_two_checkout_label','2Checkout',1),(431,'paymentmethod_two_checkout_merchant_code','',0),(432,'paymentmethod_two_checkout_secret_key','',0),(433,'paymentmethod_two_checkout_description','Payment for Invoice {invoice_number}',0),(434,'paymentmethod_two_checkout_currencies','USD, EUR, GBP',0),(435,'paymentmethod_two_checkout_test_mode_enabled','1',0),(436,'paymentmethod_two_checkout_default_selected','1',1),(437,'paymentmethod_two_checkout_initialized','1',1),(438,'warehouse_selling_price_rule_profif_ratio','0',1),(439,'profit_rate_by_purchase_price_sale','0',1),(440,'warehouse_the_fractional_part','0',1),(441,'warehouse_integer_part','0',1),(442,'auto_create_goods_received','0',1),(443,'auto_create_goods_delivery','0',1),(444,'goods_receipt_warehouse','0',1),(445,'barcode_with_sku_code','0',1),(446,'revert_goods_receipt_goods_delivery','0',1),(447,'cancelled_invoice_reverse_inventory_delivery_voucher','0',1),(448,'uncancelled_invoice_create_inventory_delivery_voucher','0',1),(449,'inventory_auto_operations_hour','0',1),(450,'automatically_send_items_expired_before','0',1),(451,'inventorys_cronjob_active','0',1),(452,'inventory_cronjob_notification_recipients','',1),(453,'inventory_received_number_prefix','NK',1),(454,'next_inventory_received_mumber','1',1),(455,'inventory_delivery_number_prefix','XK',1),(456,'next_inventory_delivery_mumber','1',1),(457,'internal_delivery_number_prefix','ID',1),(458,'next_internal_delivery_mumber','1',1),(459,'item_sku_prefix','',1),(460,'goods_receipt_required_po','0',1),(461,'goods_delivery_required_po','0',1),(462,'goods_delivery_pdf_display','0',1),(463,'display_product_name_when_print_barcode','0',1),(464,'show_item_cf_on_pdf','0',1),(465,'goods_delivery_pdf_display_outstanding','0',1),(466,'goods_delivery_pdf_display_warehouse_lotnumber_bottom_infor','0',1),(467,'packing_list_number_prefix','PL',1),(468,'next_packing_list_number','1',1),(469,'support_contact','enable',1),(470,'support_contact_viber','+396946941040',1),(471,'support_contact_whatsapp','+396946941040',1),(472,'support_contact_messenger_username','helpsupport',1),(473,'support_contact_email_address','info@helpsupport.com',1),(474,'aio_support_backend','0',1),(475,'aio_support_frontend','0',1),(476,'staff_sync_orders','1',1),(477,'minute_sync_orders','',1),(478,'time_cron_woo','',1),(479,'minute_sync','',1),(480,'sync_omni_sales_products','1',1),(481,'sync_omni_sales_orders','1',1),(482,'sync_omni_sales_inventorys','1',1),(483,'sync_omni_sales_description','1',1),(484,'sync_omni_sales_images','1',1),(485,'price_crm_woo','1',1),(486,'product_info_enable_disable','1',1),(487,'product_info_image_enable_disable','1',1),(488,'minute_sync_product_info_time1','',1),(489,'minute_sync_inventory_info_time2','',1),(490,'minute_sync_price_time3','',1),(491,'minute_sync_decriptions_time4','',1),(492,'minute_sync_images_time5','',1),(493,'minute_sync_product_info_time7','',1),(494,'minute_sync_product_info_images_time8','',1),(495,'records_time1','22:56:39',1),(496,'records_time2','22:56:39',1),(497,'records_time3','22:56:39',1),(498,'records_time4','22:56:39',1),(499,'records_time5','22:56:39',1),(500,'records_time6','22:56:39',1),(501,'records_time7','22:56:39',1),(502,'records_time8','22:56:39',1),(503,'acc_first_month_of_financial_year','January',1),(504,'acc_first_month_of_tax_year','same_as_financial_year',1),(505,'acc_accounting_method','accrual',1),(506,'acc_close_the_books','0',1),(507,'acc_allow_changes_after_viewing','allow_changes_after_viewing_a_warning',1),(508,'acc_close_book_password','',1),(509,'acc_close_book_passwordr','',1),(510,'acc_enable_account_numbers','0',1),(511,'acc_show_account_numbers','0',1),(512,'acc_closing_date','',1),(513,'acc_add_default_account','1',1),(514,'acc_add_default_account_new','0',1),(515,'acc_invoice_automatic_conversion','1',1),(516,'acc_payment_automatic_conversion','1',1),(517,'acc_expense_automatic_conversion','1',1),(518,'acc_tax_automatic_conversion','1',1),(519,'acc_invoice_payment_account','66',1),(520,'acc_invoice_deposit_to','1',1),(521,'acc_payment_payment_account','1',1),(522,'acc_payment_deposit_to','13',1),(523,'acc_expense_payment_account','13',1),(524,'acc_expense_deposit_to','80',1),(525,'acc_tax_payment_account','29',1),(526,'acc_tax_deposit_to','1',1),(527,'acc_expense_tax_payment_account','13',1),(528,'acc_expense_tax_deposit_to','29',1),(529,'acc_active_payment_mode_mapping','1',1),(530,'acc_active_expense_category_mapping','1',1),(531,'acc_payment_expense_automatic_conversion','1',1),(532,'acc_payment_sale_automatic_conversion','1',1),(533,'acc_expense_payment_payment_account','1',1),(534,'acc_expense_payment_deposit_to','1',1),(535,'acc_pl_total_insurance_automatic_conversion','1',1),(536,'acc_pl_total_insurance_payment_account','13',1),(537,'acc_pl_total_insurance_deposit_to','32',1),(538,'acc_pl_tax_paye_automatic_conversion','1',1),(539,'acc_pl_tax_paye_payment_account','13',1),(540,'acc_pl_tax_paye_deposit_to','28',1),(541,'acc_pl_net_pay_automatic_conversion','1',1),(542,'acc_pl_net_pay_payment_account','13',1),(543,'acc_pl_net_pay_deposit_to','56',1),(544,'acc_wh_stock_import_automatic_conversion','1',1),(545,'acc_wh_stock_import_payment_account','87',1),(546,'acc_wh_stock_import_deposit_to','37',1),(547,'acc_wh_stock_export_automatic_conversion','1',1),(548,'acc_wh_stock_export_payment_account','37',1),(549,'acc_wh_stock_export_deposit_to','1',1),(550,'acc_wh_loss_adjustment_automatic_conversion','1',1),(551,'acc_wh_decrease_payment_account','37',1),(552,'acc_wh_decrease_deposit_to','1',1),(553,'acc_wh_increase_payment_account','87',1),(554,'acc_wh_increase_deposit_to','37',1),(555,'acc_wh_opening_stock_automatic_conversion','1',1),(556,'acc_wh_opening_stock_payment_account','88',1),(557,'acc_wh_opening_stock_deposit_to','37',1),(558,'acc_pur_order_automatic_conversion','1',1),(559,'acc_pur_order_payment_account','13',1),(560,'acc_pur_order_deposit_to','80',1),(561,'acc_pur_payment_automatic_conversion','1',1),(562,'acc_pur_payment_payment_account','16',1),(563,'acc_pur_payment_deposit_to','37',1),(564,'products_enabled','1',1),(565,'product_menu_disabled','0',1),(566,'product_low_quantity','10',1),(567,'product_flat_rate_shipping','0',1),(568,'product_tax_for_shipping_cost','0',1),(569,'recruitment_create_campaign_with_plan','1',1),(570,'sms_trigger_invoice_overdue_notice','',0),(571,'sms_trigger_invoice_due_notice','',0),(572,'sms_trigger_invoice_payment_recorded','',0),(573,'sms_trigger_estimate_expiration_reminder','',0),(574,'sms_trigger_proposal_expiration_reminder','',0),(575,'sms_trigger_proposal_new_comment_to_customer','',0),(576,'sms_trigger_proposal_new_comment_to_staff','',0),(577,'sms_trigger_contract_new_comment_to_customer','',0),(578,'sms_trigger_contract_new_comment_to_staff','',0),(579,'sms_trigger_contract_expiration_reminder','',0),(580,'sms_trigger_staff_reminder','',0);
/*!40000 ALTER TABLE `tbloptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorder_items`
--

DROP TABLE IF EXISTS `tblorder_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorder_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorder_items`
--

LOCK TABLES `tblorder_items` WRITE;
/*!40000 ALTER TABLE `tblorder_items` DISABLE KEYS */;
INSERT INTO `tblorder_items` VALUES (1,1,1,1.00,450.00),(2,2,1,1.00,450.00);
/*!40000 ALTER TABLE `tblorder_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorder_master`
--

DROP TABLE IF EXISTS `tblorder_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblorder_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `order_date` date NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `clientid` (`clientid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorder_master`
--

LOCK TABLES `tblorder_master` WRITE;
/*!40000 ALTER TABLE `tblorder_master` DISABLE KEYS */;
INSERT INTO `tblorder_master` VALUES (1,1,1,'2022-07-12 02:52:09','2022-07-12',450.00,450.00,1),(2,2,1,'2022-07-12 02:53:28','2022-07-12',450.00,450.00,1);
/*!40000 ALTER TABLE `tblorder_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblp_t_form_question_box_description`
--

DROP TABLE IF EXISTS `tblp_t_form_question_box_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblp_t_form_question_box_description` (
  `questionboxdescriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int(11) NOT NULL,
  `correct` int(11) DEFAULT 1 COMMENT '0: correct 1: incorrect',
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblp_t_form_question_box_description`
--

LOCK TABLES `tblp_t_form_question_box_description` WRITE;
/*!40000 ALTER TABLE `tblp_t_form_question_box_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblp_t_form_question_box_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpayment_modes`
--

DROP TABLE IF EXISTS `tblpayment_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpayment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `show_on_pdf` int(11) NOT NULL DEFAULT 0,
  `invoices_only` int(11) NOT NULL DEFAULT 0,
  `expenses_only` int(11) NOT NULL DEFAULT 0,
  `selected_by_default` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpayment_modes`
--

LOCK TABLES `tblpayment_modes` WRITE;
/*!40000 ALTER TABLE `tblpayment_modes` DISABLE KEYS */;
INSERT INTO `tblpayment_modes` VALUES (1,'Bank',NULL,0,0,0,1,1);
/*!40000 ALTER TABLE `tblpayment_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpayroll_table`
--

DROP TABLE IF EXISTS `tblpayroll_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpayroll_table` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payroll_month` date NOT NULL,
  `payroll_type` int(11) unsigned DEFAULT NULL,
  `template_data` longtext DEFAULT NULL,
  `status` int(11) unsigned DEFAULT 0 COMMENT '1:đã chốt 0:chưa chốt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpayroll_table`
--

LOCK TABLES `tblpayroll_table` WRITE;
/*!40000 ALTER TABLE `tblpayroll_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpayroll_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpayroll_type`
--

DROP TABLE IF EXISTS `tblpayroll_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpayroll_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payroll_type_name` varchar(100) NOT NULL,
  `department_id` longtext DEFAULT NULL,
  `role_id` longtext DEFAULT NULL,
  `position_id` longtext DEFAULT NULL,
  `salary_form_id` int(11) unsigned DEFAULT NULL COMMENT '1:Chính 2:Phụ cấp',
  `manager_id` int(11) unsigned DEFAULT NULL,
  `follower_id` int(11) unsigned DEFAULT NULL,
  `template` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpayroll_type`
--

LOCK TABLES `tblpayroll_type` WRITE;
/*!40000 ALTER TABLE `tblpayroll_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpayroll_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpinned_projects`
--

DROP TABLE IF EXISTS `tblpinned_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpinned_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpinned_projects`
--

LOCK TABLES `tblpinned_projects` WRITE;
/*!40000 ALTER TABLE `tblpinned_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpinned_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblposition_training_question_form`
--

DROP TABLE IF EXISTS `tblposition_training_question_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblposition_training_question_form` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `question_order` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblposition_training_question_form`
--

LOCK TABLES `tblposition_training_question_form` WRITE;
/*!40000 ALTER TABLE `tblposition_training_question_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblposition_training_question_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_categories`
--

DROP TABLE IF EXISTS `tblproduct_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_categories` (
  `p_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_category_name` varchar(50) NOT NULL,
  `p_category_description` text NOT NULL,
  PRIMARY KEY (`p_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_categories`
--

LOCK TABLES `tblproduct_categories` WRITE;
/*!40000 ALTER TABLE `tblproduct_categories` DISABLE KEYS */;
INSERT INTO `tblproduct_categories` VALUES (1,'Computer','All brands to available'),(2,'Accesessories','Full design brands'),(3,'Electronic','All products electronic'),(4,'Laptop','Portatil Computer personal');
/*!40000 ALTER TABLE `tblproduct_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct_master`
--

DROP TABLE IF EXISTS `tblproduct_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduct_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `taxes` varchar(255) NOT NULL,
  `quantity_number` int(11) NOT NULL,
  `is_digital` tinyint(1) NOT NULL DEFAULT 0,
  `product_image` varchar(200) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) NOT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `cycles` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_category_id` (`product_category_id`),
  CONSTRAINT `tblproduct_master_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `tblproduct_categories` (`p_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduct_master`
--

LOCK TABLES `tblproduct_master` WRITE;
/*!40000 ALTER TABLE `tblproduct_master` DISABLE KEYS */;
INSERT INTO `tblproduct_master` VALUES (1,'AMD Ryzen 7 Mini PC Am02 Mini Computer Athlon 300u Win10PRO/Linux Desktop Gaming PC 4K HD Radeon Vega 3 Graphics 8GB Android TV Box DDR4 256 GB Nvme SSD Mini PC','Basic Info.\r\nModel NO.\r\nAM02\r\nOS\r\nWin11/10/Ubuntun\r\nStorage Interface\r\n1*M.2 Nvme(Support 32GB/64GB/128GB/258GB SSD )\r\nMemory\r\nSdimm-DDR3-1600 Max 8GB\r\nWireless\r\nDual Band WiFi Support 2.4GB/5.0GB/316',1,450.00,'',350,0,'product_1.png',0,'',0,0),(2,'Fanless Industrial Ultra Low Power Complete Multifunction Linux Desktop Micro Mini Tower PC Pocket Computer Mini PC Desktop Set','Model NO.\r\nAK7\r\nCPU Frequency\r\n1.5-2.0GHz\r\nProduct Name\r\nAk7 Factory Mini PC Desktop for Business Home Educ\r\nCPU Detail\r\nSupport Intel Core Apollo Lake Celeron DC or QC,\r\nMemory\r\nDDR3-1600 So-on Bard ',1,622.00,'',350,0,'product_2.jpg',0,'',0,0);
/*!40000 ALTER TABLE `tblproduct_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproject_activity`
--

DROP TABLE IF EXISTS `tblproject_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproject_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `fullname` varchar(100) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT 0,
  `description_key` varchar(191) NOT NULL COMMENT 'Language file key',
  `additional_data` text DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproject_activity`
--

LOCK TABLES `tblproject_activity` WRITE;
/*!40000 ALTER TABLE `tblproject_activity` DISABLE KEYS */;
INSERT INTO `tblproject_activity` VALUES (1,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_added_team_member','JORGE GARCIA CARDENAS','2022-07-13 10:15:00'),(2,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_created','','2022-07-13 10:15:00'),(3,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','LEVANTAMIENTO DE IMAGEN CORPORATIVA SET 1 - JORGE GARCIA CARDENAS','2022-07-13 10:18:08'),(4,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_attachment','LEVANTAMIENTO DE IMAGEN CORPORATIVA SET 1','2022-07-13 10:19:49'),(5,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','LEVANTAMIENTO DE IMAGEN CORPORATIVA SET 1','2022-07-13 10:19:58'),(6,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_comment','LEVANTAMIENTO DE IMAGEN CORPORATIVA SET 1','2022-07-13 10:22:16'),(7,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','VIDEO CORPORATIVO - JORGE GARCIA CARDENAS','2022-07-13 10:38:37'),(8,1,3,0,'FABIOLA RAMIREZ',1,'project_activity_new_task_assignee','Levantamiento de imagen set 2 - JORGE GARCIA CARDENAS','2022-07-13 10:58:00'),(9,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_added_team_member','FABIOLA RAMIREZ','2022-07-13 11:04:22'),(10,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_updated','','2022-07-13 11:04:22'),(11,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','ESTRATEGIA DE MARKETING - JORGE GARCIA CARDENAS','2022-07-13 11:19:43'),(12,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','ESTUDIO DE MERCADO - JORGE GARCIA CARDENAS','2022-07-13 11:20:49'),(13,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','Ejecucion de Sitemap - JORGE GARCIA CARDENAS','2022-07-13 14:03:54'),(14,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','configuracion de Google tag - JORGE GARCIA CARDENAS','2022-07-13 14:04:31'),(15,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_updated','','2022-07-13 14:15:20'),(16,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_deleted','Levantamiento de imagen set 2','2022-07-13 17:02:28'),(17,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','SITEMAP CREATE - JORGE GARCIA CARDENAS','2022-07-13 23:21:58'),(18,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_attachment','SITEMAP CREATE','2022-07-13 23:23:09'),(19,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_comment','SITEMAP CREATE','2022-07-13 23:23:31'),(20,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_attachment','SITEMAP CREATE','2022-07-13 23:24:04'),(21,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_comment','SITEMAP CREATE','2022-07-13 23:24:16'),(22,1,1,0,'JORGE GARCIA CARDENAS',1,'not_project_activity_task_status_changed','Ejecucion de Sitemap - <span class=\"label\" style=\"border: 1px solid #adca65;color:#adca65;\">Awaiting Feedback</span>','2022-07-13 23:24:42'),(23,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_attachment','Ejecucion de Sitemap','2022-07-13 23:27:27'),(24,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_comment','Ejecucion de Sitemap','2022-07-13 23:27:45'),(25,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','SITEMAP CREATE','2022-07-13 23:28:05'),(26,1,1,0,'JORGE GARCIA CARDENAS',1,'not_project_activity_task_status_changed','ESTRATEGIA DE MARKETING - <span class=\"label\" style=\"border: 1px solid #adca65;color:#adca65;\">Awaiting Feedback</span>','2022-07-18 15:58:53'),(27,1,1,0,'JORGE GARCIA CARDENAS',1,'not_project_activity_task_status_changed','ESTUDIO DE MERCADO - <span class=\"label\" style=\"border: 1px solid #adca65;color:#adca65;\">Awaiting Feedback</span>','2022-07-18 15:59:00'),(28,1,1,0,'JORGE GARCIA CARDENAS',1,'not_project_activity_task_status_changed','configuracion de Google tag - <span class=\"label\" style=\"border: 1px solid #adca65;color:#adca65;\">Awaiting Feedback</span>','2022-07-18 15:59:02'),(29,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','Ejecucion de Sitemap','2022-07-18 15:59:13'),(30,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','ESTRATEGIA DE MARKETING','2022-07-18 15:59:19'),(31,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','configuracion de Google tag','2022-07-18 15:59:22'),(32,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','ESTUDIO DE MERCADO','2022-07-18 15:59:26'),(33,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_assignee','CONFIGURACION GOOGLE TOOLS - JORGE GARCIA CARDENAS','2022-07-18 16:00:46'),(34,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_new_task_attachment','CONFIGURACION GOOGLE TOOLS','2022-07-18 16:02:04'),(35,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_marked_complete','CONFIGURACION GOOGLE TOOLS','2022-07-18 17:47:11'),(36,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_deleted','VIDEO CORPORATIVO','2022-07-20 12:11:55'),(37,1,1,0,'JORGE GARCIA CARDENAS',1,'project_activity_task_deleted','LOGO 3D','2022-07-20 12:12:02');
/*!40000 ALTER TABLE `tblproject_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproject_files`
--

DROP TABLE IF EXISTS `tblproject_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproject_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) NOT NULL,
  `original_file_name` mediumtext DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `visible_to_customer` tinyint(1) DEFAULT 0,
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `external` varchar(40) DEFAULT NULL,
  `external_link` text DEFAULT NULL,
  `thumbnail_link` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproject_files`
--

LOCK TABLES `tblproject_files` WRITE;
/*!40000 ALTER TABLE `tblproject_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproject_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproject_members`
--

DROP TABLE IF EXISTS `tblproject_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproject_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproject_members`
--

LOCK TABLES `tblproject_members` WRITE;
/*!40000 ALTER TABLE `tblproject_members` DISABLE KEYS */;
INSERT INTO `tblproject_members` VALUES (1,1,1);
/*!40000 ALTER TABLE `tblproject_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproject_notes`
--

DROP TABLE IF EXISTS `tblproject_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproject_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproject_notes`
--

LOCK TABLES `tblproject_notes` WRITE;
/*!40000 ALTER TABLE `tblproject_notes` DISABLE KEYS */;
INSERT INTO `tblproject_notes` VALUES (1,1,'Requerimiento para Community manager<img src=\"https://app.ltysmx.com/erp/media/logobtl-removebg-preview.png\" width=\"296\" height=\"228\" alt=\"\" /><br /><br /><br />URGENTE<br />&nbsp; &nbsp; &nbsp; ACCESO A CUENTA DE FACEBOOK META BUSINESS<br />&nbsp; &nbsp; &nbsp;&nbsp;<br />\r\n<ol>\r\n<li>Contenido para creacion de publicaciones.\r\n<ol>\r\n<li>Imagenes videos textos</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<ol>\r\n<li>Difusion de servicios y productos\r\n<ol>\r\n<li>3 productos populares (caracteristicas y especificaciones generales)</li>\r\n<li>3 publicaciones impactantes de Gravity (producto estrella servicio popular y areas caracteristicas y especificaciones generales)</li>\r\n<li>3 ofertas de productos y servicios (caracteristicas y especificaciones generales)</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<ol>\r\n<li>Levantamiento de imagen 2da parte\r\n<ol>\r\n<li>GRABACION EL DIA SABADO EN OFICINA TORUS 13:00 HRS</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<br />SE PIDE DE SU APOYO PARA ENVIAR REQUERIMIENTOS EL DIA DE HOY PARA CONTINUAR CON LA ATRACCION DE LEADS',1);
/*!40000 ALTER TABLE `tblproject_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproject_settings`
--

DROP TABLE IF EXISTS `tblproject_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproject_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproject_settings`
--

LOCK TABLES `tblproject_settings` WRITE;
/*!40000 ALTER TABLE `tblproject_settings` DISABLE KEYS */;
INSERT INTO `tblproject_settings` VALUES (1,1,'available_features','a:16:{s:16:\"project_overview\";i:1;s:13:\"project_tasks\";i:1;s:18:\"project_timesheets\";i:1;s:18:\"project_milestones\";i:1;s:13:\"project_files\";i:1;s:19:\"project_discussions\";i:1;s:13:\"project_gantt\";i:1;s:15:\"project_tickets\";i:1;s:17:\"project_contracts\";i:1;s:16:\"project_invoices\";i:1;s:17:\"project_estimates\";i:1;s:16:\"project_expenses\";i:1;s:20:\"project_credit_notes\";i:1;s:21:\"project_subscriptions\";i:1;s:13:\"project_notes\";i:1;s:16:\"project_activity\";i:1;}'),(2,1,'view_tasks','1'),(3,1,'create_tasks','1'),(4,1,'edit_tasks','1'),(5,1,'comment_on_tasks','1'),(6,1,'view_task_comments','1'),(7,1,'view_task_attachments','1'),(8,1,'view_task_checklist_items','1'),(9,1,'upload_on_tasks','1'),(10,1,'view_task_total_logged_time','1'),(11,1,'view_finance_overview','1'),(12,1,'upload_files','1'),(13,1,'open_discussions','1'),(14,1,'view_milestones','1'),(15,1,'view_gantt','1'),(16,1,'view_timesheets','1'),(17,1,'view_activity_log','1'),(18,1,'view_team_members','1'),(19,1,'hide_tasks_on_main_tasks_table','0');
/*!40000 ALTER TABLE `tblproject_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprojectdiscussioncomments`
--

DROP TABLE IF EXISTS `tblprojectdiscussioncomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprojectdiscussioncomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) NOT NULL,
  `discussion_type` varchar(10) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `staff_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT 0,
  `fullname` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `file_mime_type` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprojectdiscussioncomments`
--

LOCK TABLES `tblprojectdiscussioncomments` WRITE;
/*!40000 ALTER TABLE `tblprojectdiscussioncomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprojectdiscussioncomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprojectdiscussions`
--

DROP TABLE IF EXISTS `tblprojectdiscussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprojectdiscussions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL DEFAULT 0,
  `datecreated` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprojectdiscussions`
--

LOCK TABLES `tblprojectdiscussions` WRITE;
/*!40000 ALTER TABLE `tblprojectdiscussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprojectdiscussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprojects`
--

DROP TABLE IF EXISTS `tblprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprojects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `clientid` int(11) NOT NULL,
  `billing_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `project_created` date NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `progress` int(11) DEFAULT 0,
  `progress_from_tasks` int(11) NOT NULL DEFAULT 1,
  `project_cost` decimal(15,2) DEFAULT NULL,
  `project_rate_per_hour` decimal(15,2) DEFAULT NULL,
  `estimated_hours` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `contact_notification` int(11) DEFAULT 1,
  `notify_contacts` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprojects`
--

LOCK TABLES `tblprojects` WRITE;
/*!40000 ALTER TABLE `tblprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproposal_comments`
--

DROP TABLE IF EXISTS `tblproposal_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproposal_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext DEFAULT NULL,
  `proposalid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproposal_comments`
--

LOCK TABLES `tblproposal_comments` WRITE;
/*!40000 ALTER TABLE `tblproposal_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproposal_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproposals`
--

DROP TABLE IF EXISTS `tblproposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount_total` decimal(15,2) NOT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `currency` int(11) NOT NULL,
  `open_till` date DEFAULT NULL,
  `date` date NOT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(40) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `proposal_to` varchar(191) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(50) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `pipeline_order` int(11) DEFAULT 1,
  `is_expiry_notified` int(11) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  `processing` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproposals`
--

LOCK TABLES `tblproposals` WRITE;
/*!40000 ALTER TABLE `tblproposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprovince_city`
--

DROP TABLE IF EXISTS `tblprovince_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblprovince_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_code` varchar(45) NOT NULL,
  `province_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprovince_city`
--

LOCK TABLES `tblprovince_city` WRITE;
/*!40000 ALTER TABLE `tblprovince_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprovince_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_approval_details`
--

DROP TABLE IF EXISTS `tblpur_approval_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_approval_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` varchar(45) DEFAULT NULL,
  `approve` varchar(45) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  `staff_approve` int(11) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_approval_details`
--

LOCK TABLES `tblpur_approval_details` WRITE;
/*!40000 ALTER TABLE `tblpur_approval_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_approval_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_approval_setting`
--

DROP TABLE IF EXISTS `tblpur_approval_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_approval_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `related` varchar(255) NOT NULL,
  `setting` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_approval_setting`
--

LOCK TABLES `tblpur_approval_setting` WRITE;
/*!40000 ALTER TABLE `tblpur_approval_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_approval_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_contacts`
--

DROP TABLE IF EXISTS `tblpur_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_contacts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT 1,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT 1,
  `estimate_emails` tinyint(1) NOT NULL DEFAULT 1,
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT 1,
  `contract_emails` tinyint(1) NOT NULL DEFAULT 1,
  `task_emails` tinyint(1) NOT NULL DEFAULT 1,
  `project_emails` tinyint(1) NOT NULL DEFAULT 1,
  `ticket_emails` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_contacts`
--

LOCK TABLES `tblpur_contacts` WRITE;
/*!40000 ALTER TABLE `tblpur_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_contracts`
--

DROP TABLE IF EXISTS `tblpur_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_contracts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(200) NOT NULL,
  `contract_name` varchar(200) NOT NULL,
  `content` longtext DEFAULT NULL,
  `vendor` int(11) NOT NULL,
  `pur_order` int(11) NOT NULL,
  `contract_value` decimal(15,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `buyer` int(11) DEFAULT NULL,
  `time_payment` date DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `signed` int(32) NOT NULL DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `signer` int(11) DEFAULT NULL,
  `signed_date` date DEFAULT NULL,
  `signed_status` varchar(50) DEFAULT NULL,
  `service_category` text DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `payment_terms` text DEFAULT NULL,
  `payment_amount` decimal(15,2) DEFAULT NULL,
  `payment_cycle` varchar(50) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_contracts`
--

LOCK TABLES `tblpur_contracts` WRITE;
/*!40000 ALTER TABLE `tblpur_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_estimate_detail`
--

DROP TABLE IF EXISTS `tblpur_estimate_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_estimate_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pur_estimate` int(11) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_price` decimal(15,0) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `tax` text DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `total_money` decimal(15,2) DEFAULT NULL,
  `discount_money` decimal(15,2) DEFAULT NULL,
  `discount_%` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_estimate_detail`
--

LOCK TABLES `tblpur_estimate_detail` WRITE;
/*!40000 ALTER TABLE `tblpur_estimate_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_estimate_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_estimates`
--

DROP TABLE IF EXISTS `tblpur_estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_estimates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `datesend` datetime DEFAULT NULL,
  `vendor` int(11) NOT NULL,
  `deleted_vendor_name` varchar(100) DEFAULT NULL,
  `pur_request` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `vendornote` text DEFAULT NULL,
  `adminnote` text DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `buyer` int(11) NOT NULL DEFAULT 0,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `pipeline_order` int(11) NOT NULL DEFAULT 0,
  `is_expiry_notified` int(11) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_estimates`
--

LOCK TABLES `tblpur_estimates` WRITE;
/*!40000 ALTER TABLE `tblpur_estimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_estimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_invoice_payment`
--

DROP TABLE IF EXISTS `tblpur_invoice_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_invoice_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pur_invoice` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` longtext DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext DEFAULT NULL,
  `approval_status` int(2) DEFAULT NULL,
  `requester` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_invoice_payment`
--

LOCK TABLES `tblpur_invoice_payment` WRITE;
/*!40000 ALTER TABLE `tblpur_invoice_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_invoice_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_invoices`
--

DROP TABLE IF EXISTS `tblpur_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_invoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `invoice_number` text DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `contract` int(11) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `transactionid` mediumtext DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `payment_request_status` varchar(30) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `vendor_note` text DEFAULT NULL,
  `adminnote` text DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `add_from` int(11) DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `pur_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_invoices`
--

LOCK TABLES `tblpur_invoices` WRITE;
/*!40000 ALTER TABLE `tblpur_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_order_detail`
--

DROP TABLE IF EXISTS `tblpur_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pur_order` int(11) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `tax` text DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `discount_%` decimal(15,2) DEFAULT NULL,
  `discount_money` decimal(15,2) DEFAULT NULL,
  `total_money` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_order_detail`
--

LOCK TABLES `tblpur_order_detail` WRITE;
/*!40000 ALTER TABLE `tblpur_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_order_payment`
--

DROP TABLE IF EXISTS `tblpur_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_order_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pur_order` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` longtext DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_order_payment`
--

LOCK TABLES `tblpur_order_payment` WRITE;
/*!40000 ALTER TABLE `tblpur_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_orders`
--

DROP TABLE IF EXISTS `tblpur_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pur_order_name` varchar(100) NOT NULL,
  `vendor` int(11) NOT NULL,
  `estimate` int(11) NOT NULL,
  `pur_order_number` varchar(30) NOT NULL,
  `order_date` date NOT NULL,
  `status` int(32) NOT NULL DEFAULT 1,
  `approve_status` int(32) NOT NULL DEFAULT 1,
  `datecreated` datetime NOT NULL,
  `days_owed` int(11) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `vendornote` text DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) DEFAULT NULL,
  `buyer` int(11) NOT NULL DEFAULT 0,
  `status_goods` int(11) NOT NULL DEFAULT 0,
  `number` int(11) DEFAULT NULL,
  `expense_convert` int(11) DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `clients` text DEFAULT NULL,
  `delivery_status` int(2) DEFAULT 0,
  `type` text DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `pur_request` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `tax_order_rate` decimal(15,2) DEFAULT NULL,
  `tax_order_amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_orders`
--

LOCK TABLES `tblpur_orders` WRITE;
/*!40000 ALTER TABLE `tblpur_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_request`
--

DROP TABLE IF EXISTS `tblpur_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pur_rq_code` varchar(45) NOT NULL,
  `pur_rq_name` varchar(100) NOT NULL,
  `rq_description` text DEFAULT NULL,
  `requester` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `request_date` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  `status_goods` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `from_items` int(2) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_request`
--

LOCK TABLES `tblpur_request` WRITE;
/*!40000 ALTER TABLE `tblpur_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_request_detail`
--

DROP TABLE IF EXISTS `tblpur_request_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_request_detail` (
  `prd_id` int(11) NOT NULL AUTO_INCREMENT,
  `pur_request` int(11) NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `inventory_quantity` int(11) DEFAULT 0,
  `item_text` text DEFAULT NULL,
  PRIMARY KEY (`prd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_request_detail`
--

LOCK TABLES `tblpur_request_detail` WRITE;
/*!40000 ALTER TABLE `tblpur_request_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_request_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_unit`
--

DROP TABLE IF EXISTS `tblpur_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_unit`
--

LOCK TABLES `tblpur_unit` WRITE;
/*!40000 ALTER TABLE `tblpur_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_vendor`
--

DROP TABLE IF EXISTS `tblpur_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_vendor` (
  `userid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(200) DEFAULT NULL,
  `vat` varchar(200) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `leadid` int(11) DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT 0,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT 0,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int(11) NOT NULL DEFAULT 0,
  `show_primary_contact` int(11) NOT NULL DEFAULT 0,
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int(11) NOT NULL DEFAULT 1,
  `addedfrom` int(11) NOT NULL DEFAULT 0,
  `category` text DEFAULT NULL,
  `bank_detail` text DEFAULT NULL,
  `payment_terms` text DEFAULT NULL,
  `vendor_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_vendor`
--

LOCK TABLES `tblpur_vendor` WRITE;
/*!40000 ALTER TABLE `tblpur_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_vendor_admin`
--

DROP TABLE IF EXISTS `tblpur_vendor_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_vendor_admin` (
  `staff_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `date_assigned` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_vendor_admin`
--

LOCK TABLES `tblpur_vendor_admin` WRITE;
/*!40000 ALTER TABLE `tblpur_vendor_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_vendor_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_vendor_cate`
--

DROP TABLE IF EXISTS `tblpur_vendor_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_vendor_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_vendor_cate`
--

LOCK TABLES `tblpur_vendor_cate` WRITE;
/*!40000 ALTER TABLE `tblpur_vendor_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_vendor_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpur_vendor_items`
--

DROP TABLE IF EXISTS `tblpur_vendor_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpur_vendor_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor` int(11) NOT NULL,
  `group_items` int(11) DEFAULT NULL,
  `items` int(11) NOT NULL,
  `add_from` int(11) DEFAULT NULL,
  `datecreate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpur_vendor_items`
--

LOCK TABLES `tblpur_vendor_items` WRITE;
/*!40000 ALTER TABLE `tblpur_vendor_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpur_vendor_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpurchase_option`
--

DROP TABLE IF EXISTS `tblpurchase_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpurchase_option` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext DEFAULT NULL,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpurchase_option`
--

LOCK TABLES `tblpurchase_option` WRITE;
/*!40000 ALTER TABLE `tblpurchase_option` DISABLE KEYS */;
INSERT INTO `tblpurchase_option` VALUES (1,'purchase_order_setting','1',1),(2,'pur_order_prefix','#PO',1),(3,'next_po_number','1',1),(4,'date_reset_number','',1),(5,'pur_request_prefix','#PR',1),(6,'next_pr_number','1',1),(7,'date_reset_pr_number','',1),(8,'pur_inv_prefix','#INV',1),(9,'next_inv_number','1',1),(10,'create_invoice_by','contract',1),(11,'item_by_vendor','0',1),(12,'terms_and_conditions','',1),(13,'vendor_note','',1);
/*!40000 ALTER TABLE `tblpurchase_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_campaign`
--

DROP TABLE IF EXISTS `tblrec_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_campaign` (
  `cp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_code` varchar(200) NOT NULL,
  `campaign_name` varchar(200) NOT NULL,
  `cp_proposal` text DEFAULT NULL,
  `cp_position` int(11) NOT NULL,
  `cp_department` int(11) DEFAULT NULL,
  `cp_amount_recruiment` int(11) DEFAULT NULL,
  `cp_form_work` varchar(45) DEFAULT NULL,
  `cp_workplace` varchar(255) DEFAULT NULL,
  `cp_salary_from` decimal(15,0) DEFAULT NULL,
  `cp_salary_to` decimal(15,0) DEFAULT NULL,
  `cp_from_date` date DEFAULT NULL,
  `cp_to_date` date NOT NULL,
  `cp_reason_recruitment` text DEFAULT NULL,
  `cp_job_description` text DEFAULT NULL,
  `cp_manager` text DEFAULT NULL,
  `cp_follower` text DEFAULT NULL,
  `cp_ages_from` int(11) DEFAULT NULL,
  `cp_ages_to` int(11) DEFAULT NULL,
  `cp_gender` varchar(10) DEFAULT NULL,
  `cp_height` float DEFAULT NULL,
  `cp_weight` float DEFAULT NULL,
  `cp_literacy` varchar(200) DEFAULT NULL,
  `cp_experience` varchar(200) DEFAULT NULL,
  `cp_add_from` int(11) NOT NULL,
  `cp_date_add` date NOT NULL,
  `cp_status` int(11) NOT NULL,
  `display_salary` int(15) DEFAULT NULL,
  `rec_channel_form_id` int(15) DEFAULT NULL,
  `company_id` int(15) DEFAULT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_campaign`
--

LOCK TABLES `tblrec_campaign` WRITE;
/*!40000 ALTER TABLE `tblrec_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_campaign_form_web`
--

DROP TABLE IF EXISTS `tblrec_campaign_form_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_campaign_form_web` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rec_campaign_id` int(11) NOT NULL,
  `form_type` int(11) DEFAULT NULL,
  `lead_source` varchar(10) DEFAULT NULL,
  `lead_status` varchar(10) DEFAULT NULL,
  `notify_ids_staff` text DEFAULT NULL,
  `notify_ids_roles` text DEFAULT NULL,
  `form_key` varchar(32) DEFAULT NULL,
  `notify_lead_imported` int(11) DEFAULT 1,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext DEFAULT NULL,
  `responsible` int(11) DEFAULT 0,
  `r_form_name` varchar(191) DEFAULT NULL,
  `form_data` mediumtext DEFAULT NULL,
  `recaptcha` int(11) DEFAULT 0,
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `success_submit_msg` text DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int(11) DEFAULT 1,
  `mark_public` int(11) DEFAULT 0,
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int(11) DEFAULT 0,
  PRIMARY KEY (`id`,`rec_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_campaign_form_web`
--

LOCK TABLES `tblrec_campaign_form_web` WRITE;
/*!40000 ALTER TABLE `tblrec_campaign_form_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_campaign_form_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_candidate`
--

DROP TABLE IF EXISTS `tblrec_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_candidate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rec_campaign` int(11) DEFAULT NULL,
  `candidate_code` varchar(200) NOT NULL,
  `candidate_name` varchar(200) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `birthplace` text DEFAULT NULL,
  `home_town` text DEFAULT NULL,
  `identification` varchar(45) DEFAULT NULL,
  `days_for_identity` date DEFAULT NULL,
  `place_of_issue` varchar(255) DEFAULT NULL,
  `marital_status` varchar(11) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `nation` varchar(100) NOT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `introduce_yourself` text DEFAULT NULL,
  `phonenumber` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `skype` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `resident` text DEFAULT NULL,
  `current_accommodation` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `desired_salary` decimal(15,0) DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `recruitment_channel` int(11) DEFAULT NULL,
  `skill` text DEFAULT NULL,
  `interests` text DEFAULT NULL,
  `linkedin` text DEFAULT NULL,
  `alternate_contact_number` varchar(15) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_candidate`
--

LOCK TABLES `tblrec_candidate` WRITE;
/*!40000 ALTER TABLE `tblrec_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_cd_evaluation`
--

DROP TABLE IF EXISTS `tblrec_cd_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_cd_evaluation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `criteria` int(11) NOT NULL,
  `rate_score` int(11) NOT NULL,
  `assessor` int(11) NOT NULL,
  `evaluation_date` datetime NOT NULL,
  `percent` int(11) NOT NULL,
  `candidate` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `group_criteria` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_cd_evaluation`
--

LOCK TABLES `tblrec_cd_evaluation` WRITE;
/*!40000 ALTER TABLE `tblrec_cd_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_cd_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_company`
--

DROP TABLE IF EXISTS `tblrec_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(200) NOT NULL,
  `company_description` text DEFAULT NULL,
  `company_address` varchar(200) DEFAULT NULL,
  `company_industry` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_company`
--

LOCK TABLES `tblrec_company` WRITE;
/*!40000 ALTER TABLE `tblrec_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_criteria`
--

DROP TABLE IF EXISTS `tblrec_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_criteria` (
  `criteria_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `criteria_type` varchar(45) NOT NULL,
  `criteria_title` varchar(200) NOT NULL,
  `group_criteria` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `add_date` date DEFAULT NULL,
  `score_des1` text DEFAULT NULL,
  `score_des2` text DEFAULT NULL,
  `score_des3` text DEFAULT NULL,
  `score_des4` text DEFAULT NULL,
  `score_des5` text DEFAULT NULL,
  PRIMARY KEY (`criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_criteria`
--

LOCK TABLES `tblrec_criteria` WRITE;
/*!40000 ALTER TABLE `tblrec_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_evaluation_form`
--

DROP TABLE IF EXISTS `tblrec_evaluation_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_evaluation_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_name` varchar(200) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `add_date` date DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_evaluation_form`
--

LOCK TABLES `tblrec_evaluation_form` WRITE;
/*!40000 ALTER TABLE `tblrec_evaluation_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_evaluation_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_interview`
--

DROP TABLE IF EXISTS `tblrec_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_interview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `campaign` int(11) NOT NULL,
  `is_name` varchar(100) NOT NULL,
  `interview_day` varchar(200) NOT NULL,
  `from_time` text NOT NULL,
  `to_time` text NOT NULL,
  `from_hours` datetime DEFAULT NULL,
  `to_hours` datetime DEFAULT NULL,
  `interviewer` text NOT NULL,
  `added_from` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `position` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_interview`
--

LOCK TABLES `tblrec_interview` WRITE;
/*!40000 ALTER TABLE `tblrec_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_job_position`
--

DROP TABLE IF EXISTS `tblrec_job_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_job_position` (
  `position_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(200) NOT NULL,
  `position_description` text DEFAULT NULL,
  `industry_id` int(15) DEFAULT NULL,
  `company_id` int(15) DEFAULT NULL,
  `job_skill` text DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_job_position`
--

LOCK TABLES `tblrec_job_position` WRITE;
/*!40000 ALTER TABLE `tblrec_job_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_job_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_list_criteria`
--

DROP TABLE IF EXISTS `tblrec_list_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_list_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `evaluation_form` int(11) NOT NULL,
  `group_criteria` int(11) NOT NULL,
  `evaluation_criteria` int(11) NOT NULL,
  `percent` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_list_criteria`
--

LOCK TABLES `tblrec_list_criteria` WRITE;
/*!40000 ALTER TABLE `tblrec_list_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_list_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_proposal`
--

DROP TABLE IF EXISTS `tblrec_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_proposal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `proposal_name` varchar(200) NOT NULL,
  `position` int(11) NOT NULL,
  `department` int(11) DEFAULT NULL,
  `amount_recruiment` int(11) DEFAULT NULL,
  `form_work` varchar(45) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `salary_from` decimal(15,0) DEFAULT NULL,
  `salary_to` decimal(15,0) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date NOT NULL,
  `reason_recruitment` text DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `approver` int(11) NOT NULL,
  `ages_from` int(11) DEFAULT NULL,
  `ages_to` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `literacy` varchar(200) DEFAULT NULL,
  `experience` varchar(200) DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `date_add` date NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_proposal`
--

LOCK TABLES `tblrec_proposal` WRITE;
/*!40000 ALTER TABLE `tblrec_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_set_transfer_record`
--

DROP TABLE IF EXISTS `tblrec_set_transfer_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_set_transfer_record` (
  `set_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `send_to` varchar(45) NOT NULL,
  `email_to` text DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `add_date` date NOT NULL,
  `subject` text NOT NULL,
  `content` text DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_set_transfer_record`
--

LOCK TABLES `tblrec_set_transfer_record` WRITE;
/*!40000 ALTER TABLE `tblrec_set_transfer_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_set_transfer_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_skill`
--

DROP TABLE IF EXISTS `tblrec_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skill_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_skill`
--

LOCK TABLES `tblrec_skill` WRITE;
/*!40000 ALTER TABLE `tblrec_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrec_transfer_records`
--

DROP TABLE IF EXISTS `tblrec_transfer_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrec_transfer_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `staff_identifi` varchar(20) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `datecreator` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrec_transfer_records`
--

LOCK TABLES `tblrec_transfer_records` WRITE;
/*!40000 ALTER TABLE `tblrec_transfer_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrec_transfer_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrecords_meta`
--

DROP TABLE IF EXISTS `tblrecords_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrecords_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrecords_meta`
--

LOCK TABLES `tblrecords_meta` WRITE;
/*!40000 ALTER TABLE `tblrecords_meta` DISABLE KEYS */;
INSERT INTO `tblrecords_meta` VALUES (1,'staff_identifi','staff_identifi'),(2,'firstname','firstname'),(3,'email','email'),(4,'phonenumber','phonenumber'),(5,'facebook','facebook'),(6,'skype','skype'),(7,'birthday','birthday'),(8,'birthplace','birthplace'),(9,'home_town','home_town'),(10,'marital_status','marital_status'),(11,'nation','nation'),(12,'religion','religion'),(13,'identification','identification'),(14,'days_for_identity','days_for_identity'),(15,'place_of_issue','place_of_issue'),(16,'resident','resident'),(17,'current_address','current_address'),(18,'literacy','literacy');
/*!40000 ALTER TABLE `tblrecords_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrelated_items`
--

DROP TABLE IF EXISTS `tblrelated_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrelated_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrelated_items`
--

LOCK TABLES `tblrelated_items` WRITE;
/*!40000 ALTER TABLE `tblrelated_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrelated_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreminders`
--

DROP TABLE IF EXISTS `tblreminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `date` datetime NOT NULL,
  `isnotified` int(11) NOT NULL DEFAULT 0,
  `rel_id` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `notify_by_email` int(11) NOT NULL DEFAULT 1,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `staff` (`staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreminders`
--

LOCK TABLES `tblreminders` WRITE;
/*!40000 ALTER TABLE `tblreminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest`
--

DROP TABLE IF EXISTS `tblrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `request_type_id` varchar(45) DEFAULT NULL,
  `date_create` datetime NOT NULL,
  `approval_deadline` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `code` varchar(255) DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest`
--

LOCK TABLES `tblrequest` WRITE;
/*!40000 ALTER TABLE `tblrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_approval_details`
--

DROP TABLE IF EXISTS `tblrequest_approval_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_approval_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `staffid` varchar(255) NOT NULL,
  `approve` varchar(45) NOT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  `staff_approve` int(11) DEFAULT 0,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_approval_details`
--

LOCK TABLES `tblrequest_approval_details` WRITE;
/*!40000 ALTER TABLE `tblrequest_approval_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_approval_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_files`
--

DROP TABLE IF EXISTS `tblrequest_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `filetype` varchar(255) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_files`
--

LOCK TABLES `tblrequest_files` WRITE;
/*!40000 ALTER TABLE `tblrequest_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_follow`
--

DROP TABLE IF EXISTS `tblrequest_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(45) DEFAULT NULL,
  `staffid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_follow`
--

LOCK TABLES `tblrequest_follow` WRITE;
/*!40000 ALTER TABLE `tblrequest_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_form`
--

DROP TABLE IF EXISTS `tblrequest_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `value` varchar(255) NOT NULL,
  `slug` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_form`
--

LOCK TABLES `tblrequest_form` WRITE;
/*!40000 ALTER TABLE `tblrequest_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_log`
--

DROP TABLE IF EXISTS `tblrequest_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(45) DEFAULT NULL,
  `staffid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_log`
--

LOCK TABLES `tblrequest_log` WRITE;
/*!40000 ALTER TABLE `tblrequest_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_related`
--

DROP TABLE IF EXISTS `tblrequest_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_related` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `rel_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_related`
--

LOCK TABLES `tblrequest_related` WRITE;
/*!40000 ALTER TABLE `tblrequest_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_type`
--

DROP TABLE IF EXISTS `tblrequest_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `maximum_number_day` varchar(45) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `data_chart` longtext NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT '1',
  `related_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_type`
--

LOCK TABLES `tblrequest_type` WRITE;
/*!40000 ALTER TABLE `tblrequest_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_type_form`
--

DROP TABLE IF EXISTS `tblrequest_type_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_type_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_type_form`
--

LOCK TABLES `tblrequest_type_form` WRITE;
/*!40000 ALTER TABLE `tblrequest_type_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_type_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequest_type_workflow`
--

DROP TABLE IF EXISTS `tblrequest_type_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequest_type_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type_id` varchar(45) NOT NULL,
  `staffid` varchar(255) NOT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest_type_workflow`
--

LOCK TABLES `tblrequest_type_workflow` WRITE;
/*!40000 ALTER TABLE `tblrequest_type_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest_type_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroles`
--

DROP TABLE IF EXISTS `tblroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `permissions` longtext DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroles`
--

LOCK TABLES `tblroles` WRITE;
/*!40000 ALTER TABLE `tblroles` DISABLE KEYS */;
INSERT INTO `tblroles` VALUES (1,'Employee',NULL),(2,'administrador','a:33:{s:17:\"bulk_pdf_exporter\";a:1:{i:0;s:4:\"view\";}s:9:\"contracts\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:12:\"credit_notes\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:9:\"customers\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:15:\"email_templates\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}s:9:\"estimates\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"expenses\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"invoices\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:5:\"items\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"payments\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"projects\";a:7:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";i:4;s:17:\"create_milestones\";i:5;s:15:\"edit_milestones\";i:6;s:17:\"delete_milestones\";}s:9:\"proposals\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:7:\"reports\";a:1:{i:0;s:4:\"view\";}s:5:\"roles\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"settings\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}s:5:\"staff\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:5:\"tasks\";a:8:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";i:4;s:14:\"edit_timesheet\";i:5;s:18:\"edit_own_timesheet\";i:6;s:16:\"delete_timesheet\";i:7;s:20:\"delete_own_timesheet\";}s:19:\"checklist_templates\";a:2:{i:0;s:6:\"create\";i:1;s:6:\"delete\";}s:16:\"estimate_request\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:5:\"leads\";a:2:{i:0;s:4:\"view\";i:1;s:6:\"delete\";}s:8:\"products\";a:2:{i:0;s:4:\"view\";i:1;s:6:\"create\";}s:20:\"accounting_dashboard\";a:1:{i:0;s:4:\"view\";}s:22:\"accounting_transaction\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:24:\"accounting_journal_entry\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:19:\"accounting_transfer\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:28:\"accounting_chart_of_accounts\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:20:\"accounting_reconcile\";a:3:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";}s:17:\"accounting_budget\";a:3:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";}s:17:\"accounting_report\";a:1:{i:0;s:4:\"view\";}s:18:\"accounting_setting\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}s:13:\"manufacturing\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"purchase\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:9:\"warehouse\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}}');
/*!40000 ALTER TABLE `tblroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsalary_form`
--

DROP TABLE IF EXISTS `tblsalary_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsalary_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_name` varchar(200) NOT NULL,
  `salary_val` decimal(15,2) NOT NULL,
  `tax` tinyint(1) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsalary_form`
--

LOCK TABLES `tblsalary_form` WRITE;
/*!40000 ALTER TABLE `tblsalary_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsalary_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsales_activity`
--

DROP TABLE IF EXISTS `tblsales_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsales_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(20) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `additional_data` text DEFAULT NULL,
  `staffid` varchar(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsales_activity`
--

LOCK TABLES `tblsales_activity` WRITE;
/*!40000 ALTER TABLE `tblsales_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsales_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsales_channel`
--

DROP TABLE IF EXISTS `tblsales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsales_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(150) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsales_channel`
--

LOCK TABLES `tblsales_channel` WRITE;
/*!40000 ALTER TABLE `tblsales_channel` DISABLE KEYS */;
INSERT INTO `tblsales_channel` VALUES (1,'pos','active'),(2,'portal','active'),(3,'woocommerce','active');
/*!40000 ALTER TABLE `tblsales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsales_channel_detailt`
--

DROP TABLE IF EXISTS `tblsales_channel_detailt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsales_channel_detailt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sales_channel_id` int(11) NOT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsales_channel_detailt`
--

LOCK TABLES `tblsales_channel_detailt` WRITE;
/*!40000 ALTER TABLE `tblsales_channel_detailt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsales_channel_detailt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblscheduled_emails`
--

DROP TABLE IF EXISTS `tblscheduled_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblscheduled_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `contacts` varchar(197) NOT NULL,
  `cc` text DEFAULT NULL,
  `attach_pdf` tinyint(1) NOT NULL DEFAULT 1,
  `template` varchar(197) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblscheduled_emails`
--

LOCK TABLES `tblscheduled_emails` WRITE;
/*!40000 ALTER TABLE `tblscheduled_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblscheduled_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservices`
--

DROP TABLE IF EXISTS `tblservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblservices` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblservices`
--

LOCK TABLES `tblservices` WRITE;
/*!40000 ALTER TABLE `tblservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsessions`
--

DROP TABLE IF EXISTS `tblsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsessions`
--

LOCK TABLES `tblsessions` WRITE;
/*!40000 ALTER TABLE `tblsessions` DISABLE KEYS */;
INSERT INTO `tblsessions` VALUES ('00844a3455e80c98f4cd6f3afec8b83e55bb1697','38.65.144.97',1658255796,'__ci_last_regenerate|i:1658255796;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";elFinderCaches|a:6:{s:8:\"_optsMD5\";s:32:\"d3909c62dd60fc5498b780c14c6836f9\";s:3:\"l1_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:40:\"/home/itysmexi/public_html/app/erp/media\";b:0;}}s:9:\"archivers\";a:2:{s:6:\"create\";a:4:{s:17:\"application/x-tar\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-chf\";s:3:\"ext\";s:3:\"tar\";}s:18:\"application/x-gzip\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-czhf\";s:3:\"ext\";s:3:\"tgz\";}s:19:\"application/x-bzip2\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-cjhf\";s:3:\"ext\";s:3:\"tbz\";}s:15:\"application/zip\";a:3:{s:3:\"cmd\";s:3:\"zip\";s:4:\"argc\";s:6:\"-r9 -q\";s:3:\"ext\";s:3:\"zip\";}}s:7:\"extract\";a:4:{s:17:\"application/x-tar\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:3:\"-xf\";s:3:\"ext\";s:3:\"tar\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:18:\"application/x-gzip\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xzf\";s:3:\"ext\";s:3:\"tgz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:19:\"application/x-bzip2\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xjf\";s:3:\"ext\";s:3:\"tbz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:15:\"application/zip\";a:5:{s:3:\"cmd\";s:5:\"unzip\";s:4:\"argc\";s:2:\"-q\";s:3:\"ext\";s:3:\"zip\";s:6:\"toSpec\";s:3:\"-d \";s:7:\"getsize\";a:3:{s:4:\"argc\";s:5:\"-Z -t\";s:5:\"regex\";s:21:\"/^.+?,\\s?([0-9]+).+$/\";s:7:\"replace\";s:2:\"$1\";}}}}s:8:\"videoLib\";s:0:\"\";s:3:\"l2_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:47:\"/home/itysmexi/public_html/app/erp/media/public\";b:0;}}s:14:\":LAST_ACTIVITY\";i:1658248453;}elFinderNetVolumes|a:0:{}'),('08f046992b4dfd62011fbab8de8827e6b76603de','38.65.144.97',1657772589,'__ci_last_regenerate|i:1657772589;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('13f50d6299fbd215062ec62debd57f06242ca69c','187.145.89.171',1657750977,'__ci_last_regenerate|i:1657750953;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('16a083996ada3aa3413713fc90aa277cc714f176','38.65.144.97',1658184453,'__ci_last_regenerate|i:1658184453;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('2456e0e02391a67a47f5e62f4b620aaf58d8ee5d','38.65.144.97',1658245303,'__ci_last_regenerate|i:1658245303;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('281vn81c451lan1vniha7nkbdbntluvt','192.168.1.207',1658343809,'__ci_last_regenerate|i:1658343809;cart_data|a:1:{i:2;a:2:{s:10:\"product_id\";s:1:\"2\";s:8:\"quantity\";s:1:\"1\";}}red_url|s:30:\"https://192.168.1.207/cierram/\";'),('2e384daa9a8cb3398246f16797aaabe0e7563a09','38.65.144.97',1657772222,'__ci_last_regenerate|i:1657772222;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('3t81jvaqnqfqflmdcuh4dtn4rj5kk5ap','::1',1658336565,'__ci_last_regenerate|i:1658336565;staff_user_id|s:1:\"1\";staff_logged_in|b:1;'),('479e4c863f767625f54576ba2c05309d85e14d05','38.65.144.97',1658184544,'__ci_last_regenerate|i:1658184542;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";'),('5827fd1fe4c8d5d63e7726e0376c346a3dab576a','38.65.144.97',1657749853,'__ci_last_regenerate|i:1657749853;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('5bbf1e66570b22ab2de7218432fa0c79c66155c6','38.65.144.97',1657750179,'__ci_last_regenerate|i:1657750179;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('5d2a0c3eac2d7d85a6259475eaeac70ee6598587','189.141.36.49',1658290347,'__ci_last_regenerate|i:1658290347;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('5fa663dd367bcb3d15783e92caf4ffde3fd649b4','38.65.144.97',1658248435,'__ci_last_regenerate|i:1658248435;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('5hv4838qloeqi8054lfq6m8cl4q0uig2','::1',1658342268,'__ci_last_regenerate|i:1658342268;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('5pj149cf8nvksi91etla7cpvam6vj696','::1',1658336875,'__ci_last_regenerate|i:1658336875;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('6234feb10a6415be368679fd08c41976ff122eda','38.65.144.97',1658245621,'__ci_last_regenerate|i:1658245621;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('62f3dkh3f6ctdcin7d8djf8cl7a3r5n6','::1',1658341890,'__ci_last_regenerate|i:1658341890;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|b:1;'),('6323e1616731802a18622b22d36ec09ee7d04c7b','38.65.144.97',1658256103,'__ci_last_regenerate|i:1658256103;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";elFinderCaches|a:6:{s:8:\"_optsMD5\";s:32:\"d3909c62dd60fc5498b780c14c6836f9\";s:3:\"l1_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:40:\"/home/itysmexi/public_html/app/erp/media\";b:0;}}s:9:\"archivers\";a:2:{s:6:\"create\";a:4:{s:17:\"application/x-tar\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-chf\";s:3:\"ext\";s:3:\"tar\";}s:18:\"application/x-gzip\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-czhf\";s:3:\"ext\";s:3:\"tgz\";}s:19:\"application/x-bzip2\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-cjhf\";s:3:\"ext\";s:3:\"tbz\";}s:15:\"application/zip\";a:3:{s:3:\"cmd\";s:3:\"zip\";s:4:\"argc\";s:6:\"-r9 -q\";s:3:\"ext\";s:3:\"zip\";}}s:7:\"extract\";a:4:{s:17:\"application/x-tar\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:3:\"-xf\";s:3:\"ext\";s:3:\"tar\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:18:\"application/x-gzip\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xzf\";s:3:\"ext\";s:3:\"tgz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:19:\"application/x-bzip2\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xjf\";s:3:\"ext\";s:3:\"tbz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:15:\"application/zip\";a:5:{s:3:\"cmd\";s:5:\"unzip\";s:4:\"argc\";s:2:\"-q\";s:3:\"ext\";s:3:\"zip\";s:6:\"toSpec\";s:3:\"-d \";s:7:\"getsize\";a:3:{s:4:\"argc\";s:5:\"-Z -t\";s:5:\"regex\";s:21:\"/^.+?,\\s?([0-9]+).+$/\";s:7:\"replace\";s:2:\"$1\";}}}}s:8:\"videoLib\";s:0:\"\";s:3:\"l2_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:47:\"/home/itysmexi/public_html/app/erp/media/public\";b:0;}}s:14:\":LAST_ACTIVITY\";i:1658248453;}elFinderNetVolumes|a:0:{}'),('638bbd69a8485ff4c6facae7570c182a9154175a','189.193.95.45',1658291043,'__ci_last_regenerate|i:1658291043;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('6b2d18b05e6e9aede0a4d9f58f5b799499664c4c','38.65.144.97',1658246663,'red_url|s:32:\"https://app.ltysmx.com/erp/admin\";__ci_last_regenerate|i:1658246663;message-danger|s:25:\"Invalid email or password\";__ci_vars|a:1:{s:14:\"message-danger\";s:3:\"old\";}'),('6b3f5a5e577522e9d505a8ad00a3c3a519f1b70e','104.200.76.202',1658075636,'__ci_last_regenerate|i:1658075633;red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('6ba175c10c3435b290eaf9f03fe9f8682197092b','187.145.89.171',1657750956,'__ci_last_regenerate|i:1657750956;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('6d4be6a3482ac355824bc01dd67ca072f6a08d77','189.141.36.49',1658267575,'__ci_last_regenerate|i:1658267574;red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('6pnuvmrlq8dncm04u9tdinpqju0np78j','192.168.1.207',1658344400,'__ci_last_regenerate|i:1658344400;cart_data|a:1:{i:2;a:2:{s:10:\"product_id\";s:1:\"2\";s:8:\"quantity\";s:1:\"1\";}}red_url|s:30:\"https://192.168.1.207/cierram/\";message-danger|s:30:\"Usuario o contraseña invalido\";__ci_vars|a:1:{s:14:\"message-danger\";s:3:\"old\";}'),('6tujtb4hjoobhaq547ocfnrfumb4ha0m','192.168.5.196',1658343543,'__ci_last_regenerate|i:1658343543;is_mobile|b:1;red_url|s:26:\"https://localhost/cierram/\";'),('742adfd3908ace9faac13e6ec0ef101e0373b57a','38.65.144.97',1657772885,'__ci_last_regenerate|i:1657772589;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('756a5d06e5432cd66144ae0e18dfae94ab228605','38.65.144.97',1657852601,'__ci_last_regenerate|i:1657852577;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('7925f58973327a9fe793535246e1d7ce12a79e2a','38.65.144.97',1658184471,'__ci_last_regenerate|i:1658184453;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('7c65s4tvcr90d54vislrenoic9c9mt65','192.168.5.186',1658345371,'__ci_last_regenerate|i:1658345371;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('86df3f761a1d43d99d8e8ed176dad215be0453c7','38.65.144.97',1657749737,'__ci_last_regenerate|i:1657749737;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('89c0ae88c6e76ba5c06f6574688a627a7647f5ea','38.65.144.97',1657749402,'__ci_last_regenerate|i:1657749402;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";message-success|s:21:\"Updated successfully!\";__ci_vars|a:1:{s:15:\"message-success\";s:3:\"old\";}'),('95181ecda17781381328205a543f11c411cafdda','38.65.144.97',1658248854,'__ci_last_regenerate|i:1658248854;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";elFinderCaches|a:6:{s:8:\"_optsMD5\";s:32:\"d3909c62dd60fc5498b780c14c6836f9\";s:3:\"l1_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:40:\"/home/itysmexi/public_html/app/erp/media\";b:0;}}s:9:\"archivers\";a:2:{s:6:\"create\";a:4:{s:17:\"application/x-tar\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-chf\";s:3:\"ext\";s:3:\"tar\";}s:18:\"application/x-gzip\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-czhf\";s:3:\"ext\";s:3:\"tgz\";}s:19:\"application/x-bzip2\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-cjhf\";s:3:\"ext\";s:3:\"tbz\";}s:15:\"application/zip\";a:3:{s:3:\"cmd\";s:3:\"zip\";s:4:\"argc\";s:6:\"-r9 -q\";s:3:\"ext\";s:3:\"zip\";}}s:7:\"extract\";a:4:{s:17:\"application/x-tar\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:3:\"-xf\";s:3:\"ext\";s:3:\"tar\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:18:\"application/x-gzip\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xzf\";s:3:\"ext\";s:3:\"tgz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:19:\"application/x-bzip2\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xjf\";s:3:\"ext\";s:3:\"tbz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:15:\"application/zip\";a:5:{s:3:\"cmd\";s:5:\"unzip\";s:4:\"argc\";s:2:\"-q\";s:3:\"ext\";s:3:\"zip\";s:6:\"toSpec\";s:3:\"-d \";s:7:\"getsize\";a:3:{s:4:\"argc\";s:5:\"-Z -t\";s:5:\"regex\";s:21:\"/^.+?,\\s?([0-9]+).+$/\";s:7:\"replace\";s:2:\"$1\";}}}}s:8:\"videoLib\";s:0:\"\";s:3:\"l2_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:47:\"/home/itysmexi/public_html/app/erp/media/public\";b:0;}}s:14:\":LAST_ACTIVITY\";i:1658248453;}elFinderNetVolumes|a:0:{}'),('96ebcb48e276b5e1f517979e8cdf6fe020947450','187.145.89.171',1657750956,'__ci_last_regenerate|i:1657750956;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('96u9mbjvf029idpetau483bn0n28o7ki','::1',1658340249,'__ci_last_regenerate|i:1658340249;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|b:1;'),('9b5b78b7b051203d00c5d4a24ab3c691c08d61be','38.65.144.97',1658334877,'__ci_last_regenerate|i:1658334589;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('a6dd40a5624a1a4c7fa999845590588d30937d68','38.65.144.97',1658255891,'__ci_last_regenerate|i:1658255891;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('afd9d6b02cee3a071da7e9a9abc1138c41f5e872','45.167.95.145',1657749009,'__ci_last_regenerate|i:1657749009;staff_user_id|s:1:\"3\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('afe3fe8ed9a7708fed1efd25fc2d14c49bc76a36','38.65.144.97',1658247430,'__ci_last_regenerate|i:1658247430;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('b22ff40ab42d23471f8539da72e134265313d316','38.65.144.97',1658256188,'__ci_last_regenerate|i:1658256103;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";elFinderCaches|a:6:{s:8:\"_optsMD5\";s:32:\"d3909c62dd60fc5498b780c14c6836f9\";s:3:\"l1_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:40:\"/home/itysmexi/public_html/app/erp/media\";b:0;}}s:9:\"archivers\";a:2:{s:6:\"create\";a:4:{s:17:\"application/x-tar\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-chf\";s:3:\"ext\";s:3:\"tar\";}s:18:\"application/x-gzip\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-czhf\";s:3:\"ext\";s:3:\"tgz\";}s:19:\"application/x-bzip2\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-cjhf\";s:3:\"ext\";s:3:\"tbz\";}s:15:\"application/zip\";a:3:{s:3:\"cmd\";s:3:\"zip\";s:4:\"argc\";s:6:\"-r9 -q\";s:3:\"ext\";s:3:\"zip\";}}s:7:\"extract\";a:4:{s:17:\"application/x-tar\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:3:\"-xf\";s:3:\"ext\";s:3:\"tar\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:18:\"application/x-gzip\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xzf\";s:3:\"ext\";s:3:\"tgz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:19:\"application/x-bzip2\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xjf\";s:3:\"ext\";s:3:\"tbz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:15:\"application/zip\";a:5:{s:3:\"cmd\";s:5:\"unzip\";s:4:\"argc\";s:2:\"-q\";s:3:\"ext\";s:3:\"zip\";s:6:\"toSpec\";s:3:\"-d \";s:7:\"getsize\";a:3:{s:4:\"argc\";s:5:\"-Z -t\";s:5:\"regex\";s:21:\"/^.+?,\\s?([0-9]+).+$/\";s:7:\"replace\";s:2:\"$1\";}}}}s:8:\"videoLib\";s:0:\"\";s:3:\"l2_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:47:\"/home/itysmexi/public_html/app/erp/media/public\";b:0;}}s:14:\":LAST_ACTIVITY\";i:1658248453;}elFinderNetVolumes|a:0:{}'),('b5da5a0651b315645a6a3d2c60dbb3558e11c050','38.65.144.97',1658255283,'__ci_last_regenerate|i:1658255283;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";elFinderCaches|a:6:{s:8:\"_optsMD5\";s:32:\"d3909c62dd60fc5498b780c14c6836f9\";s:3:\"l1_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:40:\"/home/itysmexi/public_html/app/erp/media\";b:0;}}s:9:\"archivers\";a:2:{s:6:\"create\";a:4:{s:17:\"application/x-tar\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-chf\";s:3:\"ext\";s:3:\"tar\";}s:18:\"application/x-gzip\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-czhf\";s:3:\"ext\";s:3:\"tgz\";}s:19:\"application/x-bzip2\";a:3:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:5:\"-cjhf\";s:3:\"ext\";s:3:\"tbz\";}s:15:\"application/zip\";a:3:{s:3:\"cmd\";s:3:\"zip\";s:4:\"argc\";s:6:\"-r9 -q\";s:3:\"ext\";s:3:\"zip\";}}s:7:\"extract\";a:4:{s:17:\"application/x-tar\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:3:\"-xf\";s:3:\"ext\";s:3:\"tar\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:18:\"application/x-gzip\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xzf\";s:3:\"ext\";s:3:\"tgz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:19:\"application/x-bzip2\";a:5:{s:3:\"cmd\";s:3:\"tar\";s:4:\"argc\";s:4:\"-xjf\";s:3:\"ext\";s:3:\"tbz\";s:6:\"toSpec\";s:3:\"-C \";s:7:\"getsize\";a:4:{s:4:\"argc\";s:4:\"-xvf\";s:6:\"toSpec\";s:17:\"--to-stdout|wc -c\";s:5:\"regex\";s:48:\"/^.+(?:\\r\\n|\\n|\\r)[^\\r\\n0-9]*([0-9]+)[^\\r\\n]*$/s\";s:7:\"replace\";s:2:\"$1\";}}s:15:\"application/zip\";a:5:{s:3:\"cmd\";s:5:\"unzip\";s:4:\"argc\";s:2:\"-q\";s:3:\"ext\";s:3:\"zip\";s:6:\"toSpec\";s:3:\"-d \";s:7:\"getsize\";a:3:{s:4:\"argc\";s:5:\"-Z -t\";s:5:\"regex\";s:21:\"/^.+?,\\s?([0-9]+).+$/\";s:7:\"replace\";s:2:\"$1\";}}}}s:8:\"videoLib\";s:0:\"\";s:3:\"l2_\";a:2:{s:8:\"rootstat\";a:0:{}s:7:\"subdirs\";a:1:{s:47:\"/home/itysmexi/public_html/app/erp/media/public\";b:0;}}s:14:\":LAST_ACTIVITY\";i:1658248453;}elFinderNetVolumes|a:0:{}'),('ba1296f376b6b4b88dce9ce415674537422cc560','38.65.144.97',1658184542,'__ci_last_regenerate|i:1658184542;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";tasks_kanban_view|s:4:\"true\";'),('bbcb5e94f1c47a02fdc221b89202c0bf7d58dbbc','189.141.36.49',1658267705,'__ci_last_regenerate|i:1658267705;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('c774dce03a2f83c12822162acdfc3ad8b1584804','38.65.144.97',1658255891,'__ci_last_regenerate|i:1658255891;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('cbaf73b34c6176b55123c43e127ee63863a6f5c1','187.145.89.171',1657750953,'__ci_last_regenerate|i:1657750953;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('d78600ed912cc8da1ab9775183606c569aba2336','104.232.39.164',1658075636,'__ci_last_regenerate|i:1658075635;red_url|s:27:\"https://app.ltysmx.com/erp/\";'),('dglau1qirkj1kdd43p6b0fhj2sj2qlkb','192.168.5.186',1658345613,'__ci_last_regenerate|i:1658345371;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('e521cfbbb1f7644cee96c9297253d70c843d0ce8','189.193.95.45',1658290697,'__ci_last_regenerate|i:1658290697;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('eac584b8f16d74703deedf1222c5a4dafc0e894d','38.65.144.97',1657750223,'__ci_last_regenerate|i:1657750179;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('f19dbd5f2cdcb33355d3f3a2ced56d5b23f45d49','45.167.95.145',1657749448,'__ci_last_regenerate|i:1657749367;staff_user_id|s:1:\"3\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('f35qmkc7jtd6t943cbr71s7nl0lpc5ad','192.168.5.186',1658344844,'__ci_last_regenerate|i:1658344844;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('f87304c96a6eb1970ffc915ba8642e5e8e205349','189.193.91.242',1658291045,'__ci_last_regenerate|i:1658291043;client_user_id|s:1:\"2\";contact_user_id|s:1:\"2\";client_logged_in|b:1;'),('fa9fad69876016a233cf87c378301c30a899f2b2','45.167.95.145',1657749367,'__ci_last_regenerate|i:1657749367;staff_user_id|s:1:\"3\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('feem4n58oo1e7l6atd8hiup0cnrv3mv1','::1',1658342784,'__ci_last_regenerate|i:1658342597;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";red_url|s:26:\"https://localhost/cierram/\";'),('h2uj6b114bdic32sl845c17i20sd5lfg','192.168.1.207',1658344748,'__ci_last_regenerate|i:1658344748;cart_data|a:2:{i:2;a:2:{s:10:\"product_id\";s:1:\"2\";s:8:\"quantity\";s:1:\"1\";}i:1;a:2:{s:10:\"product_id\";s:1:\"1\";s:8:\"quantity\";s:1:\"1\";}}red_url|s:30:\"https://192.168.1.207/cierram/\";'),('jjn9bupus9bdlad2ngcbcmpfbuol496g','::1',1658338384,'__ci_last_regenerate|i:1658338384;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|b:1;'),('jtjkq5oiduf1c6ps4qlc5pcirkndtpg1','192.168.1.207',1658344748,'__ci_last_regenerate|i:1658344748;cart_data|a:2:{i:2;a:2:{s:10:\"product_id\";s:1:\"2\";s:8:\"quantity\";s:1:\"1\";}i:1;a:2:{s:10:\"product_id\";s:1:\"1\";s:8:\"quantity\";s:1:\"1\";}}red_url|s:30:\"https://192.168.1.207/cierram/\";message-danger|s:30:\"Usuario o contraseña invalido\";__ci_vars|a:1:{s:14:\"message-danger\";s:3:\"old\";}'),('ml4pnrpa8vjlfc4djkjp76aocfu7cu7k','192.168.5.186',1658343766,'__ci_last_regenerate|i:1658343766;red_url|s:30:\"https://192.168.1.207/cierram/\";'),('ofq4if8p121vtcg24093is1u6fg5vdmk','::1',1658340885,'__ci_last_regenerate|i:1658340885;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|b:1;'),('p4otbun8anejkcj31cj87j8g9h1lp460','::1',1658341588,'__ci_last_regenerate|i:1658341588;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|b:1;'),('q95l0qdaj3l3ekvq98a4dht7c1nq1st1','::1',1658339480,'__ci_last_regenerate|i:1658339480;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|b:1;'),('re70ecj2h3iq9jk5dlmi23imq36a9qkg','192.168.5.186',1658343448,'__ci_last_regenerate|i:1658343448;red_url|s:26:\"https://localhost/cierram/\";'),('rvlpsdug3d3ball2flvsdrg8jslk5kpc','::1',1658337234,'__ci_last_regenerate|i:1658337234;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('s42sah9jjrjql7k2v49t9uvk6g180ap5','::1',1658342597,'__ci_last_regenerate|i:1658342597;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|s:0:\"\";'),('suvfa21fhkflmb08pgao853pcdu5q7bc','::1',1658338699,'__ci_last_regenerate|i:1658338699;staff_user_id|s:1:\"1\";staff_logged_in|b:1;setup-menu-open|b:1;'),('tftl5dtnftmjqtrdbhv1gdovq9gpu61l','192.168.6.163',1658343580,'__ci_last_regenerate|i:1658343543;is_mobile|b:1;red_url|s:26:\"https://localhost/cierram/\";'),('tli5jf43mpbp0b45rsjd8u1envnnnfna','::1',1658341255,'__ci_last_regenerate|i:1658341255;staff_user_id|s:1:\"4\";staff_logged_in|b:1;setup-menu-open|b:1;');
/*!40000 ALTER TABLE `tblsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetting_asset_allocation`
--

DROP TABLE IF EXISTS `tblsetting_asset_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetting_asset_allocation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetting_asset_allocation`
--

LOCK TABLES `tblsetting_asset_allocation` WRITE;
/*!40000 ALTER TABLE `tblsetting_asset_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsetting_asset_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetting_training`
--

DROP TABLE IF EXISTS `tblsetting_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetting_training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_type` int(11) NOT NULL,
  `position_training` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetting_training`
--

LOCK TABLES `tblsetting_training` WRITE;
/*!40000 ALTER TABLE `tblsetting_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsetting_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetting_transfer_records`
--

DROP TABLE IF EXISTS `tblsetting_transfer_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetting_transfer_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetting_transfer_records`
--

LOCK TABLES `tblsetting_transfer_records` WRITE;
/*!40000 ALTER TABLE `tblsetting_transfer_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsetting_transfer_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblshared_customer_files`
--

DROP TABLE IF EXISTS `tblshared_customer_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblshared_customer_files` (
  `file_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblshared_customer_files`
--

LOCK TABLES `tblshared_customer_files` WRITE;
/*!40000 ALTER TABLE `tblshared_customer_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblshared_customer_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblspam_filters`
--

DROP TABLE IF EXISTS `tblspam_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblspam_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `rel_type` varchar(10) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblspam_filters`
--

LOCK TABLES `tblspam_filters` WRITE;
/*!40000 ALTER TABLE `tblspam_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblspam_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff`
--

DROP TABLE IF EXISTS `tblstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `facebook` mediumtext DEFAULT NULL,
  `linkedin` mediumtext DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `datecreated` datetime NOT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `role` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `default_language` varchar(40) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `media_path_slug` varchar(191) DEFAULT NULL,
  `is_not_staff` int(11) NOT NULL DEFAULT 0,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `two_factor_auth_enabled` tinyint(1) DEFAULT 0,
  `two_factor_auth_code` varchar(100) DEFAULT NULL,
  `two_factor_auth_code_requested` datetime DEFAULT NULL,
  `email_signature` text DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(200) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `marital_status` varchar(25) DEFAULT NULL,
  `nation` varchar(25) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `identification` varchar(100) DEFAULT NULL,
  `days_for_identity` date DEFAULT NULL,
  `home_town` varchar(200) DEFAULT NULL,
  `resident` varchar(200) DEFAULT NULL,
  `current_address` varchar(200) DEFAULT NULL,
  `literacy` varchar(50) DEFAULT NULL,
  `orther_infor` text DEFAULT NULL,
  `job_position` int(11) DEFAULT NULL,
  `workplace` int(11) DEFAULT NULL,
  `place_of_issue` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `name_account` varchar(50) DEFAULT NULL,
  `issue_bank` varchar(200) DEFAULT NULL,
  `records_received` longtext DEFAULT NULL,
  `Personal_tax_code` varchar(50) DEFAULT NULL,
  `google_auth_secret` text DEFAULT NULL,
  `team_manage` int(11) DEFAULT 0,
  `staff_identifi` varchar(200) DEFAULT NULL,
  `status_work` varchar(100) DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff`
--

LOCK TABLES `tblstaff` WRITE;
/*!40000 ALTER TABLE `tblstaff` DISABLE KEYS */;
INSERT INTO `tblstaff` VALUES (1,'33ae672f035de7672f035d6','soporte','premium',NULL,NULL,NULL,NULL,'$2a$08$YrgS3w19g4P/1Ed5PRkckOiutyPetSAcRuLoiqbcJZRP/AnQ0MFPa','2022-07-09 02:55:05',NULL,'::1','2022-07-20 12:00:25','2022-07-20 13:14:46',NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,0,0.00,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(4,'admin@freskados.com','Freskados','Administrador','','','','','$2a$08$17RmakZuxasNik03dFJFcuNzk2YdxxF.b60OAnlRc/2sBak1uBZ8G','2022-07-20 13:08:43',NULL,'192.168.5.186','2022-07-20 15:04:18','2022-07-20 15:33:33',NULL,NULL,NULL,0,2,1,'spanish','','freskados-administrador',0,0.00,0,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_contract`
--

DROP TABLE IF EXISTS `tblstaff_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_contract` (
  `id_contract` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_code` varchar(15) NOT NULL,
  `name_contract` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `contract_form` varchar(191) DEFAULT NULL,
  `start_valid` date DEFAULT NULL,
  `end_valid` date DEFAULT NULL,
  `contract_status` varchar(100) DEFAULT NULL,
  `salary_form` int(11) DEFAULT NULL,
  `allowance_type` varchar(11) DEFAULT NULL,
  `sign_day` date DEFAULT NULL,
  `staff_delegate` int(11) DEFAULT NULL,
  `staff_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_contract`
--

LOCK TABLES `tblstaff_contract` WRITE;
/*!40000 ALTER TABLE `tblstaff_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstaff_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_contract_detail`
--

DROP TABLE IF EXISTS `tblstaff_contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_contract_detail` (
  `contract_detail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_contract_id` int(11) unsigned NOT NULL,
  `since_date` date DEFAULT NULL,
  `contract_note` varchar(100) DEFAULT NULL,
  `contract_salary_expense` longtext DEFAULT NULL,
  `contract_allowance_expense` longtext DEFAULT NULL,
  PRIMARY KEY (`contract_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_contract_detail`
--

LOCK TABLES `tblstaff_contract_detail` WRITE;
/*!40000 ALTER TABLE `tblstaff_contract_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstaff_contract_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_contracttype`
--

DROP TABLE IF EXISTS `tblstaff_contracttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_contracttype` (
  `id_contracttype` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_contracttype` varchar(200) NOT NULL,
  `contracttype` varchar(200) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `insurance` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_contracttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_contracttype`
--

LOCK TABLES `tblstaff_contracttype` WRITE;
/*!40000 ALTER TABLE `tblstaff_contracttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstaff_contracttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_departments`
--

DROP TABLE IF EXISTS `tblstaff_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_departments` (
  `staffdepartmentid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  PRIMARY KEY (`staffdepartmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_departments`
--

LOCK TABLES `tblstaff_departments` WRITE;
/*!40000 ALTER TABLE `tblstaff_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstaff_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_insurance`
--

DROP TABLE IF EXISTS `tblstaff_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_insurance` (
  `insurance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned NOT NULL,
  `insurance_book_num` varchar(100) DEFAULT NULL,
  `health_insurance_num` varchar(100) DEFAULT NULL,
  `city_code` varchar(100) DEFAULT NULL,
  `registration_medical` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`insurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_insurance`
--

LOCK TABLES `tblstaff_insurance` WRITE;
/*!40000 ALTER TABLE `tblstaff_insurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstaff_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_insurance_history`
--

DROP TABLE IF EXISTS `tblstaff_insurance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_insurance_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `insurance_id` int(11) unsigned NOT NULL,
  `staff_id` int(11) unsigned DEFAULT NULL,
  `from_month` date DEFAULT NULL,
  `formality` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `premium_rates` varchar(100) DEFAULT NULL,
  `payment_company` varchar(100) DEFAULT NULL,
  `payment_worker` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`insurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_insurance_history`
--

LOCK TABLES `tblstaff_insurance_history` WRITE;
/*!40000 ALTER TABLE `tblstaff_insurance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstaff_insurance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstaff_permissions`
--

DROP TABLE IF EXISTS `tblstaff_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstaff_permissions` (
  `staff_id` int(11) NOT NULL,
  `feature` varchar(40) NOT NULL,
  `capability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstaff_permissions`
--

LOCK TABLES `tblstaff_permissions` WRITE;
/*!40000 ALTER TABLE `tblstaff_permissions` DISABLE KEYS */;
INSERT INTO `tblstaff_permissions` VALUES (4,'bulk_pdf_exporter','view'),(4,'contracts','view'),(4,'contracts','create'),(4,'contracts','edit'),(4,'contracts','delete'),(4,'credit_notes','view'),(4,'credit_notes','create'),(4,'credit_notes','edit'),(4,'credit_notes','delete'),(4,'customers','view'),(4,'customers','create'),(4,'customers','edit'),(4,'customers','delete'),(4,'email_templates','view'),(4,'email_templates','edit'),(4,'estimates','view'),(4,'estimates','create'),(4,'estimates','edit'),(4,'estimates','delete'),(4,'expenses','view'),(4,'expenses','create'),(4,'expenses','edit'),(4,'expenses','delete'),(4,'invoices','view'),(4,'invoices','create'),(4,'invoices','edit'),(4,'invoices','delete'),(4,'items','view'),(4,'items','create'),(4,'items','edit'),(4,'items','delete'),(4,'payments','view'),(4,'payments','create'),(4,'payments','edit'),(4,'payments','delete'),(4,'projects','view'),(4,'projects','create'),(4,'projects','edit'),(4,'projects','delete'),(4,'projects','create_milestones'),(4,'projects','edit_milestones'),(4,'projects','delete_milestones'),(4,'proposals','view'),(4,'proposals','create'),(4,'proposals','edit'),(4,'proposals','delete'),(4,'reports','view'),(4,'roles','view'),(4,'roles','create'),(4,'roles','edit'),(4,'roles','delete'),(4,'settings','view'),(4,'settings','edit'),(4,'staff','view'),(4,'staff','create'),(4,'staff','edit'),(4,'staff','delete'),(4,'tasks','view'),(4,'tasks','create'),(4,'tasks','edit'),(4,'tasks','delete'),(4,'tasks','edit_timesheet'),(4,'tasks','edit_own_timesheet'),(4,'tasks','delete_timesheet'),(4,'tasks','delete_own_timesheet'),(4,'checklist_templates','create'),(4,'checklist_templates','delete'),(4,'estimate_request','view'),(4,'estimate_request','create'),(4,'estimate_request','edit'),(4,'estimate_request','delete'),(4,'leads','view'),(4,'leads','delete'),(4,'products','view'),(4,'products','create'),(4,'accounting_dashboard','view'),(4,'accounting_transaction','view'),(4,'accounting_transaction','create'),(4,'accounting_transaction','edit'),(4,'accounting_transaction','delete'),(4,'accounting_journal_entry','view'),(4,'accounting_journal_entry','create'),(4,'accounting_journal_entry','edit'),(4,'accounting_journal_entry','delete'),(4,'accounting_transfer','view'),(4,'accounting_transfer','create'),(4,'accounting_transfer','edit'),(4,'accounting_transfer','delete'),(4,'accounting_chart_of_accounts','view'),(4,'accounting_chart_of_accounts','create'),(4,'accounting_chart_of_accounts','edit'),(4,'accounting_chart_of_accounts','delete'),(4,'accounting_reconcile','view'),(4,'accounting_reconcile','create'),(4,'accounting_reconcile','edit'),(4,'accounting_budget','view'),(4,'accounting_budget','create'),(4,'accounting_budget','edit'),(4,'accounting_report','view'),(4,'accounting_setting','view'),(4,'accounting_setting','edit'),(4,'manufacturing','view'),(4,'manufacturing','create'),(4,'manufacturing','edit'),(4,'manufacturing','delete'),(4,'purchase','view'),(4,'purchase','create'),(4,'purchase','edit'),(4,'purchase','delete'),(4,'warehouse','view'),(4,'warehouse','create'),(4,'warehouse','edit'),(4,'warehouse','delete');
/*!40000 ALTER TABLE `tblstaff_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstock_take`
--

DROP TABLE IF EXISTS `tblstock_take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstock_take` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL COMMENT 'the reason stock take',
  `warehouse_id` int(11) DEFAULT NULL,
  `date_stock_take` date DEFAULT NULL,
  `stock_take_code` varchar(100) DEFAULT NULL COMMENT 'số kiểm kê kho',
  `date_add` date DEFAULT NULL,
  `hour_add` date DEFAULT NULL,
  `staff_id` varchar(100) DEFAULT NULL,
  `approval` int(11) DEFAULT 0 COMMENT 'status approval ',
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstock_take`
--

LOCK TABLES `tblstock_take` WRITE;
/*!40000 ALTER TABLE `tblstock_take` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstock_take` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstock_take_detail`
--

DROP TABLE IF EXISTS `tblstock_take_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstock_take_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stock_take_id` int(11) NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  `unit_id` text DEFAULT NULL,
  `unit_price` varchar(100) DEFAULT NULL,
  `quantity_stock_take` varchar(100) DEFAULT NULL,
  `quantity_accounting_book` varchar(100) DEFAULT NULL,
  `quantity_change` varchar(100) DEFAULT NULL,
  `handling` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `approval` int(11) DEFAULT 0 COMMENT 'status approval ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstock_take_detail`
--

LOCK TABLES `tblstock_take_detail` WRITE;
/*!40000 ALTER TABLE `tblstock_take_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstock_take_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsubscriptions`
--

DROP TABLE IF EXISTS `tblsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsubscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `description_in_item` tinyint(1) NOT NULL DEFAULT 0,
  `clientid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `stripe_tax_id` varchar(50) DEFAULT NULL,
  `tax_id_2` int(11) NOT NULL DEFAULT 0,
  `stripe_tax_id_2` varchar(50) DEFAULT NULL,
  `stripe_plan_id` text DEFAULT NULL,
  `stripe_subscription_id` text NOT NULL,
  `next_billing_cycle` bigint(20) DEFAULT NULL,
  `ends_at` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `created_from` int(11) NOT NULL,
  `date_subscribed` datetime DEFAULT NULL,
  `in_test_environment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsubscriptions`
--

LOCK TABLES `tblsubscriptions` WRITE;
/*!40000 ALTER TABLE `tblsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsurveyresultsets`
--

DROP TABLE IF EXISTS `tblsurveyresultsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsurveyresultsets` (
  `resultsetid` int(11) NOT NULL AUTO_INCREMENT,
  `surveyid` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `useragent` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`resultsetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsurveyresultsets`
--

LOCK TABLES `tblsurveyresultsets` WRITE;
/*!40000 ALTER TABLE `tblsurveyresultsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsurveyresultsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsurveys`
--

DROP TABLE IF EXISTS `tblsurveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsurveys` (
  `surveyid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext NOT NULL,
  `slug` mediumtext NOT NULL,
  `description` text NOT NULL,
  `viewdescription` text DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `redirect_url` varchar(100) DEFAULT NULL,
  `send` tinyint(1) NOT NULL DEFAULT 0,
  `onlyforloggedin` int(11) DEFAULT 0,
  `fromname` varchar(100) DEFAULT NULL,
  `iprestrict` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`surveyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsurveys`
--

LOCK TABLES `tblsurveys` WRITE;
/*!40000 ALTER TABLE `tblsurveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsurveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsurveysemailsendcron`
--

DROP TABLE IF EXISTS `tblsurveysemailsendcron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsurveysemailsendcron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surveyid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `emailid` int(11) DEFAULT NULL,
  `listid` varchar(11) DEFAULT NULL,
  `log_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsurveysemailsendcron`
--

LOCK TABLES `tblsurveysemailsendcron` WRITE;
/*!40000 ALTER TABLE `tblsurveysemailsendcron` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsurveysemailsendcron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsurveysendlog`
--

DROP TABLE IF EXISTS `tblsurveysendlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsurveysendlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surveyid` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `iscronfinished` int(11) NOT NULL DEFAULT 0,
  `send_to_mail_lists` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsurveysendlog`
--

LOCK TABLES `tblsurveysendlog` WRITE;
/*!40000 ALTER TABLE `tblsurveysendlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsurveysendlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltaggables`
--

DROP TABLE IF EXISTS `tbltaggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltaggables` (
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `tag_order` int(11) NOT NULL DEFAULT 0,
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltaggables`
--

LOCK TABLES `tbltaggables` WRITE;
/*!40000 ALTER TABLE `tbltaggables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltaggables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltags`
--

DROP TABLE IF EXISTS `tbltags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltags`
--

LOCK TABLES `tbltags` WRITE;
/*!40000 ALTER TABLE `tbltags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltask_assigned`
--

DROP TABLE IF EXISTS `tbltask_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltask_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `assigned_from` int(11) NOT NULL DEFAULT 0,
  `is_assigned_from_contact` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltask_assigned`
--

LOCK TABLES `tbltask_assigned` WRITE;
/*!40000 ALTER TABLE `tbltask_assigned` DISABLE KEYS */;
INSERT INTO `tbltask_assigned` VALUES (1,1,1,1,0),(3,1,3,1,0),(6,1,6,1,0),(7,1,7,1,0),(8,1,8,1,0),(9,1,9,1,0),(10,1,10,1,0),(11,1,11,1,0);
/*!40000 ALTER TABLE `tbltask_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltask_checklist_items`
--

DROP TABLE IF EXISTS `tbltask_checklist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltask_checklist_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `description` text NOT NULL,
  `finished` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `finished_from` int(11) DEFAULT 0,
  `list_order` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltask_checklist_items`
--

LOCK TABLES `tbltask_checklist_items` WRITE;
/*!40000 ALTER TABLE `tbltask_checklist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltask_checklist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltask_comments`
--

DROP TABLE IF EXISTS `tbltask_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltask_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `taskid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `file_id` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltask_comments`
--

LOCK TABLES `tbltask_comments` WRITE;
/*!40000 ALTER TABLE `tbltask_comments` DISABLE KEYS */;
INSERT INTO `tbltask_comments` VALUES (1,'[task_attachment]',1,1,0,1,'2022-07-13 10:19:49'),(2,'SE TOMARON FOTOGRAFIAS EN CADA LOCACION',1,1,0,0,'2022-07-13 10:22:16'),(3,'[task_attachment]',3,1,0,2,'2022-07-13 10:28:14'),(4,'[task_attachment]',3,1,0,3,'2022-07-13 10:29:15'),(5,'ANALISIS DE DOMINIO Y GESTION DE MARKETING',3,1,0,0,'2022-07-13 10:29:31'),(6,'[task_attachment]',10,1,0,5,'2022-07-13 23:23:09'),(7,'SE AH CRADO LINEAS DE CODIGO DE SITEMAP<br>SE INICIARA CON LA COMPILACION DE ARCHIVO XML',10,1,0,0,'2022-07-13 23:23:31'),(8,'[task_attachment]',10,1,0,6,'2022-07-13 23:24:04'),(9,'COMPILACION DE ARCHIVO XML',10,1,0,0,'2022-07-13 23:24:16'),(10,'[task_attachment]',8,1,0,7,'2022-07-13 23:27:27'),(11,'se ejecuta xml de sitemap para llamadas de retorno',8,1,0,0,'2022-07-13 23:27:45'),(12,'[task_attachment]',11,1,0,8,'2022-07-18 16:02:04');
/*!40000 ALTER TABLE `tbltask_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltask_followers`
--

DROP TABLE IF EXISTS `tbltask_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltask_followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltask_followers`
--

LOCK TABLES `tbltask_followers` WRITE;
/*!40000 ALTER TABLE `tbltask_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltask_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltasks`
--

DROP TABLE IF EXISTS `tbltasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `startdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `datefinished` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `is_added_from_contact` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `is_recurring_from` int(11) DEFAULT NULL,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `last_recurring_date` date DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `billable` tinyint(1) NOT NULL DEFAULT 0,
  `billed` tinyint(1) NOT NULL DEFAULT 0,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `milestone` int(11) DEFAULT 0,
  `kanban_order` int(11) DEFAULT 1,
  `milestone_order` int(11) NOT NULL DEFAULT 0,
  `visible_to_client` tinyint(1) NOT NULL DEFAULT 0,
  `deadline_notified` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `milestone` (`milestone`),
  KEY `kanban_order` (`kanban_order`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltasks`
--

LOCK TABLES `tbltasks` WRITE;
/*!40000 ALTER TABLE `tbltasks` DISABLE KEYS */;
INSERT INTO `tbltasks` VALUES (1,'LEVANTAMIENTO DE IMAGEN CORPORATIVA SET 1','SE GRABO EN 3 LOCACIONES DISTINTAS, ELEVADORES, PERSONAL DE MANTENIMIENTO, Y TESTIMONIO DE DIRECTOR',3,'2022-07-13 10:18:08','2022-07-09','2022-07-10','2022-07-13 10:19:58',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,1,0,1,0),(3,'CM STEP#1 ANALISIS DEL ESTADO ACTUAL DE GOOGLE MY BUSINESS','SE REALIZO ANALISIS DE CADA UNA DE LAS PARTES QUE CONFORMAN LA ESTRATEGIA DE SERVICIOS DIRIGIDOS EN GOOGLE ADS Y EN PLATAFORMAS DE GOOGLE PARA EL ANALISIS DE MARKETING',2,'2022-07-13 10:27:32','2022-07-12','2022-07-13','2022-07-13 10:29:39',1,0,5,NULL,0,0,NULL,0,0,0,NULL,1,'project',1,1,0,0,0.00,0,2,0,1,0),(6,'ESTRATEGIA DE MARKETING','CREACION DE ESTRATEGIA DE MARKETING PARA EL CORRECTO FUNCIONAMIENTO DE CADA UNA DE LAS OPERACIONES DE MARKETING DIGITAL',2,'2022-07-13 11:19:43','2022-07-13','2022-07-13','2022-07-18 15:59:19',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,6,0,1,0),(7,'ESTUDIO DE MERCADO','CREACION DE ESTUDIO DE MERCADO GLOBAL, INTERNACIONAL , NACIONAL Y LOCAL',2,'2022-07-13 11:20:49','2022-07-11','2022-07-13','2022-07-18 15:59:26',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,3,0,1,0),(8,'Ejecucion de Sitemap','debe ejecutarse el xml desde el analytics de google',2,'2022-07-13 14:03:54','2022-07-13','2022-07-15','2022-07-18 15:59:13',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,7,0,1,0),(9,'configuracion de Google tag','configuracion y puesta en marcha de google tag',2,'2022-07-13 14:04:31','2022-07-13','2022-07-15','2022-07-18 15:59:22',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,4,0,1,0),(10,'SITEMAP CREATE','CREACION Y PROGRAMACION SITEMAP Y COMPILACION ARCHIVO XML',2,'2022-07-13 23:21:58','2022-07-13','2022-07-13','2022-07-13 23:28:05',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,5,0,1,0),(11,'CONFIGURACION GOOGLE TOOLS','Se configuran aplicaiones y herrmaientas de SEO y CEO en google&#160;',2,'2022-07-18 16:00:46','2022-07-18',NULL,'2022-07-18 17:47:11',1,0,5,NULL,NULL,0,NULL,0,0,0,NULL,1,'project',0,1,0,0,0.00,0,1,0,1,0);
/*!40000 ALTER TABLE `tbltasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltasks_checklist_templates`
--

DROP TABLE IF EXISTS `tbltasks_checklist_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltasks_checklist_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltasks_checklist_templates`
--

LOCK TABLES `tbltasks_checklist_templates` WRITE;
/*!40000 ALTER TABLE `tbltasks_checklist_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltasks_checklist_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltaskstimers`
--

DROP TABLE IF EXISTS `tbltaskstimers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltaskstimers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `start_time` varchar(64) NOT NULL,
  `end_time` varchar(64) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltaskstimers`
--

LOCK TABLES `tbltaskstimers` WRITE;
/*!40000 ALTER TABLE `tbltaskstimers` DISABLE KEYS */;
INSERT INTO `tbltaskstimers` VALUES (1,1,'1657725498','1657725598',1,0.00,NULL),(3,3,'1657726056','1657726179',1,0.00,NULL);
/*!40000 ALTER TABLE `tbltaskstimers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltaxes`
--

DROP TABLE IF EXISTS `tbltaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltaxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltaxes`
--

LOCK TABLES `tbltaxes` WRITE;
/*!40000 ALTER TABLE `tbltaxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltemplates`
--

DROP TABLE IF EXISTS `tbltemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltemplates`
--

LOCK TABLES `tbltemplates` WRITE;
/*!40000 ALTER TABLE `tbltemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticket_attachments`
--

DROP TABLE IF EXISTS `tblticket_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `replyid` int(11) DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticket_attachments`
--

LOCK TABLES `tblticket_attachments` WRITE;
/*!40000 ALTER TABLE `tblticket_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticket_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticket_replies`
--

DROP TABLE IF EXISTS `tblticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `contactid` int(11) NOT NULL DEFAULT 0,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `date` datetime NOT NULL,
  `message` text DEFAULT NULL,
  `attachment` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblticket_replies`
--

LOCK TABLES `tblticket_replies` WRITE;
/*!40000 ALTER TABLE `tblticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets`
--

DROP TABLE IF EXISTS `tbltickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickets` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT,
  `adminreplying` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL DEFAULT 0,
  `merged_ticket_id` int(11) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `department` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `service` int(11) DEFAULT NULL,
  `ticketkey` varchar(32) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `lastreply` datetime DEFAULT NULL,
  `clientread` int(11) NOT NULL DEFAULT 0,
  `adminread` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `staff_id_replying` int(11) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `service` (`service`),
  KEY `department` (`department`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `priority` (`priority`),
  KEY `project_id` (`project_id`),
  KEY `contactid` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets`
--

LOCK TABLES `tbltickets` WRITE;
/*!40000 ALTER TABLE `tbltickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets_pipe_log`
--

DROP TABLE IF EXISTS `tbltickets_pipe_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickets_pipe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` mediumtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets_pipe_log`
--

LOCK TABLES `tbltickets_pipe_log` WRITE;
/*!40000 ALTER TABLE `tbltickets_pipe_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltickets_pipe_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets_predefined_replies`
--

DROP TABLE IF EXISTS `tbltickets_predefined_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickets_predefined_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets_predefined_replies`
--

LOCK TABLES `tbltickets_predefined_replies` WRITE;
/*!40000 ALTER TABLE `tbltickets_predefined_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltickets_predefined_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets_priorities`
--

DROP TABLE IF EXISTS `tbltickets_priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickets_priorities` (
  `priorityid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets_priorities`
--

LOCK TABLES `tbltickets_priorities` WRITE;
/*!40000 ALTER TABLE `tbltickets_priorities` DISABLE KEYS */;
INSERT INTO `tbltickets_priorities` VALUES (1,'Low'),(2,'Medium'),(3,'High');
/*!40000 ALTER TABLE `tbltickets_priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets_status`
--

DROP TABLE IF EXISTS `tbltickets_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltickets_status` (
  `ticketstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isdefault` int(11) NOT NULL DEFAULT 0,
  `statuscolor` varchar(7) DEFAULT NULL,
  `statusorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticketstatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltickets_status`
--

LOCK TABLES `tbltickets_status` WRITE;
/*!40000 ALTER TABLE `tbltickets_status` DISABLE KEYS */;
INSERT INTO `tbltickets_status` VALUES (1,'Open',1,'#ff2d42',1),(2,'In progress',1,'#84c529',2),(3,'Answered',1,'#0000ff',3),(4,'On Hold',1,'#c0c0c0',4),(5,'Closed',1,'#03a9f4',5);
/*!40000 ALTER TABLE `tbltickets_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltodos`
--

DROP TABLE IF EXISTS `tbltodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltodos` (
  `todoid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `datefinished` datetime DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`todoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltodos`
--

LOCK TABLES `tbltodos` WRITE;
/*!40000 ALTER TABLE `tbltodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltracked_mails`
--

DROP TABLE IF EXISTS `tbltracked_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltracked_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT 0,
  `date_opened` datetime DEFAULT NULL,
  `subject` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltracked_mails`
--

LOCK TABLES `tbltracked_mails` WRITE;
/*!40000 ALTER TABLE `tbltracked_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltracked_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltraining_allocation`
--

DROP TABLE IF EXISTS `tbltraining_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltraining_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_process_id` varchar(100) NOT NULL,
  `staffid` int(11) DEFAULT NULL,
  `training_type` int(11) DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `training_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltraining_allocation`
--

LOCK TABLES `tbltraining_allocation` WRITE;
/*!40000 ALTER TABLE `tbltraining_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltraining_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltransfer_records_reception`
--

DROP TABLE IF EXISTS `tbltransfer_records_reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltransfer_records_reception` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(50) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransfer_records_reception`
--

LOCK TABLES `tbltransfer_records_reception` WRITE;
/*!40000 ALTER TABLE `tbltransfer_records_reception` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltransfer_records_reception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltwocheckout_log`
--

DROP TABLE IF EXISTS `tbltwocheckout_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltwocheckout_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `tbltwocheckout_log_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `tblinvoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltwocheckout_log`
--

LOCK TABLES `tbltwocheckout_log` WRITE;
/*!40000 ALTER TABLE `tbltwocheckout_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltwocheckout_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser_auto_login`
--

DROP TABLE IF EXISTS `tbluser_auto_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser_auto_login` (
  `key_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser_auto_login`
--

LOCK TABLES `tbluser_auto_login` WRITE;
/*!40000 ALTER TABLE `tbluser_auto_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser_auto_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser_meta`
--

DROP TABLE IF EXISTS `tbluser_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser_meta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `client_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `contact_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(191) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser_meta`
--

LOCK TABLES `tbluser_meta` WRITE;
/*!40000 ALTER TABLE `tbluser_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblvault`
--

DROP TABLE IF EXISTS `tblvault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `server_address` varchar(191) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `description` text DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `share_in_projects` tinyint(1) NOT NULL DEFAULT 0,
  `last_updated` datetime DEFAULT NULL,
  `last_updated_from` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblvault`
--

LOCK TABLES `tblvault` WRITE;
/*!40000 ALTER TABLE `tblvault` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblvault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblviews_tracking`
--

DROP TABLE IF EXISTS `tblviews_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblviews_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblviews_tracking`
--

LOCK TABLES `tblviews_tracking` WRITE;
/*!40000 ALTER TABLE `tblviews_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblviews_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblware_body_type`
--

DROP TABLE IF EXISTS `tblware_body_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblware_body_type` (
  `body_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `body_code` varchar(100) DEFAULT NULL,
  `body_name` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  PRIMARY KEY (`body_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblware_body_type`
--

LOCK TABLES `tblware_body_type` WRITE;
/*!40000 ALTER TABLE `tblware_body_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblware_body_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblware_color`
--

DROP TABLE IF EXISTS `tblware_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblware_color` (
  `color_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `color_code` varchar(100) DEFAULT NULL,
  `color_name` varchar(100) DEFAULT NULL,
  `color_hex` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblware_color`
--

LOCK TABLES `tblware_color` WRITE;
/*!40000 ALTER TABLE `tblware_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblware_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblware_commodity_type`
--

DROP TABLE IF EXISTS `tblware_commodity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblware_commodity_type` (
  `commodity_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commondity_code` varchar(100) DEFAULT NULL,
  `commondity_name` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  PRIMARY KEY (`commodity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblware_commodity_type`
--

LOCK TABLES `tblware_commodity_type` WRITE;
/*!40000 ALTER TABLE `tblware_commodity_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblware_commodity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblware_size_type`
--

DROP TABLE IF EXISTS `tblware_size_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblware_size_type` (
  `size_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `size_code` varchar(100) DEFAULT NULL,
  `size_name` text DEFAULT NULL,
  `size_symbol` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  PRIMARY KEY (`size_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblware_size_type`
--

LOCK TABLES `tblware_size_type` WRITE;
/*!40000 ALTER TABLE `tblware_size_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblware_size_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblware_style_type`
--

DROP TABLE IF EXISTS `tblware_style_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblware_style_type` (
  `style_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `style_code` varchar(100) DEFAULT NULL,
  `style_barcode` text DEFAULT NULL,
  `style_name` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  PRIMARY KEY (`style_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblware_style_type`
--

LOCK TABLES `tblware_style_type` WRITE;
/*!40000 ALTER TABLE `tblware_style_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblware_style_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblware_unit_type`
--

DROP TABLE IF EXISTS `tblware_unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblware_unit_type` (
  `unit_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(100) DEFAULT NULL,
  `unit_name` text DEFAULT NULL,
  `unit_symbol` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_measure_type` varchar(100) DEFAULT 'reference',
  `bigger_ratio` decimal(15,5) DEFAULT 0.00000,
  `smaller_ratio` decimal(15,5) DEFAULT 0.00000,
  `rounding` decimal(15,5) DEFAULT 0.00000,
  PRIMARY KEY (`unit_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblware_unit_type`
--

LOCK TABLES `tblware_unit_type` WRITE;
/*!40000 ALTER TABLE `tblware_unit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblware_unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwarehouse`
--

DROP TABLE IF EXISTS `tblwarehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwarehouse` (
  `warehouse_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_code` varchar(100) DEFAULT NULL,
  `warehouse_name` text DEFAULT NULL,
  `warehouse_address` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `zip_code` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwarehouse`
--

LOCK TABLES `tblwarehouse` WRITE;
/*!40000 ALTER TABLE `tblwarehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwarehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblweb_to_lead`
--

DROP TABLE IF EXISTS `tblweb_to_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblweb_to_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `notify_lead_imported` int(11) NOT NULL DEFAULT 1,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext DEFAULT NULL,
  `responsible` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL,
  `form_data` mediumtext DEFAULT NULL,
  `recaptcha` int(11) NOT NULL DEFAULT 0,
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `submit_btn_text_color` varchar(10) DEFAULT '#ffffff',
  `submit_btn_bg_color` varchar(10) DEFAULT '#84c529',
  `success_submit_msg` text DEFAULT NULL,
  `submit_action` int(11) DEFAULT 0,
  `lead_name_prefix` varchar(255) DEFAULT NULL,
  `submit_redirect_url` mediumtext DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int(11) NOT NULL DEFAULT 1,
  `mark_public` int(11) NOT NULL DEFAULT 0,
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblweb_to_lead`
--

LOCK TABLES `tblweb_to_lead` WRITE;
/*!40000 ALTER TABLE `tblweb_to_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblweb_to_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblweb_to_recruitment`
--

DROP TABLE IF EXISTS `tblweb_to_recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblweb_to_recruitment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_code` varchar(200) DEFAULT NULL,
  `campaign_name` varchar(200) DEFAULT NULL,
  `cp_proposal` text DEFAULT NULL,
  `cp_position` int(11) DEFAULT NULL,
  `cp_department` int(11) DEFAULT NULL,
  `cp_amount_recruiment` int(11) DEFAULT NULL,
  `cp_form_work` varchar(45) DEFAULT NULL,
  `cp_workplace` varchar(255) DEFAULT NULL,
  `cp_salary_from` decimal(15,0) DEFAULT NULL,
  `cp_salary_to` decimal(15,0) DEFAULT NULL,
  `cp_from_date` date DEFAULT NULL,
  `cp_to_date` date DEFAULT NULL,
  `cp_reason_recruitment` text DEFAULT NULL,
  `cp_job_description` text DEFAULT NULL,
  `cp_manager` text DEFAULT NULL,
  `cp_follower` text DEFAULT NULL,
  `cp_ages_from` int(11) DEFAULT NULL,
  `cp_ages_to` int(11) DEFAULT NULL,
  `cp_gender` varchar(10) DEFAULT NULL,
  `cp_height` float DEFAULT NULL,
  `cp_weight` float DEFAULT NULL,
  `cp_literacy` varchar(200) DEFAULT NULL,
  `cp_experience` varchar(200) DEFAULT NULL,
  `cp_add_from` int(11) DEFAULT NULL,
  `cp_date_add` date DEFAULT NULL,
  `cp_status` int(11) DEFAULT NULL,
  `nation` varchar(15) DEFAULT NULL,
  `nationality` varchar(15) DEFAULT NULL,
  `religion` varchar(15) DEFAULT NULL,
  `marital_status` varchar(15) DEFAULT NULL,
  `birthplace` varchar(200) DEFAULT NULL,
  `home_town` varchar(200) DEFAULT NULL,
  `resident` varchar(200) DEFAULT NULL,
  `current_accommodation` varchar(200) DEFAULT NULL,
  `cp_desired_salary` varchar(10) DEFAULT NULL,
  `specialized` varchar(100) DEFAULT NULL,
  `training_form` varchar(50) DEFAULT NULL,
  `training_places` varchar(50) DEFAULT NULL,
  `lead_source` varchar(10) DEFAULT NULL,
  `lead_status` varchar(10) DEFAULT NULL,
  `notify_ids_staff` text DEFAULT NULL,
  `notify_ids_roles` text DEFAULT NULL,
  `form_key` varchar(32) DEFAULT NULL,
  `notify_lead_imported` int(11) DEFAULT 1,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext DEFAULT NULL,
  `responsible` int(11) DEFAULT 0,
  `name` varchar(191) DEFAULT NULL,
  `form_data` mediumtext DEFAULT NULL,
  `recaptcha` int(11) DEFAULT 0,
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `success_submit_msg` text DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int(11) DEFAULT 1,
  `mark_public` int(11) DEFAULT 0,
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblweb_to_recruitment`
--

LOCK TABLES `tblweb_to_recruitment` WRITE;
/*!40000 ALTER TABLE `tblweb_to_recruitment` DISABLE KEYS */;
INSERT INTO `tblweb_to_recruitment` VALUES (1,'','','',0,0,1,'','',0,0,'0000-00-00','0000-00-00','','','','',15,60,'',1,40,'','',0,'0000-00-00',0,'','','','','','','','','','','','','','','','','f2d4b87df369376989dd262c37c9fd10',0,'','',0,'recruitment_form','[{\"label\":\"Croatia\",\"value\":\"55\"},{\"label\":\"Cuba\",\"value\":\"56\"},{\"label\":\"Curacao\",\"value\":\"57\"},{\"label\":\"Cyprus\",\"value\":\"58\"},{\"label\":\"Czech Republic\",\"value\":\"59\"},{\"label\":\"Democratic Republic of the Congo\",\"value\":\"60\"},{\"label\":\"Denmark\",\"value\":\"61\"},{\"label\":\"Djibouti\",\"value\":\"62\"},{\"label\":\"Dominica\",\"value\":\"63\"},{\"label\":\"Dominican Republic\",\"value\":\"64\"},{\"label\":\"Ecuador\",\"value\":\"65\"},{\"label\":\"Egypt\",\"value\":\"66\"},{\"label\":\"El Salvador\",\"value\":\"67\"},{\"label\":\"Equatorial Guinea\",\"value\":\"68\"},{\"label\":\"Eritrea\",\"value\":\"69\"},{\"label\":\"Estonia\",\"value\":\"70\"},{\"label\":\"Ethiopia\",\"value\":\"71\"},{\"label\":\"Falkland Islands (Malvinas)\",\"value\":\"72\"},{\"label\":\"Faroe Islands\",\"value\":\"73\"},{\"label\":\"Fiji\",\"value\":\"74\"},{\"label\":\"Finland\",\"value\":\"75\"},{\"label\":\"France\",\"value\":\"76\"},{\"label\":\"French Guiana\",\"value\":\"77\"},{\"label\":\"French Polynesia\",\"value\":\"78\"},{\"label\":\"French Southern Territories\",\"value\":\"79\"},{\"label\":\"Gabon\",\"value\":\"80\"},{\"label\":\"Gambia\",\"value\":\"81\"},{\"label\":\"Georgia\",\"value\":\"82\"},{\"label\":\"Germany\",\"value\":\"83\"},{\"label\":\"Ghana\",\"value\":\"84\"},{\"label\":\"Gibraltar\",\"value\":\"85\"},{\"label\":\"Greece\",\"value\":\"86\"},{\"label\":\"Greenland\",\"value\":\"87\"},{\"label\":\"Grenada\",\"value\":\"88\"},{\"label\":\"Guadaloupe\",\"value\":\"89\"},{\"label\":\"Guam\",\"value\":\"90\"},{\"label\":\"Guatemala\",\"value\":\"91\"},{\"label\":\"Guernsey\",\"value\":\"92\"},{\"label\":\"Guinea\",\"value\":\"93\"},{\"label\":\"Guinea-Bissau\",\"value\":\"94\"},{\"label\":\"Guyana\",\"value\":\"95\"},{\"label\":\"Haiti\",\"value\":\"96\"},{\"label\":\"Heard Island and McDonald Islands\",\"value\":\"97\"},{\"label\":\"Honduras\",\"value\":\"98\"},{\"label\":\"Hong Kong\",\"value\":\"99\"},{\"label\":\"Hungary\",\"value\":\"100\"},{\"label\":\"Iceland\",\"value\":\"101\"},{\"label\":\"India\",\"value\":\"102\"},{\"label\":\"Indonesia\",\"value\":\"103\"},{\"label\":\"Iran\",\"value\":\"104\"},{\"label\":\"Iraq\",\"value\":\"105\"},{\"label\":\"Ireland\",\"value\":\"106\"},{\"label\":\"Isle of Man\",\"value\":\"107\"},{\"label\":\"Israel\",\"value\":\"108\"},{\"label\":\"Italy\",\"value\":\"109\"},{\"label\":\"Jamaica\",\"value\":\"110\"},{\"label\":\"Japan\",\"value\":\"111\"},{\"label\":\"Jersey\",\"value\":\"112\"},{\"label\":\"Jordan\",\"value\":\"113\"},{\"label\":\"Kazakhstan\",\"value\":\"114\"},{\"label\":\"Kenya\",\"value\":\"115\"},{\"label\":\"Kiribati\",\"value\":\"116\"},{\"label\":\"Kosovo\",\"value\":\"117\"},{\"label\":\"Kuwait\",\"value\":\"118\"},{\"label\":\"Kyrgyzstan\",\"value\":\"119\"},{\"label\":\"Laos\",\"value\":\"120\"},{\"label\":\"Latvia\",\"value\":\"121\"},{\"label\":\"Lebanon\",\"value\":\"122\"},{\"label\":\"Lesotho\",\"value\":\"123\"},{\"label\":\"Liberia\",\"value\":\"124\"},{\"label\":\"Libya\",\"value\":\"125\"},{\"label\":\"Liechtenstein\",\"value\":\"126\"},{\"label\":\"Lithuania\",\"value\":\"127\"},{\"label\":\"Luxembourg\",\"value\":\"128\"},{\"label\":\"Macao\",\"value\":\"129\"},{\"label\":\"North Macedonia\",\"value\":\"130\"},{\"label\":\"Madagascar\",\"value\":\"131\"},{\"label\":\"Malawi\",\"value\":\"132\"},{\"label\":\"Malaysia\",\"value\":\"133\"},{\"label\":\"Maldives\",\"value\":\"134\"},{\"label\":\"Mali\",\"value\":\"135\"},{\"label\":\"Malta\",\"value\":\"136\"},{\"label\":\"Marshall Islands\",\"value\":\"137\"},{\"label\":\"Martinique\",\"value\":\"138\"},{\"label\":\"Mauritania\",\"value\":\"139\"},{\"label\":\"Mauritius\",\"value\":\"140\"},{\"label\":\"Mayotte\",\"value\":\"141\"},{\"label\":\"Mexico\",\"value\":\"142\"},{\"label\":\"Micronesia\",\"value\":\"143\"},{\"label\":\"Moldava\",\"value\":\"144\"},{\"label\":\"Monaco\",\"value\":\"145\"},{\"label\":\"Mongolia\",\"value\":\"146\"},{\"label\":\"Montenegro\",\"value\":\"147\"},{\"label\":\"Montserrat\",\"value\":\"148\"},{\"label\":\"Morocco\",\"value\":\"149\"},{\"label\":\"Mozambique\",\"value\":\"150\"},{\"label\":\"Myanmar (Burma)\",\"value\":\"151\"},{\"label\":\"Namibia\",\"value\":\"152\"},{\"label\":\"Nauru\",\"value\":\"153\"},{\"label\":\"Nepal\",\"value\":\"154\"},{\"label\":\"Netherlands\",\"value\":\"155\"},{\"label\":\"New Caledonia\",\"value\":\"156\"},{\"label\":\"New Zealand\",\"value\":\"157\"},{\"label\":\"Nicaragua\",\"value\":\"158\"},{\"label\":\"Niger\",\"value\":\"159\"},{\"label\":\"Nigeria\",\"value\":\"160\"},{\"label\":\"Niue\",\"value\":\"161\"},{\"label\":\"Norfolk Island\",\"value\":\"162\"},{\"label\":\"North Korea\",\"value\":\"163\"},{\"label\":\"Northern Mariana Islands\",\"value\":\"164\"},{\"label\":\"Norway\",\"value\":\"165\"},{\"label\":\"Oman\",\"value\":\"166\"},{\"label\":\"Pakistan\",\"value\":\"167\"},{\"label\":\"Palau\",\"value\":\"168\"},{\"label\":\"Palestine\",\"value\":\"169\"},{\"label\":\"Panama\",\"value\":\"170\"},{\"label\":\"Papua New Guinea\",\"value\":\"171\"},{\"label\":\"Paraguay\",\"value\":\"172\"},{\"label\":\"Peru\",\"value\":\"173\"},{\"label\":\"Phillipines\",\"value\":\"174\"},{\"label\":\"Pitcairn\",\"value\":\"175\"},{\"label\":\"Poland\",\"value\":\"176\"},{\"label\":\"Portugal\",\"value\":\"177\"},{\"label\":\"Puerto Rico\",\"value\":\"178\"},{\"label\":\"Qatar\",\"value\":\"179\"},{\"label\":\"Reunion\",\"value\":\"180\"},{\"label\":\"Romania\",\"value\":\"181\"},{\"label\":\"Russia\",\"value\":\"182\"},{\"label\":\"Rwanda\",\"value\":\"183\"},{\"label\":\"Saint Barthelemy\",\"value\":\"184\"},{\"label\":\"Saint Helena\",\"value\":\"185\"},{\"label\":\"Saint Kitts and Nevis\",\"value\":\"186\"},{\"label\":\"Saint Lucia\",\"value\":\"187\"},{\"label\":\"Saint Martin\",\"value\":\"188\"},{\"label\":\"Saint Pierre and Miquelon\",\"value\":\"189\"},{\"label\":\"Saint Vincent and the Grenadines\",\"value\":\"190\"},{\"label\":\"Samoa\",\"value\":\"191\"},{\"label\":\"San Marino\",\"value\":\"192\"},{\"label\":\"Sao Tome and Principe\",\"value\":\"193\"},{\"label\":\"Saudi Arabia\",\"value\":\"194\"},{\"label\":\"Senegal\",\"value\":\"195\"},{\"label\":\"Serbia\",\"value\":\"196\"},{\"label\":\"Seychelles\",\"value\":\"197\"},{\"label\":\"Sierra Leone\",\"value\":\"198\"},{\"label\":\"Singapore\",\"value\":\"199\"},{\"label\":\"Sint Maarten\",\"value\":\"200\"},{\"label\":\"Slovakia\",\"value\":\"201\"},{\"label\":\"Slovenia\",\"value\":\"202\"},{\"label\":\"Solomon Islands\",\"value\":\"203\"},{\"label\":\"Somalia\",\"value\":\"204\"},{\"label\":\"South Africa\",\"value\":\"205\"},{\"label\":\"South Georgia and the South Sandwich Islands\",\"value\":\"206\"},{\"label\":\"South Korea\",\"value\":\"207\"},{\"label\":\"South Sudan\",\"value\":\"208\"},{\"label\":\"Spain\",\"value\":\"209\"},{\"label\":\"Sri Lanka\",\"value\":\"210\"},{\"label\":\"Sudan\",\"value\":\"211\"},{\"label\":\"Suriname\",\"value\":\"212\"},{\"label\":\"Svalbard and Jan Mayen\",\"value\":\"213\"},{\"label\":\"Swaziland\",\"value\":\"214\"},{\"label\":\"Sweden\",\"value\":\"215\"},{\"label\":\"Switzerland\",\"value\":\"216\"},{\"label\":\"Syria\",\"value\":\"217\"},{\"label\":\"Taiwan\",\"value\":\"218\"},{\"label\":\"Tajikistan\",\"value\":\"219\"},{\"label\":\"Tanzania\",\"value\":\"220\"},{\"label\":\"Thailand\",\"value\":\"221\"},{\"label\":\"Timor-Leste (East Timor)\",\"value\":\"222\"},{\"label\":\"Togo\",\"value\":\"223\"},{\"label\":\"Tokelau\",\"value\":\"224\"},{\"label\":\"Tonga\",\"value\":\"225\"},{\"label\":\"Trinidad and Tobago\",\"value\":\"226\"},{\"label\":\"Tunisia\",\"value\":\"227\"},{\"label\":\"Turkey\",\"value\":\"228\"},{\"label\":\"Turkmenistan\",\"value\":\"229\"},{\"label\":\"Turks and Caicos Islands\",\"value\":\"230\"},{\"label\":\"Tuvalu\",\"value\":\"231\"},{\"label\":\"Uganda\",\"value\":\"232\"},{\"label\":\"Ukraine\",\"value\":\"233\"},{\"label\":\"United Arab Emirates\",\"value\":\"234\"},{\"label\":\"United Kingdom\",\"value\":\"235\"},{\"label\":\"United States\",\"value\":\"236\"},{\"label\":\"United States Minor Outlying Islands\",\"value\":\"237\"},{\"label\":\"Uruguay\",\"value\":\"238\"},{\"label\":\"Uzbekistan\",\"value\":\"239\"},{\"label\":\"Vanuatu\",\"value\":\"240\"},{\"label\":\"Vatican City\",\"value\":\"241\"},{\"label\":\"Venezuela\",\"value\":\"242\"},{\"label\":\"Vietnam\",\"value\":\"243\",\"selected\":true},{\"label\":\"Virgin Islands, British\",\"value\":\"244\"},{\"label\":\"Virgin Islands, US\",\"value\":\"245\"},{\"label\":\"Wallis and Futuna\",\"value\":\"246\"},{\"label\":\"Western Sahara\",\"value\":\"247\"},{\"label\":\"Yemen\",\"value\":\"248\"},{\"label\":\"Zambia\",\"value\":\"249\"},{\"label\":\"Zimbabwe\",\"value\":\"250\"}]},{\"type\":\"text\",\"label\":\"_national\",\"className\":\"form-control\",\"name\":\"nation\",\"subtype\":\"text\"},{\"type\":\"text\",\"label\":\"_religion\",\"className\":\"form-control\",\"name\":\"religion\",\"subtype\":\"text\"},{\"type\":\"text\",\"label\":\"_phone\",\"className\":\"form-control\",\"name\":\"phonenumber\",\"subtype\":\"text\"},{\"type\":\"select\",\"label\":\"_diploma\",\"className\":\"form-control\",\"name\":\"diploma\",\"values\":[{\"label\":\"\",\"value\":\"\"},{\"label\":\"master_s_degree\",\"value\":\"0\"},{\"label\":\"Ph_D\",\"value\":\"1\"},{\"label\":\"bachelor\",\"value\":\"2\"},{\"label\":\"university\",\"value\":\"3\"},{\"label\":\"vocational_colleges\",\"value\":\"4\"},{\"label\":\"vocational\",\"value\":\"5\"},{\"label\":\"high_school\",\"value\":\"6\"}]},{\"type\":\"text\",\"label\":\"training_places\",\"className\":\"form-control\",\"name\":\"training_places\",\"subtype\":\"text\"},{\"type\":\"text\",\"label\":\"specialized\",\"className\":\"form-control\",\"name\":\"specialized\",\"subtype\":\"text\"},{\"type\":\"text\",\"label\":\"forms_of_training\",\"className\":\"form-control\",\"name\":\"training_form\",\"subtype\":\"text\"},{\"type\":\"text\",\"label\":\"issue_date_identification_card\",\"className\":\"form-control fc-datepicker\",\"name\":\"days_for_identity\",\"subtype\":\"text\"}]',0,'sent','sent_successfully','',0,0,'','',0);
/*!40000 ALTER TABLE `tblweb_to_recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_activity_log`
--

DROP TABLE IF EXISTS `tblwh_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_activity_log`
--

LOCK TABLES `tblwh_activity_log` WRITE;
/*!40000 ALTER TABLE `tblwh_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_approval_details`
--

DROP TABLE IF EXISTS `tblwh_approval_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_approval_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` varchar(45) DEFAULT NULL,
  `approve` varchar(45) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  `staff_approve` int(11) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_approval_details`
--

LOCK TABLES `tblwh_approval_details` WRITE;
/*!40000 ALTER TABLE `tblwh_approval_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_approval_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_approval_setting`
--

DROP TABLE IF EXISTS `tblwh_approval_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_approval_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `related` varchar(255) NOT NULL,
  `setting` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_approval_setting`
--

LOCK TABLES `tblwh_approval_setting` WRITE;
/*!40000 ALTER TABLE `tblwh_approval_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_approval_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_brand`
--

DROP TABLE IF EXISTS `tblwh_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_brand`
--

LOCK TABLES `tblwh_brand` WRITE;
/*!40000 ALTER TABLE `tblwh_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_custom_fields`
--

DROP TABLE IF EXISTS `tblwh_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_custom_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `custom_fields_id` int(11) DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_custom_fields`
--

LOCK TABLES `tblwh_custom_fields` WRITE;
/*!40000 ALTER TABLE `tblwh_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_goods_delivery_activity_log`
--

DROP TABLE IF EXISTS `tblwh_goods_delivery_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_goods_delivery_activity_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(100) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `additional_data` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_goods_delivery_activity_log`
--

LOCK TABLES `tblwh_goods_delivery_activity_log` WRITE;
/*!40000 ALTER TABLE `tblwh_goods_delivery_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_goods_delivery_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_loss_adjustment`
--

DROP TABLE IF EXISTS `tblwh_loss_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_loss_adjustment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) DEFAULT NULL,
  `addfrom` int(11) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `date_create` date NOT NULL,
  `status` int(11) NOT NULL,
  `warehouses` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_loss_adjustment`
--

LOCK TABLES `tblwh_loss_adjustment` WRITE;
/*!40000 ALTER TABLE `tblwh_loss_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_loss_adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_loss_adjustment_detail`
--

DROP TABLE IF EXISTS `tblwh_loss_adjustment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_loss_adjustment_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `items` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `current_number` int(15) DEFAULT NULL,
  `updates_number` int(15) DEFAULT NULL,
  `loss_adjustment` int(11) DEFAULT NULL,
  `expiry_date` text DEFAULT NULL,
  `lot_number` text DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_loss_adjustment_detail`
--

LOCK TABLES `tblwh_loss_adjustment_detail` WRITE;
/*!40000 ALTER TABLE `tblwh_loss_adjustment_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_loss_adjustment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_model`
--

DROP TABLE IF EXISTS `tblwh_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_model`
--

LOCK TABLES `tblwh_model` WRITE;
/*!40000 ALTER TABLE `tblwh_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_omni_shipments`
--

DROP TABLE IF EXISTS `tblwh_omni_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_omni_shipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `shipment_number` varchar(100) DEFAULT NULL,
  `planned_shipping_date` datetime DEFAULT NULL,
  `shipment_status` varchar(50) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_omni_shipments`
--

LOCK TABLES `tblwh_omni_shipments` WRITE;
/*!40000 ALTER TABLE `tblwh_omni_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_omni_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_packing_list_details`
--

DROP TABLE IF EXISTS `tblwh_packing_list_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_packing_list_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packing_list_id` int(11) NOT NULL,
  `delivery_detail_id` int(11) DEFAULT NULL,
  `commodity_code` int(11) DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  `quantity` decimal(15,2) DEFAULT 0.00,
  `unit_id` int(11) DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT 0.00,
  `sub_total` decimal(15,2) DEFAULT 0.00,
  `tax_id` text DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT 0.00,
  `discount` decimal(11,0) DEFAULT 0,
  `discount_total` decimal(11,0) DEFAULT 0,
  `total_after_discount` decimal(11,0) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_packing_list_details`
--

LOCK TABLES `tblwh_packing_list_details` WRITE;
/*!40000 ALTER TABLE `tblwh_packing_list_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_packing_list_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_packing_lists`
--

DROP TABLE IF EXISTS `tblwh_packing_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_packing_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_note_id` int(11) DEFAULT NULL,
  `packing_list_number` varchar(100) DEFAULT NULL,
  `packing_list_name` varchar(200) DEFAULT NULL,
  `width` decimal(15,2) DEFAULT 0.00,
  `height` decimal(15,2) DEFAULT 0.00,
  `lenght` decimal(15,2) DEFAULT 0.00,
  `weight` decimal(15,2) DEFAULT 0.00,
  `volume` decimal(15,2) DEFAULT 0.00,
  `clientid` int(11) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT 0.00,
  `total_amount` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(11,0) DEFAULT 0,
  `additional_discount` decimal(11,0) DEFAULT 0,
  `total_after_discount` decimal(11,0) DEFAULT 0,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `client_note` text DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `approval` int(11) DEFAULT 0,
  `datecreated` datetime DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `type_of_packing_list` varchar(100) DEFAULT 'total',
  `delivery_status` varchar(100) DEFAULT 'wh_ready_to_deliver',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_packing_lists`
--

LOCK TABLES `tblwh_packing_lists` WRITE;
/*!40000 ALTER TABLE `tblwh_packing_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_packing_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_series`
--

DROP TABLE IF EXISTS `tblwh_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_series` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_series`
--

LOCK TABLES `tblwh_series` WRITE;
/*!40000 ALTER TABLE `tblwh_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwh_sub_group`
--

DROP TABLE IF EXISTS `tblwh_sub_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwh_sub_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_group_code` varchar(100) DEFAULT NULL,
  `sub_group_name` text DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwh_sub_group`
--

LOCK TABLES `tblwh_sub_group` WRITE;
/*!40000 ALTER TABLE `tblwh_sub_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwh_sub_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwoocommere_store`
--

DROP TABLE IF EXISTS `tblwoocommere_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwoocommere_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(350) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwoocommere_store`
--

LOCK TABLES `tblwoocommere_store` WRITE;
/*!40000 ALTER TABLE `tblwoocommere_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwoocommere_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwoocommere_store_detailt`
--

DROP TABLE IF EXISTS `tblwoocommere_store_detailt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwoocommere_store_detailt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `woocommere_store_id` int(11) NOT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwoocommere_store_detailt`
--

LOCK TABLES `tblwoocommere_store_detailt` WRITE;
/*!40000 ALTER TABLE `tblwoocommere_store_detailt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwoocommere_store_detailt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwork_shift`
--

DROP TABLE IF EXISTS `tblwork_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwork_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_code` varchar(45) NOT NULL,
  `shift_name` varchar(200) NOT NULL,
  `shift_type` varchar(200) NOT NULL,
  `department` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0,
  `add_from` int(11) NOT NULL,
  `date_create` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `shifts_detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwork_shift`
--

LOCK TABLES `tblwork_shift` WRITE;
/*!40000 ALTER TABLE `tblwork_shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwork_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblworkplace`
--

DROP TABLE IF EXISTS `tblworkplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblworkplace` (
  `workplace_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workplace_name` varchar(200) NOT NULL,
  PRIMARY KEY (`workplace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblworkplace`
--

LOCK TABLES `tblworkplace` WRITE;
/*!40000 ALTER TABLE `tblworkplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblworkplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cierram'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-20 15:45:03

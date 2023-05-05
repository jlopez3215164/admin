SET
    sql_mode = '';

ALTER TABLE
    tblgoods_transaction_detail
ADD
    COLUMN consolidate TEXT;
SET
    sql_mode = '';

ALTER TABLE
    tblitems
ADD
    COLUMN price_sale NUMERIC(18, 4);
SET
    sql_mode = '';

ALTER TABLE
    tblitems
ADD
    COLUMN date_price DATETIME;

ALTER TABLE
    tblitems
ADD
    COLUMN total_sale_inventory NUMERIC(18,4);

ALTER TABLE
    tblitems
ADD
    COLUMN total_sale_price NUMERIC(18,4);

    -- orion_zeus.tbl_orion_pos_products definition

CREATE TABLE `tbl_orion_pos_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned DEFAULT NULL,
  `pos_id` bigint unsigned DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `orion_pos_id` bigint unsigned DEFAULT NULL,
  `pos_id_variant` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- orion_zeus.tbl_orion_pos definition

CREATE TABLE `tbl_orion_pos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_general_ci,
  `ip` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `port` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `database` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_database` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password_database` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `deposit_id` int DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- orion_zeus.tbl_orion_pos_detail_sale definition

CREATE TABLE `tbl_orion_pos_detail_sale` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` bigint unsigned DEFAULT NULL,
  `quantity` decimal(18,4) DEFAULT NULL,
  `price` decimal(18,4) DEFAULT NULL,
  `cost` decimal(18,4) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `orion_pos_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE tbl_orion_pos_products ADD price_from_pos int NULL;

ALTER TABLE tbl_orion_pos_products ADD last_sync datetime NULL;

ALTER TABLE tblcurrencies ADD tasa decimal(18,4) NULL;

ALTER TABLE tblcurrencies ADD is_secondary_currency bigint NULL;
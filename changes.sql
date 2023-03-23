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

    -- orion_zeus.tbl_orion_pos_products definition

CREATE TABLE `tbl_orion_pos_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned DEFAULT NULL,
  `pos_id` bigint unsigned DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- orion_zeus.tbl_orion_pos_detail_sale definition

CREATE TABLE `tbl_orion_pos_detail_sale` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` bigint unsigned DEFAULT NULL,
  `quantity` decimal(18,4) DEFAULT NULL,
  `price` decimal(18,4) DEFAULT NULL,
  `cost` decimal(18,4) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
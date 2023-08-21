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

ALTER TABLE tblinvoices ADD is_print_fiscal bigint NULL;

ALTER TABLE tblinvoices ADD bill_number varchar(100) NULL;

-- orion_ares_gona_osneida.journal definition

CREATE TABLE `journal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT CURRENT_TIMESTAMP,
  `end` datetime DEFAULT NULL,
  `active` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_print_report` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- orion_ares_gona.tbl_cashregister definition

CREATE TABLE `tbl_cashregister` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `counter_no` int NOT NULL,
  `opening_balance` decimal(19,3) NOT NULL DEFAULT '0.000',
  `closing_balance` decimal(19,3) NOT NULL DEFAULT '0.000',
  `openclosedate` date NOT NULL,
  `opendate` datetime DEFAULT '1970-01-01 01:01:01',
  `closedate` datetime DEFAULT '1970-01-01 01:01:01',
  `status` int NOT NULL DEFAULT '0',
  `openingnote` text,
  `closing_note` text,
  `is_print_report` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE orion_zeus.tbl_orion_zeus (
	id int NULL,
	name text NULL,
	ip varchar(100) NULL,
	port varchar(100) NULL,
	`database` text NULL,
	user_database varchar(100) NULL,
	password_database varchar(100) NULL,
	status int NULL,
	last_sync datetime NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- orion_ares_gona.system_param definition

CREATE TABLE `system_param` (
  `id` int unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




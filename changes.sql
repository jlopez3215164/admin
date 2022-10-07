SET
    sql_mode = '';

ALTER TABLE
    tblgoods_transaction_detail
ADD
    COLUMN consolidate INT
SET
    sql_mode = '';

ALTER TABLE
    tblitems
ADD
    COLUMN price_sale NUMERIC(18, 4)
SET
    sql_mode = '';

ALTER TABLE
    tblitems
ADD
    COLUMN date_price DATETIME
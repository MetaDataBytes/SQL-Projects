ALTER TABLE CUSTOMER DROP COLUMN CUSTOMER_ID
ALTER TABLE "ORDER" DROP COLUMN ORDER_ID
ALTER TABLE PRODUCT DROP COLUMN PRODUCT_ID
EXEC SP_RENAME "CUSTOMER.CUSTOMER_ID_INT", "CUSTOMER_ID", "COLUMN"
EXEC SP_RENAME "ORDER.ORDER_ID_INT", "ORDER_ID", "COLUMN"
EXEC SP_RENAME "PRODUCT.PRODUCT_ID_INT", "PRODUCT_ID", "COLUMN"
CREATE NONCLUSTERED INDEX IDX_COUNTRY_ID ON CITY(COUNTRY_ID)
CREATE NONCLUSTERED INDEX IDX_CITY_ID ON POSTAL_CODE(CITY_ID)
CREATE NONCLUSTERED INDEX IDX_POSTAL_CODE_ID ON CUSTOMER(POSTAL_CODE_ID)
CREATE NONCLUSTERED INDEX IDX_ORDER_DATE_ID ON "ORDER"(ORDER_DATE_ID)
CREATE NONCLUSTERED INDEX IDX_CUSTOMER_ID ON "ORDER"(CUSTOMER_ID)
CREATE NONCLUSTERED INDEX IDX_ORDER_ID ON ORDER_LINE(ORDER_ID)
CREATE NONCLUSTERED INDEX IDX_PRODUCT_ID ON ORDER_LINE(PRODUCT_ID)
CREATE NONCLUSTERED INDEX IDX_COFFEE_TYPE_ID ON PRODUCT(COFFEE_TYPE_ID)
CREATE NONCLUSTERED INDEX IDX_ROAST_TYPE_ID ON PRODUCT(ROAST_TYPE_ID)
DROP TABLE STAGING_TABLE
CREATE TABLE "ORDER"(
	ORDER_ID_INT INT IDENTITY(0, 1) PRIMARY KEY,
	ORDER_ID VARCHAR(50) NOT NULL,
	ORDER_DATE_ID INT NOT NULL FOREIGN KEY REFERENCES ORDER_DATE(ORDER_DATE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CUSTOMER_ID INT NOT NULL FOREIGN KEY REFERENCES CUSTOMER(CUSTOMER_ID_INT) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO "ORDER"
SELECT DISTINCT 
	UPPER(TRIM(ORDER_ID)) AS ORDER_ID,
	ORDER_DATE_ID,
	CUSTOMER_ID_INT
FROM STAGING_TABLE A
INNER JOIN CUSTOMER B ON A.CUSTOMER_ID = B.CUSTOMER_ID
INNER JOIN ORDER_DATE C ON A.ORDER_DATE = C.ORDER_DATE
ORDER BY C.ORDER_DATE_ID, CUSTOMER_ID_INT
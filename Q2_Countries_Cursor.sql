-- Q2: Create Table
CREATE TABLE countries (
    country_name VARCHAR2(50),
    median_age   NUMBER(6, 2)
);

-- Q2: Insert Records
INSERT INTO countries VALUES ('Japan',          48.7);
INSERT INTO countries VALUES ('Germany',        45.7);
INSERT INTO countries VALUES ('United States',  38.5);
INSERT INTO countries VALUES ('Brazil',         33.2);
INSERT INTO countries VALUES ('India',          28.4);
INSERT INTO countries VALUES ('Nigeria',        18.1);
INSERT INTO countries VALUES ('Canada',         41.8);

COMMIT;

-- Q2: Using %TYPE Attribute (Implicit Cursor)
DECLARE
    v_country_name  countries.country_name%TYPE;
    v_median_age    countries.median_age%TYPE;
BEGIN
    SELECT country_name, median_age
    INTO   v_country_name, v_median_age
    FROM   countries
    WHERE  country_name = 'Japan';
    DBMS_OUTPUT.PUT_LINE('The median age in ' || v_country_name || ' is ' || v_median_age || '.');
END;
/

-- Q2: Explicit Cursor
DECLARE
    CURSOR c_country IS
        SELECT country_name, median_age
        FROM   countries
        WHERE  country_name = 'Japan';
    v_country_name  countries.country_name%TYPE;
    v_median_age    countries.median_age%TYPE;
BEGIN
    OPEN c_country;
    FETCH c_country INTO v_country_name, v_median_age;
    IF c_country%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The median age in ' || v_country_name || ' is ' || v_median_age || '.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Country not found.');
    END IF;
    CLOSE c_country;
END;
/

-- Q1: Parts 1 and 2
DECLARE
    today     DATE := SYSDATE;
    tomorrow  today%TYPE;
BEGIN
    tomorrow := today + 1;
    DBMS_OUTPUT.PUT_LINE('Hello World');
    DBMS_OUTPUT.PUT_LINE('Today    : ' || TO_CHAR(today,    'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Tomorrow : ' || TO_CHAR(tomorrow, 'DD-MON-YYYY'));
END;
/

-- Q1: Part 3
DECLARE
    my_date    DATE := SYSDATE;
    v_last_day DATE;
BEGIN
    v_last_day := LAST_DAY(my_date);
    DBMS_OUTPUT.PUT_LINE('Today    : ' || TO_CHAR(my_date,    'Month dd, yyyy'));
    DBMS_OUTPUT.PUT_LINE('Last Day : ' || TO_CHAR(v_last_day, 'Month dd, yyyy'));
END;
/

-- Q1: Part 4
DECLARE
    my_date       DATE := SYSDATE;
    v_last_day    DATE;
    v_future_date DATE;
    v_months_diff NUMBER;
BEGIN
    v_last_day    := LAST_DAY(my_date);
    v_future_date := my_date + 45;
    v_months_diff := MONTHS_BETWEEN(v_future_date, my_date);
    DBMS_OUTPUT.PUT_LINE('Today       : ' || TO_CHAR(my_date,       'Month dd, yyyy'));
    DBMS_OUTPUT.PUT_LINE('Last Day    : ' || TO_CHAR(v_last_day,    'Month dd, yyyy'));
    DBMS_OUTPUT.PUT_LINE('Future Date : ' || TO_CHAR(v_future_date, 'Month dd, yyyy'));
    DBMS_OUTPUT.PUT_LINE('Months Diff : ' || ROUND(v_months_diff, 2));
END;
/

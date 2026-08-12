-- ============================================================
-- SMARTBANK - 13_FUNCTIONS.SQL
-- ============================================================

DELIMITER //

-- 1. Calculate Loan Interest
CREATE FUNCTION CalculateLoanInterest(
    p_amount DECIMAL(12,2),
    p_rate DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    RETURN (p_amount * p_rate) / 100;

END //

DELIMITER ;


-- Test
SELECT CalculateLoanInterest(300000, 8.5)
AS Interest_Amount;


-- ============================================================
-- 2. Calculate Financial Goal Progress
-- ============================================================

DELIMITER //

CREATE FUNCTION GoalProgress(
    p_target DECIMAL(12,2),
    p_saved DECIMAL(12,2)
)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN

    IF p_target <= 0 THEN
        RETURN 0;
    END IF;

    RETURN (p_saved / p_target) * 100;

END //

DELIMITER ;


-- Test
SELECT GoalProgress(100000, 60000)
AS Progress_Percentage;


-- ============================================================
-- 3. Calculate Remaining Goal Amount
-- ============================================================

DELIMITER //

CREATE FUNCTION RemainingGoalAmount(
    p_target DECIMAL(12,2),
    p_saved DECIMAL(12,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    IF p_target <= p_saved THEN
        RETURN 0;
    END IF;

    RETURN p_target - p_saved;

END //

DELIMITER ;


-- Test
SELECT RemainingGoalAmount(100000, 60000)
AS Remaining_Amount;


-- ============================================================
-- 4. Calculate Loan EMI
-- ============================================================

DELIMITER //

CREATE FUNCTION CalculateEMI(
    p_principal DECIMAL(12,2),
    p_annual_rate DECIMAL(5,2),
    p_months INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    DECLARE monthly_rate DECIMAL(10,8);
    DECLARE emi DECIMAL(12,2);

    SET monthly_rate = (p_annual_rate / 100) / 12;

    IF monthly_rate = 0 THEN
        SET emi = p_principal / p_months;
    ELSE
        SET emi =
        p_principal *
        monthly_rate *
        POW(1 + monthly_rate, p_months)
        /
        (POW(1 + monthly_rate, p_months) - 1);
    END IF;

    RETURN emi;

END //

DELIMITER ;


-- Test
SELECT CalculateEMI(300000, 8.5, 60)
AS Monthly_EMI;


-- ============================================================
-- 5. Get Account Category
-- ============================================================

DELIMITER //

CREATE FUNCTION AccountCategory(
    p_balance DECIMAL(12,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    IF p_balance >= 100000 THEN
        RETURN 'HIGH BALANCE';

    ELSEIF p_balance >= 50000 THEN
        RETURN 'MEDIUM BALANCE';

    ELSE
        RETURN 'LOW BALANCE';

    END IF;

END //

DELIMITER ;


-- Test
SELECT
    Account_Number,
    Balance,
    AccountCategory(Balance) AS Balance_Category
FROM Account;


-- ============================================================
-- END
-- ============================================================
# The MOD() function returns the remainder of a number divided by another number.
# Syntax
# MOD(x, y) / x MOD y / x % y
SELECT DISTINCT(CITY)
FROM STATION
WHERE MOD(ID, 2) = 0;
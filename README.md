# LeetCode SQL50 Solutions 🚀

I have completed **[LeetCode SQL50](https://leetcode.com/studyplan/top-sql-50/)** and pushed all the solved solutions per section on GitHub.

## **New Topics / Syntax / Learnings** 📚

### **1️⃣ IFNULL() Function**
The `IFNULL()` function returns a specified value if the expression is `NULL`.   The `IFNULL()` function returns a specified value if the expression is `NULL`. `IFNULL(expression, alt_value)` `expression`(Required)- The expression to test whether is `NULL` `alt_value`(Required)- The value to return if the expression is NULL

#### **🔹 Syntax:**
```sql
SELECT IFNULL(( -- Subquery here ), NULL) AS num;

REGEX
[a-zA-Z]: matches any upper or lower case letter.
\\-> In regex, . matches any character unless escaped escapes the . with \\.
^-> starts with
*-> Match zero or more of the preceding element.
[a-zA-Z0-9._-]*: matches zero or more occurrences of any upper or lower case letter, digit, underscore, period, or dash.

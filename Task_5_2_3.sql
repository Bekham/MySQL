DROP TABLE IF EXISTS nums;
CREATE TABLE nums (
  num int
);
INSERT INTO nums (num) VALUES
  (1),
  (2),
  (3),
  (4),
  (5);
  
 SELECT exp(SUM(log(num))) as total FROM nums;
-- ============================================
-- Bank Customer Churn Analysis — SQL Queries
-- Database: churn.db (tabel: customers)
-- ============================================

-- Query 1: Churn rate per negara
SELECT country,
       COUNT(*) AS total_nasabah,
       SUM(churn) AS jumlah_churn,
       ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_persen
FROM customers
GROUP BY country
ORDER BY churn_rate_persen DESC;
-- Hasil: Germany 32.44% | Spain 16.67% | France 16.15%

-- Query 2: Segmentasi usia (CASE WHEN)
SELECT
  CASE
    WHEN age < 30 THEN 'Muda'
    WHEN age <= 50 THEN 'Dewasa'
    ELSE 'Senior'
  END AS kategori_usia,
  COUNT(*) AS total,
  ROUND(AVG(churn) * 100, 2) AS churn_rate_persen
FROM customers
GROUP BY kategori_usia
ORDER BY churn_rate_persen DESC;
-- Hasil: Senior 44.65% | Dewasa 19.02% | Muda 7.56%

-- Query 3: Nasabah tidak aktif dengan saldo besar (kandidat retensi prioritas)
SELECT customer_id, country, balance, credit_score, churn
FROM customers
WHERE active_member = 0
  AND balance > (SELECT AVG(balance) FROM customers)
ORDER BY balance DESC
LIMIT 20;
-- 20 nasabah teratas, beberapa sudah churn (churn=1) meski bersaldo >200rb

-- Query 4: Churn rate silang gender x negara
SELECT country, gender,
       COUNT(*) AS total,
       ROUND(AVG(churn) * 100, 2) AS churn_rate_persen
FROM customers
GROUP BY country, gender
ORDER BY country, churn_rate_persen DESC;
-- Germany Female tertinggi: 37.55%

-- Query 5: Subquery — nasabah credit_score di bawah rata-rata yang churn
SELECT COUNT(*) AS jumlah_nasabah_berisiko
FROM customers
WHERE credit_score < (SELECT AVG(credit_score) FROM customers)
  AND churn = 1;
-- Hasil: 1057 nasabah

-- Query 6: Balance = 0 vs churn
SELECT
  CASE WHEN balance = 0 THEN 'Tanpa Saldo' ELSE 'Ada Saldo' END AS status_saldo,
  COUNT(*) AS total,
  ROUND(AVG(churn) * 100, 2) AS churn_rate_persen
FROM customers
GROUP BY status_saldo;
-- Hasil: Ada Saldo 24.08% | Tanpa Saldo 13.82% (berlawanan dengan dugaan awal)

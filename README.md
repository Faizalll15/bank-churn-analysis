# Bank Customer Churn Analysis & Prediction

## Dataset
10.000 data nasabah bank (France, Germany, Spain) dengan churn rate keseluruhan **20,37%**. Data bersih (0 missing value, 0 duplikat). Sumber: Kaggle.

## Tools
Excel (Power Query, formula pivot SUMIFS/COUNTIF, chart), SQL (SQLite), Python (Pandas, Scikit-learn)

## Alur Kerja
1. Validasi & persiapan data (data sudah bersih fokus pada kategorisasi kolom: `status_saldo`, `kategori_usia`, `segmen_produk`)
2. Eksplorasi cepat via tabel ringkasan/pivot (6 tabel: negara, gender, usia, produk, saldo, status aktif)
3. Analisis mendalam via SQL (6 query: `GROUP BY`, `CASE WHEN`, subquery, agregasi silang)
4. Dashboard interaktif via Excel (4 chart + 4 KPI card)
5. Model prediksi churn via Python (Logistic Regression & Random Forest)

## Temuan Utama
- Nasabah dengan **3+ produk** punya churn rate **85,9%** jauh di atas rata-rata, temuan paling signifikan di dataset ini.
- **Germany** mencatat churn rate tertinggi (**32,44%**), hampir 2x lipat France (16,15%) dan Spain (16,67%).
- Nasabah **tidak aktif** churn rate **26,85%** vs nasabah aktif **14,27%**.
- Nasabah **Senior (>50 th)** churn **44,65%**, jauh di atas kelompok usia lain.
- Nasabah tanpa saldo tercatat justru **lebih loyal** (churn 13,82%) dibanding yang punya saldo (24,08%) berlawanan dengan dugaan awal.

Detail lengkap di [`reports/insight_report.md`](reports/insight_report.md).

## Hasil Model
| Model | Accuracy | Precision (churn) | Recall (churn) | F1 (churn) |
|---|---|---|---|---|
| Logistic Regression | 80,6% | 0,596 | 0,145 | 0,233 |
| **Random Forest** | **86,4%** | **0,782** | **0,459** | **0,579** |

Fitur paling berpengaruh: `age`, `estimated_salary`, `credit_score`.

## Struktur Folder
```
churn_project/
├── data/
│   ├── Bank_Customer_Churn_Prediction.csv   # data mentah
│   └── Data_Bersih.csv                       # data setelah cleansing + kolom turunan
├── sql/
│   ├── queries.sql                           # 6 query beserta hasil (komentar)
│   └── churn.db                              # database SQLite
├── notebooks/
│   └── modeling.ipynb                        # Logistic Regression & Random Forest
├── dashboard/
│   └── Bank_Churn_Dashboard.xlsx             # Data_Bersih + 6 pivot + Dashboard (4 chart, 4 KPI)
├── reports/
│   └── insight_report.md                     # laporan insight bisnis lengkap
└── requirements.txt
```

## Cara Menjalankan
1. `pip install -r requirements.txt`
2. Jalankan `notebooks/modeling.ipynb` untuk melihat proses training & evaluasi model
3. Buka `dashboard/Bank_Churn_Dashboard.xlsx` untuk dashboard interaktif (tambahkan slicer manual via Insert > Slicer setelah membuat PivotTable native jika ingin filter interaktif penuh)
4. Query SQL ada di `sql/queries.sql`, bisa dijalankan langsung terhadap `sql/churn.db`

## Catatan
- Data sudah bersih sejak awal (0 missing value, 0 duplikat) tahap "cleansing" di project ini fokus pada penambahan kolom kategori (`status_saldo`, `kategori_usia`, `segmen_produk`) untuk mempermudah analisis, bukan pembersihan data kotor.
- Tabel pivot di Excel dibuat dengan formula `SUMIFS`/`COUNTIF` (bukan native PivotTable) agar otomatis update saat data berubah dan kompatibel lintas platform.

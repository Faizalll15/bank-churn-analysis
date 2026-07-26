# Laporan Insight: Analisis Churn Nasabah Bank

## Ringkasan Eksekutif
Analisis terhadap 10.000 data nasabah menunjukkan churn rate keseluruhan sebesar **20,37%**. Temuan utama menunjukkan bahwa jumlah produk yang dimiliki nasabah adalah sinyal churn paling kuat nasabah dengan 3+ produk punya churn rate 85,9%, jauh di atas rata-rata diikuti oleh usia (nasabah Senior) dan status keaktifan nasabah.

## Temuan Kunci

1. **Segmen produk adalah prediktor churn terkuat.** Nasabah dengan **produk tunggal** memiliki churn rate **27,71%**, nasabah dengan **dua produk** justru paling loyal (**7,58%**), tetapi nasabah dengan **tiga+ produk** memiliki churn rate ekstrem sebesar **85,89%** kemungkinan mengindikasikan pengalaman produk yang tumpang tindih/membingungkan atau nasabah yang sudah dalam proses keluar dari bank.

2. **Germany mencatat churn rate tertinggi sebesar 32,44%**, jauh di atas rata-rata keseluruhan (20,37%) dan hampir dua kali lipat France (16,15%) maupun Spain (16,67%) meski jumlah nasabah Germany paling sedikit (2.509 dari 10.000).

3. **Nasabah tidak aktif (active_member = 0) memiliki churn rate 26,85%**, lebih tinggi dibanding nasabah aktif (14,27%) selisih hampir 2x lipat, mengonfirmasi keaktifan sebagai sinyal retensi yang kuat.

4. **Usia sangat berkorelasi dengan churn**: nasabah **Senior (>50 tahun)** churn **44,65%**, jauh di atas **Dewasa (30-50)** di **19,02%** dan **Muda (<30)** hanya **7,56%**.

5. Dari 3.617 nasabah tanpa saldo tercatat (36,17% dari total), **13,82%** di antaranya churn **lebih rendah** dibanding nasabah yang punya saldo (24,08%). Ini berlawanan dengan intuisi awal: nasabah tanpa saldo justru cenderung lebih loyal, kemungkinan karena mereka pengguna produk lain (kartu kredit, pinjaman) yang tidak bergantung pada saldo tabungan.

6. **Interaksi gender x negara**: churn tertinggi ada pada kombinasi **Germany-Female (37,55%)**, sementara churn terendah pada **France-Male (12,71%)**.

7. Sebanyak **1.057 nasabah** memiliki credit score di bawah rata-rata dan sudah churn kandidat untuk dianalisis lebih lanjut terkait kualitas layanan atau penawaran produk yang mereka terima.

## Rekomendasi

1. **Investigasi mendalam segmen 3+ produk** churn 85,9% adalah anomali serius. Perlu wawancara/survei ke nasabah ini untuk memahami apakah produk yang ditawarkan tumpang tindih, biaya administrasi terlalu tinggi, atau ada masalah layanan spesifik.
2. **Prioritaskan program retensi di Germany**, khususnya segmen Female (37,55%) pertimbangkan riset kualitatif untuk memahami mengapa churn di negara ini jauh lebih tinggi dibanding France dan Spain meski basis nasabahnya lebih kecil.
3. **Fokuskan kampanye reaktivasi pada nasabah tidak aktif** (4.849 orang, churn rate 26,85%) misalnya lewat notifikasi penggunaan produk, cashback transaksi pertama setelah dormant, atau program loyalitas.
4. **Rancang program retensi khusus nasabah Senior (>50 tahun)** churn rate 44,65% menunjukkan kebutuhan produk/layanan yang mungkin belum terpenuhi (misalnya produk pensiun, layanan prioritas, atau customer service yang lebih personal).
5. **Bundling produk kedua untuk nasabah produk tunggal** mendorong nasabah dari 1 ke 2 produk berpotensi menurunkan churn dari 27,71% menuju level nasabah dua produk (7,58%), asalkan proses bundling tidak berlanjut ke over-selling (3+ produk).

## Model Prediksi
Model Random Forest berhasil mendeteksi nasabah berisiko churn dengan **Recall 45,9%** dan **F1-score 0,579** pada kelas churn jauh lebih baik dibanding Logistic Regression (Recall 14,5%, F1 0,233). Tiga fitur paling berpengaruh: **age** (24,0%), **estimated_salary** (14,7%), dan **credit_score** (14,4%), diikuti **balance** (14,1%) dan **products_number** (12,9%). Detail lengkap ada di `notebooks/modeling.ipynb`.

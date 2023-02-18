# Temel SQL Notlar2

## Genel Bilgiler
> * Bu bölümde tablolar ile nasıl çalışılır, tablo nasıl oluşturulur gibi konularda notlar alıp daha açıklayıcı bir şekilde görsellerle destekleyerek yazımı hazırlayacağım. 
> * Anlatımın takip ettiği video ve yazı kaynağı [Patika SQL](https://app.patika.dev/courses/sql) kursudur.
> * Anlatım boyunca kullanılan dvdrental veri setinin [indirme linki](https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip).
---
### Tablo Oluşturmak ve Silmek (CREATE - DROP)
- SQL ile yeni bir tablo oluşturmak için `CREATE` anahtar kelimesi kullanılır.
- **Syntax:**
    ``` SQL
    CREATE TABLE <tablo_adı> (
    <sütun_adı> <veri_tip> (kısıtlama_adı>,
    <sütun_adı> <veri_tip> (kısıtlama_adı>,
   ....);
   ```
- **Örnek Kullanım:**
    ``` SQL
    CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100)
  birthday DATE);
   ```

- **Tabloya Eleman Eklemek İçin:**
    ``` SQL
    INSERT INTO author (first_name, last_name, email, birtday)
    VALUES 
	('Sebahattin','Ali','sebahattin@ali.com','1850-10-25'),
	('İhsan','Anar','ihsanoktay@anar.com','1986-10-25'),
	('Mehmet','Duru','mehmet@duru.com','1965-10-25'),
	('Veli','Yildiz','veli@yildiz.com','1997-10-25')
   ```

- **Tablo Kopyalamak İçin:**
    ``` SQL
    CREATE TABLE author2 (LIKE author);--  
   ```

- **Bir Tablodan Başka Tabloya Veri Kopyalamak İçin:**
    ``` SQL
    INSERT INTO author2 SELECT *
    FROM author
    WHERE first_name = 'Veli'; -- author2 tablosuna author tabloundan first_name'i veli olan verinin bilgilerini kopyala demektir bu kod.
   ``` 

- **Tabloyu Verileri İle Birlikte Başka Bir Tabloya Kopyalamak İçin:**
    ``` SQL
    CREATE TABLE author3 AS
    SELECT * FROM author; -- author3 isimli tablo oluştur. Tabloyu author'a göre oluştur ve authorun verilerini al demektir bu kod.
   ```
- Tablo ismi yanlış girme veya girilen isimde tablo olamadığı durumlarda hata almamak için `IF EXISTS` anahtar kelimesini ekleyebiliriz.

- **Tablo Silmek İçin:**
    ``` SQL
    DROP TABLE IF EXISTS author3; --author3 tablosunu sileriz.
   ```
---

### Tablo Verilerini Güncellemek (UPDATE - DELETE)
- `UPDATE` anahtar kelimesi sayesinde tablomuzda bulunan verileri güncelleyebiliriz.
- **Syntax:**
    ``` SQL
    UPDATE <tablo_adı>
    SET <sütun_adı> = değer, 
    <sütun_adı> = değer,
    ----
    WHERE <koşul_adı>;
   ```
- **Örnek Kullanım:**
    ``` SQL
    UPDATE author
    SET first_name = 'Emrah Safa',
	    last_name = 'Gürkan',
	    email = 'emrah.safa@gurkan.com.tr',
	    birtday = '1985-04-23'
    WHERE id = 1;
    --RETURNING *; diyerek yaptığımız değişikliği görürüz.
   ```
![UPDATE](https://www.tutorialsteacher.com/Content/images/postgre/update-data2.png)

- `DELETE` anahtar kelimesi sayesinde tablomuzda bulunan verileri silebiliriz.
- **Syntax:**
    ``` SQL
    DELETE FROM <tablo_adı>
    WHERE <koşul_adı>;
   ```
- **Örnek Kullanım:**
    ``` SQL
   DELETE FROM my_apps
   WHERE name = 'Tresom';
   ```
![DELETE](https://static.javatpoint.com/postgre/images/postgresql-delete2.png)

---

### PRIMARY KEY - FOREIGN KEY

- **FOREIGN KEY**

    - Bir tabloda başka bir tabloya yapılan referansların kısıtlanmasını sağlar.
    - FOREIGN KEY kısıtı, bir tablonun belirli bir sütununun başka bir tablonun belirli bir sütununa atıfta bulunmasına izin verir.
    - Referans edilen sütunun değeri, kısıtlama tanımlandığında referans eden sütunun değeri ile aynı olmalıdır veya referans edilen sütunda NULL değer olmalıdır.
    - FOREIGN KEY kısıtlamaları, veritabanı bütünlüğünü korumak için önemlidir.

- **PRIMARY KEY**

    - Bir tablodaki verileri benzersiz şekilde tanımlar ve sıralama oluşturur.
    - PRIMARY KEY kısıtı, bir tablodaki belirli bir sütunu benzersiz bir şekilde tanımlar ve bu sütuna herhangi bir değerin yalnızca bir kez girilmesine izin verir.
    - PRIMARY KEY sütunu, bir tablodaki her satırda kullanılmalıdır.
    - PRIMARY KEY, bir tablonun verileri üzerinde hızlı bir şekilde arama yapılmasına izin verir.

![KEY](https://www.allthingssql.com/wp-content/uploads/2021/12/image-1.png)

```SQL
-- Senaryo: Bir blog uygulaması tasarlayalım. Yazarların ve yazıların bilgileri ayrı tablolarda saklanacaktır. Her yazıya yalnızca bir yazar atanabileceğinden, PRIMARY KEY kısıtı kullanabiliriz.

--#SQL KODU
CREATE TABLE authors ( -- YAZAR TABLOSU
  author_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE posts ( -- YAZI TABLOSU
  post_id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL REFERENCES authors (author_id)
);
--#Kod Açıklaması: Bu yapıda, authors tablosundaki author_id sütunu, yalnızca bir yazarın atanmasını sağlayacak şekilde PRIMARY KEY olarak tanımlanmıştır. posts tablosundaki author_id sütunu da, yalnızca authors tablosundaki geçerli bir author_id değeriyle eşleşebilir, bu sayede bir yazının, yazar tablosunda bulunmayan bir yazarla ilişkilendirilmesi engellenir.
```
---
### BIR TABLODA FOREIGN KEY SORGULAMA

- Bir tabloda `FOREIGN KEY`'lerin isimlerini sorgulamak için:

``` SQL
SELECT conname FROM pg_constraint WHERE conrelid = 'tablo_adi'::regclass AND contype = 'f';
```

---

### VERİ TİPLERİ

- Aşağıdaki resim ile veri yapılarını genel çerçevede görelim ardından en sık kullanılanları inceleyelim.
![SQLDATATYPE](https://i0.wp.com/www.yazilimkodlama.com/wp-content/uploads/2021/09/sql-veri-tipleri.png?fit=1024%2C768&ssl=1)

- En sık kullanılan veri tipleri;

    - `CHARACTER(n)`: Sabit uzunluklu karakter dizileri için kullanılır. n değeri, karakter dizisinin uzunluğunu belirtir.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        name CHARACTER(10) NOT NULL
        );
        ```

    - `VARCHAR(n)`: Değişken uzunluklu karakter dizileri için kullanılır. n değeri, en fazla karakter sayısını belirtir.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        name VARCHAR(50) NOT NULL
        );
        ```

    - `INTEGER`: Tamsayı değerler için kullanılır.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        age INTEGER NOT NULL
        );
        ```

    - `FLOAT(n)`: Ondalık sayılar için kullanılır. n, sayının toplam basamak sayısını belirtir.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        salary FLOAT(8) NOT NULL
        );
        ```

    - `NUMERIC(p, s)`: Hassas ondalık sayılar için kullanılır. p, toplam basamak sayısını belirtir ve s, ondalık basamak sayısını belirtir.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        price NUMERIC(10, 2) NOT NULL
        );
        ```

    - `DATE`: Tarih değerleri için kullanılır.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        start_date DATE NOT NULL
        );
        ```

    - `TIME`: Saat değerleri için kullanılır.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        start_time TIME NOT NULL
        );
        ```

    - `TIMESTAMP`: Tarih ve saat değerleri için kullanılır.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        );
        ```

    - `BOOLEAN`: Doğru veya yanlış değerlerini tutar.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        is_active BOOLEAN NOT NULL DEFAULT FALSE
        );
        ```

    - `BLOB`: Büyük verileri saklamak için kullanılır. Binary Large Object olarak adlandırılır.

        ```SQL
        CREATE TABLE example_table (
        id INTEGER PRIMARY KEY,
        image BLOB NOT NULL
        );
        ```
- Detaylı bir şekilde veri tiplerini incelemek için [buraya tıklayın.](https://www.postgresql.org/docs/current/datatype.html)

### ALTER ve NOT NULL

- Birçok durumda bizler herhangi bir sütuna yazılacak olan verilere belirli kısıtlamalar getirmek isteriz. Örneğin yaş sütünunda sadece sayısal verilerin olmasını isteriz ya da kullanıcı adı sütununda bilinmeyen (NULL) değerlerin olasını istemeyiz. Bu gibi durumlarda ilgili sütunda `CONSTRAINT` kısıtlama yapıları kullanılır.
- `NULL` bilinmeyen veri anlamındadır. Boş string veya 0 verilerinden farklıdır. Şu şekilde bir senaryo düşünelim bir kullanıcının email hesabı yoksa buradaki veriyi boş string şeklinde düşünebiliriz. Acak eğer kullanıcının maili var ancak ne olduğunu bilmiyorsak bu durumda o veri `NULL` (bilinmeyen) olarak tanımlanabilir.
- Employees şeklinde bir tablomuzu oluşturalım. Tablodaki first_name ve last_name sütunlarında bilinmeyen veri istemiyoruz, bu sütunlarda `NOT NULL` kısıtlama yapısı kullanabiliriz.

    ```SQL
    CREATE TABLE Employees (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        age INTEGER
    );
    ```

- `ALTER` anahtar kelimesini **varolan bir tabloda** değişiklik yapmak için kullanılır. Aşağıdaki senaryoda bir sütuna `NOT NULL` kısıtlaması vermek için aşağıdaki söz dizimi yapısı kullanılır.
    ```SQL
    ALTER TABLE <tablo_adı> 
    ALTER COLUMN <sütun_adı>
    SET NOT NULL;
    ```

### UNIQUE

- `UNIQUE` kısıtlaması ile uyguladığımız sütundaki verilerin birbirlerinden farklı benzersiz olmalarını isteriz. `PRIMARY KEY` kısıtlaması kendiliğinden `UNIQUE` kısıtlamasına sahiptir.

- `NOT NULL` kısıtlamasında olduğu gibi tablo oluştururken veya `ALTER` komutu ile beraber tablo oluştuktan sonra da kullanabiliriz.

- `UNIQUE` Kullanımı:
    ```SQL
    -- Employees şeklinde bir tablomuzu oluşturalım. Tablodaki email sütununda bulunan verileri UNIQUE olarak belirlemek istersek.
    CREATE TABLE Employees (
        ----
        emaile VARCHAR(100) UNIQUE,
        ----
    );
    ```
- `ALTER` ve `UNIQUE` Kullanımı:
    ```SQL
    -- Herhangi bir sütuna UNIQUE kısıtlaması getirirsek, öncesinde UNIQUE olmayan verileri kaldırmamız gerekir.

    ALTER TABLE <tablo_adı>
    ADD UNIQUE (<sütun_adı>)
    ```

### CHECK

- `CHECK` kısıtlaması ile uyguladığımız sütundaki verilere belirli koşullar verebiliriz. Örneğin age (yaş) olarak belirlediğimiz bir sütuna negatif değerler verebiliriz veya web portaline üye olan kullanıcıların yaşlarının 18 yaşından büyük olması gibi kendi senaryolarımıza uygun başka kıstlamalar da vermek isteyebiliriz.

- `CHECK` kısıtlamasını da tablo oluştururken veya `ALTER` komutu ile beraber tablo oluştuktan sonra kullanabiliriz.

- `CHECK` Kullanımı: 
    ```SQL
    -- Employees şeklinde bir tablomuzu oluşturalım. Tablodaki age sütununda bulunan verilerin 18'e eşit veya büyük olmasını istiyoruz.
    CREATE TABLE Employees (
        ----
        age INTEGER CHECK (age>=18)
        ----
    );
    ```
- `ALTER` ve `CHECK` Kullanımı:
    ```SQL
    ALTER TABLE <tablo_adı>
    ADD CHECK (age>=18)
    ```

- TABLO oluştururken `CHECK` kullanımı:

    ```SQL
    CREATE TABLE products (
        product_no integer,
        name text,
        price numeric CHECK (price > 0),
        discounted_price numeric CHECK (discounted_price > 0),
        CHECK (price > discounted_price)
    ); -- price(fiyat) 0 ' dan küçük olmaz, discounted_price(indirimli fiyat) da 0'dan küçük olamaz ve price(fiyat)'da discounted_price(indirimli fiyat)'dan küçük olmaz mantıken. Buna uygun tablo oluşturma.
    ```










# Temel SQL Notlar

## Genel Bilgiler
> * SQL anahtar kelimelerini büyük harfle yazmak okunurluluk ve yapı anlamında iyi olacaktır.
> * Noktalı-Virgül birden fazla SQL sorgusunu birbirinden ayırmamızı sağlar.
> * SQL declarative bir programlama dili. Önemli olan sonuçları almak.
> * Bir SQL sorgusu çalıştırılmadan önce neleri isteyeceğimizi neler yapacağımızı senaryosal düzeyde çok iyi kavramamız gerek.
> * Anlatımın takip ettiği video ve yazı kaynağı [Patika SQL](https://app.patika.dev/courses/sql) kursudur.
> * Anlatım boyunca kullanılan dvdrental veri setinin [indirme linki](https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip).
---
### SELECT
- **Syntax:** ` -- SELECT colomn1 FROM table1; -- Ornek Bir SQL SELECT sorgu yapısı.
`
- `SELECT` Anahtar kelimesini verileri sıralamak(Almak) için kullanıyoruz.
- `SELECT` Anahtar kelimesi en çok kullanılan anahtar kelimedir.
- `SELECT` Anahtar kelimesi diğer birçok Sql anahtar kelimesi ile birlikte kullanılır, daha komplex sorgular oluşturmak için.
---
### WHERE
- **Syntax:** ` -- SELECT * FROM table1 WHERE table1 = 15; -- Ornek Bir SQL WHERE sorgu yapısı.
`
- `WHERE` Anahtar kelimesi **SELECT** ile sıralıdığım veriler içinde filitre yapmamı sağlıyor.
- `WHERE` Anahtar kelimesi ile aslında bir koşul veriyoruz veya koşullar.
- `WHERE` Anahtar kelimesini kullanırken genelde yada tüm diğer yapılarda okunabilirlik için SELECT FROM'dan sonra satır atlanır.
    ```SQL
    SELECT * FROM film
    WHERE replacement_cost = 12.99;
    ```
- `WHERE` Anahtar kelimesini kullanırken genelde yada tüm diğer yapılarda SELECT FROM'dan sonra satır atlanır okunabilirlik için.
- `WHERE` Anahtar kelimesi ike sık kullanılan karşılaştırma operatörleri:
![Karşılaştırma Operatörleri](https://cdn.educba.com/academy/wp-content/uploads/2020/03/Comparison-Operators-in-SQL.png)
- `WHERE` Anahtar kelimesi ike sık kullanılan mantıksal operatörler:
![Matıksal Operatörler](https://images.slideplayer.com/12/3491691/slides/slide_2.jpg)
- `WHERE` Anahtar kelimesini kullanarak mantıksal ve karşılaştırma operatörlerini inceleyelim:
    ```SQL
    SELECT * FROM film
    WHERE replacement_cost = 12.99; -- replacement_cost 12.99'a eşit olanları getir.
    SELECT * FROM film
    WHERE replacement_cost = 12.99 and ID < 50; -- replacement_cost 12.99'a eşit ve ID 50'den küçük olanları getir.
    SELECT * FROM actor
    WHERE first_name = 'Penelope' or        
    first_name = 'Nick'; -- FirsName'i Penelope veya Nick olanları getir.
    SELECT * FROM film
    WHERE NOT(replacement_cost = 22.99 and   
    rental_rate != 4.99); -- replacement_cost'u 22.99 eşit olamayan ve rental_range'i 4.99 eşit olanları getir.(Not olduğu için tersi)
    ```
- `WHERE` Anahtar kelimesini kullanarak `BETWEEN` ve `IN` operatörlerini inceleyelim:
    - `BETWEEN` anahtar kelimesi ile temel olarak yaptığımız belirli aralıkta bulunan verileri sıralamak. Genelde `AND` mantıksal yapısı ile birlikte kullanılır.
    - `BETWEEN` anahtar kelimesini kullanırken şunu unutmamalıyız başlangıç ve bitiş için verdiğimiz değerlerde aramaya dahildir.
        ![BETWEEN](https://www.w3resource.com/w3r_images/sql-between-operator2.png)
    - `IN` anahtar kelimesi ile temel olarak istenilen eşitlik değerlerini liste halinde `IN` ile bulabiliriz.
    ![IN](https://www.w3resource.com/w3r_images/sql-in-operator2.png)
- `WHERE` Anahtar kelimesini kullanarak `LIKE` ve `ILIKE` operatörlerini inceleyelim:
    - `LIKE` anahtar kelimesi ile belirli şablonlara uyan koşulların uygulanmasını isteriz. Mesele `LIKE 'He%'` bu kod He ile başlayan verileri filitreleyecektir. Yüzde işareti ise sıfır, bir veya daha fazla karakteri temsil eder ve Wildcard olarak isimlendirilir. LIKE'dan sonra tırnak işareti içerisnde verdiğimiz yapı(case sensitive) bizim şablonlonumuz diye nitelendirebiliriz. Bu şablona uyan verileri alırız.
    -  `LIKE` anahtar kelimesi ile verdiğim filitrede '%' haricinde bir diğer wildcard karakteri _ karakteridir ve **bir karakteri** temsil eder. Örnek olarak `LIKE '_i%'` anlamı: birinci harfin herhangi bir harf olabileceğini belirttik. 2. harfimizin i harfi olduğunu söyledik. Bu şekilde belirli bir karaktere göre arama yapabilmekteyiz.
    ![LIKE](https://mehmetevirgen.files.wordpress.com/2015/04/33.jpg)
    - `ILIKE` anahtar kelimesi ise `LIKE` anahtar kelimesinden tek farkı büyük küçük harf duyarlılığı yoktur(not case  sensitive).
        ![ILIKE](https://internetzanatlija.com/wp-content/uploads/2021/09/ilike-operator-u-sqlu.png)
    - `LIKE` --> "`~~`" ile, `ILIKE` --> "`~~*`" sembolleri ilede gösterilebilir. Bu sembollerin başına "`!`" işaretide konulursa bu sefer `NOT` anlamı katar.

---

### DISTINCT ve COUNT

- `DISTINCT` ifadesi tablonun belli kolonlarında **tekrar eden verilerin bir adet** olacak şekilde çekilmesine olanak sağlar.

    ![DISTINCT](https://www.webhostuzmani.com/wp-content/uploads/2018/12/sqldistinckullnmi.jpg)

- `COUNT` fonksiyonu belirtilen alandaki veya tablodaki **toplam kayıt sayısını** verir. Burada dikkat edilmesi gereken alan üzerindeki kayıt sayıları alınırken boş verilerin dikkate alınmamasıdır. 

    ![COUNT](https://www.tasarimkodlama.com/wp-content/uploads/2021/12/image-36.png
)

```SQL
SELECT COUNT(DISTINCT(replacement_cost)) FROM film
WHERE length > 150; -- Uzunluğu 150'den büyük olan uniq replacement_cost değeri kaç tane olduğunu veren sorgu.
```

---

### ORDERBY

- `ORDER BY` anahtar kelimesi ile getirilen verileri bir veya daha fazla sütuna göre artan veya azalan olarak sıralamak için kullanılır.
    * Varsayılan olarak `ORDER BY`, verileri artan düzende sıralar.
    * Verileri azalan düzende sıralamak için `DESC` anahtar sözcüğünü ve artan düzende sıralamak için `ASC` anahtar sözcüğünü kullanabiliriz.
    * `ORDER BY` anahtar kelimesini koşullardan sonra yani `WHERE`'den sonra ekleriz.(Önce verileri belli koşullar altında seçmem gerekli daha sonra sıralama işlemi yaparım.)
 ``` SQL
 -- Syntax:
 SELECT * FROM table_name
 -- // WHERE 
 ORDER BY column_name ASC|DESC
 -- table_name: tablonun adı.
 -- column_name: verilerin düzenlenmesi gereken sütunun adı.
 -- ASC: verileri artan düzende sıralamak için.
 -- DESC: verileri azalan düzende sıralamak için.
 -- | : artan veya azalan düzende sıralamak için ASC veya DESC kullanın
 ```
![ORDERBY1]( https://cdn.educba.com/academy/wp-content/uploads/2019/09/ORDER-BY-Clause-in-SQL.png
)

![ORDERBY2]( https://www.oguzhantas.com/image/userfiles/images/ORDER_BY_Kullanimi1.jpg
)

![ORDERBY3]( https://www.jquery-az.com/wp-content/uploads/2018/03/4-2-SQL-order_by-DESC.png
)

---

### LIMIT ve OFFSET

- `LIMIT` anahtar kelimesi ile sorgudan döndürülen satır sayısını sınırlamak için kullanılır.
- `OFFSET` anahatar kelimesi ile veri döndürmeye nereden başlayacağımızı bildirmek için kullanırız.
```SQL
-- Examples and Syntax

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY first_name 
LIMIT 5 OFFSET 3;
```
![LIMITOFFSET]( https://www.sqltutorial.org/wp-content/uploads/2016/04/SQL-LIMIT-OFFSET-example.png
)

---

### Aggregate Fonksiyonlar - MIN, MAX, SUM, AVG

- Kullanacağımız bu fonksiyonlar ile aşağıdaki sorular ve bu sorulara benzer soruların cevabını bulmaya çalışağız.
    * Toplam kaç adet müşterimiz var?
    * Elimizde bulunan filmlerin ortalama uzunluğu nedir? 

- Gruplama fonksiyonları ve açıklamaları:
    ![AggregateFonksiyonlar1]( https://cdn-images-1.medium.com/max/800/1*hs9yOG9H1F_QlknNIkc7Bg.png
)
```SQL
-- Kullanım Örnekleri

SELECT AVG(length) 
FROM film; -- film tablosunda bulunan length sütunundaki değerlerin ortalamasını alırız.

SELECT ROUND(AVG(length),3) 
FROM film; -- film tablosunda bulunan length sütunundaki değerlerin ortalamasını alırız ve ROUND fonksiyonu ile virgülden sonra kaç karakter alacağını veririz. 

SELECT SUM(length) 
FROM film; --  film tablosunda bulunan length sütunundaki değerlerin toplamını alırız.

SELECT MAX(length) 
FROM film; --  film tablosunda bulunan length sütunundaki değerlerin en yüksek değerini alırız.

SELECT MIN(length) 
FROM film; -- film tablosunda bulunan length sütunundaki değerlerin en düşük değerini alırız.

SELECT ROUND(AVG(length),3), MAX(length), MIN(replacement_cost) 
FROM film; -- Birden fazla sütuna aynı anda Aggregate Fonksiyonlarını kullanabiliriz.

```

---

### GROUP BY

- SQL `GROUP BY` komutu verilerin belirli bir kriter ya da kriterler dahilinde gruplandırılmasını sağlar. Verilerin belirli bir özelliğine göre gruplandırılması sonucunda, gruplar üzerinde birçok çeşit istatistiksel işlem yapılabilir. Örneğin, belirli bir ürün grubunun toplam satış miktarının hesaplanması gibi.

- Bizler şimdiye kadar olan sorgularımızın tamamında sorguları yaparken genel veri kümesinin tamamı üzerine düşündük, ancak bazı durumlarda aynı sonuçları veri kümesinin içerisinde bulunan farklı gruplarda da bulmak isteyebiliriz. Bu noktada `GROUP BY` devreye girecektir. 

```SQL
SELECT column1, AVG(column2)
FROM table_name
GROUP BY column1; -- Bu sorguda, column1 özelliğine göre veriler gruplandırılmıştır ve her bir grubun column2 değerlerinin ortalaması hesaplanmıştır. Sonuç olarak, her bir column1 değeri için bir satır döndürülür ve o satırdaki SUM(column2) değeri, o column1 değerine ait tüm column2 değerlerinin ortalamasıdır.
```
![GROUPBY]( https://res.cloudinary.com/dyd911kmh/image/upload/f_auto,q_auto:best/v1548693187/2_nl7ylr.png
)

```SQL
-- Ornek Kullanım

SELECT rating, replacement_cost , ROUND(AVG(length),3)
FROM film
GROUP BY rating, replacement_cost
ORDER BY replacement_cost
LIMIT 10; -- rating ve replacement_cost değerlerinin uzunluk ortalamalırını getir. replacement_cost artan bir şekilde sırala ve limit 10 olsun. 
```

---

### HAVING

- `HAVING` anahtar kelimesi sayesinde gruplandırılmış verilere koşullar ekleyebiliriz. Hemen aklımıza `WHERE` anahtar kelimesi geldi değil mi? Ancak `WHERE` anahtar kelimesi ile biz satır bazlı koşullar verebiliyoruz.

- SQL `HAVING` komutu, `GROUP BY` komutundan sonra kullanılan bir filtreleme yöntemidir. `GROUP BY` komutu ile gruplanan verilerin belirli bir özelliğine göre filtrelenmesini sağlar. `HAVING` komutu, `GROUP BY` komutu sonrasında yapılan işlemlerin sonucunda oluşan grupların belirli bir koşula uyması durumunda, o grup verilerinin döndürülmesini sağlar. 

```SQL
SELECT column1, SUM(column2)
FROM table_name
GROUP BY column1
HAVING SUM(column2) > 100; -- Bu sorguda, column1 özelliğine göre veriler gruplandırılmış ve her bir grubun column2 değerlerinin toplamı hesaplanmıştır. Daha sonra, HAVING komutu ile sadece SUM(column2) değeri 100'den büyük olan grupların verilerinin döndürülmesi sağlanmıştır. Yani, sonuç olarak, sadece column1 özelliğine göre oluşan gruplardan column2 değerlerinin toplamı 100'den büyük olanların verileri döndürülecektir.
```
![HAVİNG]( https://www.w3resource.com/w3r_images/sql-having.png
)

```SQL
SELECT rating, replacement_cost , ROUND(AVG(length),3)
FROM film
GROUP BY rating, replacement_cost
HAVING rating IN('R','G','PG') and AVG(length) > 105
ORDER BY replacement_cost
LIMIT 10; -- rating ve replacement_cost değerlerinin uzunluk ortalamalırını getir. replacement_cost artan bir şekilde sırala ve limit 10 olsun. (HAVING ilede rating değeri 'R','G','PG' olanlar ve ortalama length 105'den büyük olanlarını seç demekteyiz.)
```

### ALIAS

- SQL `ALIAS` komutu, sütun ya da tablo isimlerinin geçici olarak değiştirilmesini sağlar. `ALIAS` kullanımı, veri okunması ve anlaşılması için daha anlamlı ve kolay hale getirmek amacıyla yapılabilir. Ayrıca, tekrar eden ya da uzun sütun veya tablo isimlerinin kısaltılması için de kullanılabilir.

```SQL
SELECT column1 AS short_col1, column2 AS short_col2
FROM table_name; --Bu sorguda, column1 ve column2 sütunları geçici olarak short_col1 ve short_col2 olarak değiştirilmiştir. Sonuç olarak, döndürülen verilerde short_col1 ve short_col2 isimleri görünecektir.
```

![ALIAS]( https://i.ytimg.com/vi/ngPeJ06f4-A/maxresdefault.jpg
)

```SQL
SELECT CONCAT(first_name, ' ' ,last_name) AS "Isim ve Soyisim" 
FROM actor -- Bu şekildede bir kullanımı vardır. İsim ve soyisim degerlerini CONCAT fonksiyonu ile birleştirdim ve AS ile yeni bir isim verdim.
```



        
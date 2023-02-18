# Temel SQL Notlar3

## Genel Bilgiler
> * Bu bölümde `JOIN` Kavramı (Birleştirme) üzerine çalışma yapacağız. 
> * Veritabanları çoğunlukla birbiri ile ilşkili olan tablolardan oluşur. Bu birbiri ile ilişkili olan tablardaki verileri farklı `JOIN` yapıları kullanarak **sanal olarak birleştirip** daha anlamlı veriler haline getirebiliriz.
> * Tablo1 = A = Tablo A = Table A (Tablo notasyonu)
> * Tablo 2 = B = Tablo B = Table B (Tablo notasyonu)
> * Anlatımın takip ettiği video ve yazı kaynağı [Patika SQL](https://app.patika.dev/courses/sql) kursudur.
> * Anlatım boyunca kullanılan dvdrental veri setinin [indirme linki](https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip).

- SQL'de `JOIN` yapılarına aşağıdaki resim ile genel bir bakış atalım.

![JOINGENEL](https://i.stack.imgur.com/VQ5XP.png)

---
### INNER JOIN
- `INNER JOIN` yapısı sayesinde birbiriyle ilişkili olan tabloların birbiriyle eşleşen (kesişen) verilerini sıralayabiliriz. Senaryomuzda kitapları gösterdiğimiz book tablosu ve yazarları gösterdiğimiz author tablosu var, author tablosunun id sütunuyla book tablosunun author_id sütunlarında bulunan veriler sayesinde her iki tabloya ait bilgilerden daha anlamlı sonuçları elde edebiliriz.
- **INNER JOIN Söz Dizimi:**
    ``` SQL
    SELECT <sütun_adı>, <sütun_adı> ...
    FROM <tablo1_adı>
    INNER JOIN <tablo2_adı>
    ON <tablo1_adı>.<sütun_adı> = <tablo2_adı>.<sütun_adı>;
   ```
- **Örnek Kullanım:**
    ``` SQL
    SELECT Orders.OrderID, Customers.CustomerName
    FROM Orders
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
   ```

- **Küme Gösterimi:**

![INNERJOIN1](https://www.sqltutorial.org/wp-content/uploads/2016/03/SQL-INNER-JOIN.png)

- **Tablolu Gösterim Örneği:**

![INNERJOIN2](https://lh4.googleusercontent.com/ZaF77tpvsDLgQgWHqOdbzJVPDJ2EAmp4OSSmbk0sSFe4TcsS3jtxY7EmyfMQ3ta6WIs7bg_ZvKsUZOHkXETHRltRXC5YNi4brzpchn4HBzq4dThms2jAyU9E2KohfEL7j0fOevT5PeMdOdKEJj24C1Y)

---

### LEFT JOIN

- `LEFT JOIN` yapısındaki tablo birleştirmesinde, birleştirme işlemi tablo 1 (soldaki tablo) üzerinden gerçekleştirilir. Senaryomuzu şu şekilde düşünelim eğer tablo 1 olarak book tablosunu aldığımızda öncelikle book tablosundaki ilgili sütundaki tüm verileri alacağız, sonrasında bu verilerin eşleştiği ilgili tablo 2 sütunundaki verileri alacağız. Tablo 1 de olup Tablo 2 de olmayan veriler için NULL değeri kullanılır.

- **LEFT JOIN Söz Dizimi:**
    ``` SQL
    SELECT <sütun_adı>, <sütun_adı> ...
    FROM <tablo1_adı>
    LEFT JOIN <tablo2_adı>
    ON <tablo1_adı>.<sütun_adı> = <tablo2_adı>.<sütun_adı>;
   ```
- **Örnek Kullanım:**
    ``` SQL
    SELECT book.title, author.first_name, author.last_name
    FROM book
    LEFT JOIN author
    ON author.id = book.author_id;
   ```

- **Küme Gösterimi:**

![LEFTJOIN](https://www.sqltutorial.org/wp-content/uploads/2016/03/SQL-LEFT-JOIN.png)

- **Tablolu Gösterim Örneği:**

![LEFTJOIN2](https://lh6.googleusercontent.com/I7BWNmU-rtwMozqKzbWBRgnk2sIv1a1FGElwOheS4ybu8o8erqvNR8Z57CsHndxMpdKlUq8jqaDqyUt7pR775-lSupnm_Cqe5nyncxH3eh0MTf3IA2cWz_8rnMWyDXFIrf-z_MM18zMVs_rQuiIigOw)

---

### RIGHT JOIN

- `RIGHT JOIN` yapısındaki tablo birleştirmesinde, birleştirme işlemi tablo 2 (sağdaki tablo) üzerinden gerçekleştirilir. Senaryomuzu şu şekilde düşünelim eğer tablo 2 olarak author tablosunu aldığımızda öncelikle author tablosundaki ilgili sütundaki tüm verileri alacağız, sonrasında bu verilerin eşleştiği ilgili tablo 1 sütunundaki verileri alacağız. Tablo 2 de olup Tablo 1 de olmayan veriler için NULL değeri kullanılır.

- **RIGHT JOIN Söz Dizimi:**
    ``` SQL
    SELECT <sütun_adı>, <sütun_adı> ...
    FROM <tablo1_adı>
    RIGHT JOIN <tablo2_adı>
    ON <tablo1_adı>.<sütun_adı> = <tablo2_adı>.<sütun_adı>;
   ```
- **Örnek Kullanım:**
    ``` SQL
    SELECT book.title, author.first_name, author.last_name
    FROM book
    RIGHT JOIN author
    ON author.id = book.author_id;
   ```

- **Küme Gösterimi:**

![RIGHTJOIN](https://www.codespot.org/assets/samples/sql-right-join.png)

- **Tablolu Gösterim Örneği:**

![RIGHTJOIN2](https://lh4.googleusercontent.com/klmC4Kg_LYE9Ic7TO7Yw8IBJMHAx9GBeBm2RU2w3lUM_-TtHUfqYOXgDzoQMCGFLmBVhSeaauM9gUhQUwbt9IZvW7zy1TwLGGONoq8Kn0rPeZmR4txw2LfBctj2TNCPAYUrxe3IgWudpI5FOZ8EWrX-yMa-aVR12tNLX9e_4ggagP1lYGwxA1w-B)

---

### FULL JOIN

- `FULL JOIN` yapısındaki tablo birleştirmesinde, birleştirme işlemi her iki tablo üzerinden gerçekleştirilir. Senaryomuzu şu şekilde düşünelim eğer tablo 1 olarak book tablosunu aldığımızda öncelikle book tablosundaki ilgili sütundaki tüm verileri alacağız, sonrasında tablo 2 deki ilgili sütunlardan tüm verileri alacağız. Tablo 1 de olup Tablo 2 de olmayan ve Tablo 2 de olup Tablo 1 de olmayan veriler için NULL değeri kullanılır.

- **FULL JOIN Söz Dizimi:**
    ``` SQL
    SELECT <sütun_adı>, <sütun_adı> ...
    FROM <tablo1_adı>
    FULL JOIN <tablo2_adı>
    ON <tablo1_adı>.<sütun_adı> = <tablo2_adı>.<sütun_adı>;
   ```
- **Örnek Kullanım:**
    ``` SQL
    SELECT book.title, author.first_name, author.last_name
    FROM book
    FULL JOIN author
    ON author.id = book.author_id;
   ```

- **Küme Gösterimi:**

![FULL JOIN](https://www.sqltutorial.org/wp-content/uploads/2016/07/SQL-FULL-OUTER-JOIN.png)

- **Tablolu Gösterim Örneği:**

![FULL JOIN2](https://learn.microsoft.com/en-us/power-query/media/merge-queries-full-outer/full-outer-join-operation.png)

---

### UNION

- `UNION` operatörü sayesinde farklı `SELECT` sorgularıyla oluşan sonuçları **tek bir sonuç kümesi** haline getiririz.

- `UNION` operatörü kullanılacağı sorguların, sütun sayıları eşit olmalıdır ve sütunlardaki veri tipleri eşleşmelidir(Integer - Integer veya VARCHAR - VARCHAR gibi.).

- **Söz dizimi:**
    ```SQL
    SELECT <sütun_adı>, <sütun_adı>...
    FROM <table1>
    UNION
    SELECT <sütun_adı>, <sütun_adı>...
    FROM <table2>
    ```
---

- **Örnek kullanım:**

    ```SQL
    -- bookstore veritabanında iki adet sorgu yapıyoruz. İlk sorgumuzda sayfa sayısı en fazla olan 5 kitabı, ikinci sorgumuzda ise isme göre 5 kitabı sıralıyoruz. UNION anahtar kelimesi sayesinde bu iki sorguyu da birleştirebiliriz.
    (
    SELECT * 
    FROM book
    ORDER BY title
    LIMIT 5
    )
    UNION
    (
    SELECT * 
    FROM book
    ORDER BY page_number DESC
    LIMIT 5
    ); 
    ```
- **`UNION ALL`**

- `UNION` operatörü sayesinde farklı `SELECT` sorgularıyla oluşan sonuçları **tek bir sonuç kümesi** haline getiririz. `UNION` operatörü bize birleşik veriler içerisindeki tekrar edenleri göstermez. **Tekrar edenleri** görmek için `UNION ALL` kullanırız.

    ![UNION](https://www.golinuxcloud.com/wp-content/uploads/sql_union-1.png)

---

### INTERSECT ve EXCEPT

- `INTERSECT` operatörü sayesinde farklı `SELECT` sorgularıyla oluşan sonuçların **kesişen verilerini** tek bir sonuç kümesi haline getiririz.

- **`INTERSECT` Söz Dizimi:**

    ```SQL
    SELECT <sütun_adı>, <sütun_adı>...
    FROM <table1>
    INTERSECT
    SELECT <sütun_adı>, <sütun_adı>...
    FROM <table2>
    ```

- **`INTERSECT` Kullanımı:**
    ```SQL
    -- bookstore veritabanında iki adet sorgu yapıyoruz. İlk sorgumuzda sayfa sayısı en fazla olan 5 kitabı, ikinci sorgumuzda ise isme göre 5 kitabı sıralıyoruz. INTERSECT anahtar kelimesi sayesinde bu iki sorgu sonucunda oluşan veri kümelerinden kesişen verileri tek bir sonuçta birleştiririz.
    (
    SELECT * 
    FROM book
    ORDER BY title
    LIMIT 5
    )
    INTERSECT
    (
    SELECT * 
    FROM book
    ORDER BY page_number DESC
    LIMIT 5
    );
    ```
- **`INTERSECT ALL`**

    - `INTERSECT` operatörü bize kesişen veriler içerisindeki tekrar edenleri göstermez. Tekrar edenleri görmek için `INTERSECT ALL` kullanırız.

- **`EXCEPT Kullanımı`**
    - bookstore veritabanında iki adet sorgu yapıyoruz. İlk sorgumuzda sayfa sayısı en fazla olan 5 kitabı, ikinci sorgumuzda ise isme göre 5 kitabı sıralıyoruz. `EXCEPT` anahtar kelimesi sayesinde ilk sorguda olup ancak ikinci sorguda olmayan verileri gösterir.

- **`EXCEPT ALL`**
    - `EXCEPT` operatörü bize ilk sorguda olan ancak ikinci sorguda olmayan veriler içerisindeki tekrar edenleri göstermez. Tekrar edenleri görmek için `EXCEPT ALL` kullanırız.



![INTERSET](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS_RdhZ6DP6crLPYxIRImFIvYCxy61g4pQag&usqp=CAU)

- Son gördüğümüz yapıların özet hali:

![INTERSET_UNION_EXCEPT](https://miro.medium.com/max/700/1*mpeBxvZT6W2fFt9hlql0cw.png)

### Alt Sorgular (Subqueries)

- Bir sorgu içerisinde, o sorgunun ihtiyaç duyduğu veri veya verileri getiren sorgulardır.

```SQL
--bookstore veritabanında "Gülün Adı" isimli kitabımızın sayfa sayısı 466 dır. Bu kitaptan daha fazla sayıda sayfası bulunan kitapları aşağıdaki sorgu yardımıyla sıralayabiliriz.

SELECT *
FROM book
WHERE page_number > 466;

-- Ancak yukarıdaki sorgumuzda şöyle bir sorun var. 466 ifade statik bir ifade ve biz bu değeri bilmiyor olabiliriz. Bu nedenle buradaki 466 rakamını aşağıdaki sorgu yardımıyla bulabiliriz.

SELECT page_number
FROM book
WHERE title = 'Gülün Adı'

-- İşte bu ikinci sorgumuz ilk sorgumuzda bir alt sorgu görevi görebilir. Her iki sorguyu da birleştirelim.

SELECT *
FROM book
WHERE page_number >
(
SELECT page_number
FROM book
WHERE title = 'Gülün Adı'
);
```

### ANY ve ALL Operatörleri

- `ANY` ve `ALL` operatörleri alt sorugularda sıklıkla kullanılır ve tek bir sütunda bulunan bir değerle bir değer dizisinin karşılaştırılmasını sağlar.

- **ANY Operatörü:**
    - Alt sorgudan gelen herhangi bir değer koşulu sağlaması durumunda TRUE olarak ilgili değerin koşu sağlamasını sağlar. bookstore veritabanında yapmış olduğumuz aşağıdaki sorguyu inceleyelim.

    ```SQL
    SELECT first_name, last_name
    FROM author
    WHERE id = ANY
    (
    SELECT id
    FROM book
    WHERE title = 'Abe Lincoln in Illinois' OR title = 'Saving Shiloh'
    )
    -- Yukarıda görmüş olduğunuz gibi alt sorgudan gelebilecek potansiyel iki id değeri var, bu id değerinin her ikisi de birbirinden bağımsız olarak ana sorgudaki id sütununda bulunan değerler ile eşleştiği için sorgu sonucunda oluşan sanal tabloda id değeri 4 ve 5 olan yazarlara ait first_name ve last_name değerlerini göreceğiz.
    ```

- **ALL Operatörü:**
    - Alt sorgudan gelen tüm değerlerin koşulu sağlaması durumunda TRUE olarak döner.

    ```SQL
    -- bookstore veritabanındaki yine aynı sorguyu inceleyelim.

    SELECT first_name, last_name
    FROM author
    WHERE id = ALL
    (
    SELECT id
    FROM book
    WHERE title = 'Abe Lincoln in Illinois' OR title = 'Saving Shiloh'
    )
    -- Burada ne söylemiştik alt sorgu tarafından 4 ve 5 id leri gelecek burada eştlik olduğu için aynı anda 4 ve 5 in bu şulu sağlaması olanaksız olduğu için herhangi bir değer dönülmeyecektir.
    ```
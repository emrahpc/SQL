 -- A) ALTER TABLE kullanımı
-- Bir tabloya yeni sütun ekleme
ALTER TABLE Books ADD COLUMN publisher VARCHAR(100);

-- Bir sütunu değiştirme
ALTER TABLE Books ALTER COLUMN "Publication Year" TYPE INT;

-- B) UPDATE, DELETE kullanımı
UPDATE Books SET bookname = 'Yeni Kitap' WHERE id = 1;

-- DELETE örneği: Belirli bir kitabı silme
DELETE FROM Books WHERE id = 5;

-- C) INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN farkları
SELECT B.bookname, C."Category_Name" FROM Books B INNER JOIN Category C ON B.categoryid = C.id;

-- LEFT JOIN örneği: Tüm kitapları ve varsa kategorilerini gösterme
SELECT B.bookname, C."Category_Name" FROM Books B LEFT JOIN Category C ON B.categoryid = C.id;

-- RIGHT JOIN örneği: Tüm kategorileri ve içlerinde bulunan kitapları gösterme
SELECT B.bookname, C."Category_Name" FROM Books B RIGHT JOIN Category C ON B.categoryid = C.id;

-- FULL JOIN örneği: Hem kitapları hem de kategorileri listeleme, eksik olanları da dahil etme
SELECT B.bookname, C."Category_Name" FROM Books B FULL JOIN Category C ON B.categoryid = C.id;

-- D) HAVING ve GROUP BY birlikte nasıl kullanılır?
SELECT C."Category_Name", COUNT(B.id) AS book_count
FROM Books B JOIN Category C ON B.categoryid = C.id
GROUP BY C."Category_Name"
HAVING COUNT(B.id) > 5;

-- E) LIMIT, OFFSET kullanarak sıralı veri çekme
SELECT * FROM Books ORDER BY "Publication Year" DESC LIMIT 5;

-- 5. kitaptan sonraki 5 kitabı getirme
SELECT * FROM Books ORDER BY "Publication Year" DESC LIMIT 5 OFFSET 5;

-- F) SUBQUERY örnekleri
-- En son yayınlanan kitabın bilgilerini getirme
SELECT * FROM Books WHERE "Publication Year" = (SELECT MAX("Publication Year") FROM Books);

-- G) AND / OR mantıksal operatörleri
SELECT * FROM Books WHERE "Publication Year" > 2020 AND categoryid = (SELECT id FROM Category WHERE "Category_Name" = 'Bilgisayar Bilimleri');

-- H) BETWEEN ile aralık filtrelemesi
-- 2020 ile 2023 yılları arasında yayımlanan kitapları getirme
SELECT * FROM Books WHERE "Publication Year" BETWEEN 2020 AND 2023;

-- I) IN ifadesiyle çoklu değer karşılaştırması
-- Belirli kategorilere ait kitapları getirme
SELECT * FROM Books WHERE categoryid IN (SELECT id FROM Category WHERE "Category_Name" IN ('Bilgisayar Bilimleri', 'Macera'));

-- J) LIKE operatörü kullanımı
-- İçinde 'SQL' geçen kitapları getirme
SELECT * FROM Books WHERE bookname LIKE '%İlan%';

-- 'A' harfi ile başlayan yazarları getirme
SELECT * FROM Author WHERE name LIKE 'A%';

-- Üç harfli yazar isimlerini getirme
SELECT * FROM Author WHERE name LIKE '_________';

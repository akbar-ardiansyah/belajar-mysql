
#Pengenalan Database Management System
#DBMS adalah aplikasi yang digunakan untuk me-manage data
#Tanpa menggunakan DBMS, untuk me-manage data, seperti data produk, data customer, data penjualan, kita harus simpan dalam bentuk file (misal seperti ketika menggunakan Excel)
#DBMS biasanya berjalan sebagai aplikasi server yang digunakan untuk me-manage data, kita hanya tinggal memberi perintah ke DBMS untuk melakukan proses manajemen datanya, seperti menambah, mengubah, menghapus atau mengambil data
#Contoh DBMS yang populer seperti MySQL, PostgreSQL, MongoDB, Oracle, dan lain-lain



#Pengenalan Relational Database
#Ada banyak sekali jenis-jenis DBMS, seperti Relational Database, Document Database, Key-Value Database, dan lain-lain
#Namun yang masih populer dan kebanyakan orang gunakan adalah relational database
#Relational database cukup mudah dimengerti dan dipelajari karena kita sudah terbiasa menyimpan data dalam bentuk tabular (tabel) seperti di Microsoft Excel atau di Google Doc Spreadsheet
#Selain itu relational database memiliki perintah standard menggunakan SQL, sehingga kita mudah ketika ingin berganti-ganti aplikasi database (seperti MySQL, Oracle, PostgreSQL dan lain-lain)

#Cara Kerja DBMS
Database Client =sql=> database manajemen sistem => data file

#Database Client
#Database client adalah aplikasi yang digunakan untuk berkomunikasi dengan DBMS
#Biasanya DBMS sudah menyediakan database client sederhana yang bisa kita gunakan untuk berkomunikasi dengan DBMS agar lebih mudah
#Atau kita bisa membuat aplikasi untuk berkomunikasi dengan DBMS, misal membuat aplikasi database client menggunakan Java, PHP atau bahasa pemrograman lainnya

#Database file
#Mayoritas DBMS menyimpan datanya di file, walaupun ada beberapa database yang hanya menyimpan datanya di memory (RAM)
#Namun jangan berpikir file database yang disimpan berupa file seperti Excel atau CSV (Comma Separated Value), tapi jauh lebih kompleks
#Database File akan di optimasi oleh DBMS agar mempermudah DBMS dalam manajemen datanya, seperti insert, update, delete dan select
#Tiap DBMS biasanya memiliki cara masing-masing mengelola Database File nya, dan kita tidak perlu harus tau, karena yang kita perlu tahu hanya cara berkomunikasi ke DBMS



CREATE DATABASE belajar_mysql;

# memilih database untuk di gunakan
USE belajar_mysql


#membuat table dan stuktur
CREATE TABLE barang(
    id INT,
    nama VARCHAR(100),
    harga INT,
    jumlah INT,
    deskripsi TEXT
)ENGINE =  InnoDB;

# menampilkan table dalam database
SHOW TABLES;

# menampilkan struktur tabel
DESCRIBE barang;

# menampilkan sintak pembuatan table
SHOW CREATE TABLE barang;

# mengubah atau update tabel
ALTER TABLE barang
    ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
MODIFY deskripsi TEXT AFTER nama

ALTER TABLE barang
MODIFY nama VARCHAR(200) NOT NULL;

ALTER TABLE barang
MODIFY id INT NOT NULL;

ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

# menghapus kolom
ALTER TABLE barang
    DROP COLUMN deskripsi;
    
    

#menampilkan isi table
SELECT * FROM barang;

#menghapus table
DROP TABLE barang;

#menampilkan tabel dalam database
SHOW TABLES

#menghapus data dalam tabel dan otomatis membuat ulang table
TRUNCATE barang;

# membuat tabel
CREATE TABLE produk(
    id INT NOT NULL DEFAULT 0,
name VARCHAR(200) NOT NULL,
describtion TEXT,
price INT NOT NULL DEFAULT 0,
quantity INT NOT NULL DEFAULT 0
)ENGINE = InnoDB;

# menampilkan struktur tabel
DESCRIBE product;

ALTER TABLE product
#MODIFY id VARCHAR(10) NOT NULL;
#MODIFY name VARCHAR(100);
#ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ADD PRIMARY KEY (id);




# rename table
ALTER TABLE produk
RENAME TO product;

# update tabel
ALTER TABLE product
#ADD COLUMN quantity INT NOT NULL  DEFAULT 0;
#ADD COLUMN category ENUM('Foot','Dring','Other');
MODIFY COLUMN category ENUM('Makanan','Minuman','Lainnya');


# menginput data kedalam tabel
INSERT INTO product(id,name,describtion,price,quantity,category)
VALUES ('P0009', 'teh hangat', 'teh pilihan', '4000', '60','Minuman'),
       ('P0010', 'kentang goreng', 'kentang plihan terbaik', '12000', '120','Lainnya');




# update data
UPDATE product
    SET name = 'Mie Goreng Aceh',
        describtion = 'Mie instan rasa khas daerah',
        price  = 5000,
        quantity = 25
WHERE id  = 'P0002';

UPDATE product
    SET category = 'Makanan'
WHERE id  = 'P0005';




# menggunakan operator dalam sql
SELECT * FROM product WHERE price <= 15000 AND quantity >= 25;

SELECT * FROM product WHERE price <= 15000 OR quantity >= 25;

SELECT * FROM product WHERE price < 15000 AND quantity > 25;

SELECT * FROM product WHERE price < 15000 OR quantity > 25;

# prioritas yang dalam tanda () 'memilih data pertama yang akan dieksekusi
SELECT * FROM product WHERE ( category = 'Makanan' OR quantity > 500) AND price < 20000;

# LIKE (mencari string atau angka dalam parameter %...%)
SELECT * FROM product WHERE name LIKE '%mie%';

# menampilkan data fild/kolom yang kosong search null & not null
SELECT * FROM product WHERE category IS NULL;

SELECT * FROM product WHERE category IS NOT NULL;


# RANGE (menampilkan data antara $input & $input)
SELECT * FROM product WHERE price BETWEEN 10000 AND 20000;
SELECT * FROM product WHERE price NOT BETWEEN 10000 AND 20000;



# IN
SELECT * FROM product WHERE category IN ('Makanan');

SELECT * FROM product WHERE category NOT IN ('Makanan');

# UPDATE product
# SET name = 'Jus  jeruk',
#     describtion = 'minuman pelengkap',
#     price = 10000,
#     category = 'Minuman'
# WHERE id = 'P0004';

SELECT id,name,category  FROM product ORDER BY category;


SELECT id,name,category  FROM product ORDER BY category ASC, price DESC;

# CLOUS LIMIT
SELECT *  FROM product ORDER BY id LIMIT 5;

SELECT *  FROM product ORDER BY id LIMIT 5  , 5;
SELECT * FROM product;

ALTER TABLE product


#menampilkan data yg sama tampa looping
SELECT DISTINCT category FROM product

SELECT 10,10,10 * 10 AS hasil;

# menampilkan nilai dalam K
SELECT id,name,price DIV 1000 AS 'PRICE IN K' FROM product;

SELECT COS(price), SIN(price),  TAN(price) FROM product;


# set auto increment
CREATE  TABLE admin
(
    id  INT NOT NULL AUTO_INCREMENT,
    firs_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
)ENGINE=InnoDB;
DESCRIBE admin;

INSERT INTO admin(firs_name, last_name)
VALUES ('akbar', 'ardiansyah'),
       ('ryon j','anggara'),
       ('doni','aziz'),
       ('arief','farhan'),
       ('fuad','bawazier');

SELECT * FROM admin;


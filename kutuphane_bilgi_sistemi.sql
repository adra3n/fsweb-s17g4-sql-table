-- SQL ifadelerinizi buraya yazınız.

CREATE TABLE `ogrenci`(
    `ogrenci_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_ad` VARCHAR(50) NOT NULL,
    `ogrenci_soyad VARCHAR(50) NOT NULL,
	`dtarih` DATETIME NOT NULL,
    `cinsiyet` VARCHAR(1) NOT NULL,
    `sinif` VARCHAR(10) NOT NULL,
    `ogrenci_puan` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `ogrenci` ADD PRIMARY KEY `ogrenci_ogrenci_id_primary`(`ogrenci_id`);

CREATE TABLE `kitap`(
    `kitap_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kitap_ad` VARCHAR(50) NOT NULL,
    `sayfasayisi` INT UNSIGNED NOT NULL,
    `kitap_puan` INT UNSIGNED NOT NULL,
    `yazar_id` BIGINT UNSIGNED NOT NULL,
    `tur_id` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `kitap` ADD PRIMARY KEY `kitap_kitap_id_primary`(`kitap_id`);

CREATE TABLE `yazar`(
    `yazar_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `yazar_ad` VARCHAR(50) NOT NULL,
    `yazar_soyad` VARCHAR(50) NOT NULL
);
ALTER TABLE
    `yazar` ADD PRIMARY KEY `yazar_yazar_id_primary`(`yazar_id`);

CREATE TABLE `islem`(
    `islem_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_id` BIGINT UNSIGNED NOT NULL,
    `kitap_id` BIGINT UNSIGNED NOT NULL,
    `atarih` DATETIME NOT NULL,
    `vtarih` DATETIME NOT NULL
);

CREATE TABLE `tur`(
    `tur_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tur_ad` VARCHAR(30) NOT NULL
);


ALTER TABLE
    `tur` ADD PRIMARY KEY `tur_tur_id_primary`(`tur_id`);

ALTER TABLE
    `islem` ADD PRIMARY KEY `islem_islem_id_primary`(`islem_id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`yazar_id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`kitap_id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`ogrenci_id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`tur_id`);
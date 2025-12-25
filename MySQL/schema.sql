drop database if exists Ecommerce;
create database Ecommerce DEFAULT CHARACTER SET utf8mb4;
use Ecommerce;
create table if not exists Categories (
	id integer not null unique auto_increment,
	parentId integer,
	name varchar(500),
	image varchar(500),
	description varchar(500),
	primary key(id),
	foreign key(parentId) references Categories(id)
);

insert into Categories(name, image) values
('Thời Trang Nam','/img/Categories/thoi-trang-nam.png'),
('Thời Trang Nữ','/img/Categories/thoi-trang-nu.png'),
('Điện Thoại & Phụ Kiện','/img/Categories/dien-thoai.png'),
('Mẹ & Bé','/img/Categories/me-va-be.png'),
('Thiết Bị Điện Tử','/img/Categories/thiet-bi-dien-tu.png'),
('Nhà Cửa & Đời Sống','/img/Categories/nha-cua.png'),
('Máy Tính & Laptop','/img/Categories/may-tinh.png'),
('Sắc Đẹp','/img/Categories/lam-dep.png'),
('Máy Ảnh & Quay Phim','/img/Categories/may-anh.png'),
('Sức Khỏe','/img/Categories/suc-khoe.png'),
('Đồng Hồ','/img/Categories/dong-ho.png'),
('Giày Dép Nữ','/img/Categories/giay-dep-nu.png'),
('Giày Dép Nam','/img/Categories/giay-dep-nam.png'),
('Túi Ví Nữ','/img/Categories/tui-vi-nu.png'),
('Thiết Bị Điện Gia Dụng','/img/Categories/gia-dung.png'),
('Phụ Kiện & Trang Sức Nữ','/img/Categories/phu-kien.png'),
('Thể Thao & Du Lịch','/img/Categories/the-thao.png'),
('Bách Hóa Online','/img/Categories/bach-hoa.png'),
('Ô Tô & Xe Máy & Xe Đạp','/img/Categories/xe-may.png'),
('Nhà Sách Online','/img/Categories/nha-sach.png'),
('Balo & Túi Ví Nam','/img/Categories/balo.png'),
('Thời Trang Trẻ Em','/img/Categories/thoi-trang-tre.png'),
('Đồ Chơi','/img/Categories/do-choi.png'),
('Giặt Giữ & Chăm Sóc Nhà Cửa','/img/Categories/giat-giu.png'),
('Chăm Sóc Thú Cưng','/img/Categories/thu-cung.png'),
('Voucher & Dịch Vụ','/img/Categories/voucher.png'),
('Dụng Cụ & Thiết Bị Tiện Ích','/img/Categories/dung-cu.png');

create table products(
	id integer not null unique auto_increment,
	categoryId integer,
	vendorId integer,
	brandId integer,
	name varchar(500),
	description varchar(500),
	image varchar(500),
	variation1 varchar(500),
	variation2 varchar(500),
	variation3 varchar(500),
	primary key (id),
	foreign key (categoryId) references Categories(id)
);

create table if not exists productImages (
	id integer not null unique auto_increment,
	productId integer not null,
	image varchar(500),
	primary key(id),
	foreign key (productId) references products(id)
);

create table if not exists productVariations(
	id integer not null unique auto_increment,
	productId integer not null,
	price integer,
	image varchar(500),
	value1 varchar(500),
	value2 varchar(500),
	value3 varchar(500),
	sold integer,
	inStock integer,
	primary key(id),
	foreign key (productId) references products(id)
);
/*
create table if not exists labels(
	id integer not null unique auto_increment,
	text varchar(500),
	style varchar(500),
	primary key (id)
);

insert into labels(text, style) values
('Yêu thích', 'liked-label'),
('Yêu thích+', 'liked-label'),
('Mall', 'mall-label'),
('Xử lý', 'process-label');

create table if not exists applyLabel(
	id integer not null unique auto_increment,
	labelId integer,
	productId integer,
	primary key(id),
	foreign key(labelId) references labels(id),
	foreign key(productId) references products(id),
	key(labelId, productId)
);

create table if not exists tags(
	id integer not null unique auto_increment,
	text varchar(500),
	style varchar(500),
	primary key(id),
	key(text, style)
);

insert into tags(text, style) values
('Rẻ vô địch', 'cheap-tag'),
('#shopthinhhanh', 'cheap-tag'),
('10% giảm', 'discount-tag'),
('12% giảm', 'discount-tag'),
('8k giảm', 'discount-tag'),
('Flash sale', 'flash-sale-tag');

create table if not exists applyTag(
	id integer not null unique auto_increment,
	tagId integer,
	productId integer,
	primary key(id),
	foreign key(tagId) references tags(id),
	foreign key(productId) references products(id),
	key(tagId, productId)
);

create table if not exists discountVouchers(
	id integer not null unique auto_increment,
	name varchar(500),
	description varchar(500),
	type varchar(500),
	start datetime,
	end datetime,
	image varchar(500),
	percentDiscount integer default 0,
	flatDiscount integer default 0,
	primary key (id)
);

insert into discountVouchers(name, start, end, percentDiscount, image) values
('Siêu giảm giá', '2025-01-31', '2025-12-31', 5, '/img/today-suggestions/overlay-1-voucher.png'),
('Siêu siêu giảm giá', '2025-01-31', '2025-12-31', 12, '/img/today-suggestions/overlay-1-voucher.png'),
('Siêu siêu siêu giảm giá', '2025-01-31', '2025-12-31', 23, '/img/today-suggestions/overlay-1-voucher.png'),
('Siêu siêu siêu siêu giảm giá', '2025-01-31', '2025-12-31', 36, '/img/today-suggestions/overlay-1-voucher.png'),
('Siêu siêu siêu siêu siêu giảm giá', '2025-01-31', '2025-12-31', 45, '/img/today-suggestions/overlay-1-voucher.png'),
('Siêu siêu siêu siêu siêu siêu giảm giá', '2025-01-31', '2025-12-31', 74, '/img/today-suggestions/overlay-2-voucher-supercheap.png'),
('Siêu siêu siêu siêu siêu siêu siêu giảm giá', '2025-01-31', '2025-12-31', 90, '/img/today-suggestions/overlay-2-voucher-supercheap.png');

create table if not exists applyVoucher(
	id integer not null unique auto_increment,
	voucherId integer,
	productId integer,
	primary key(id),
	foreign key(voucherId) references discountVouchers(id),
	foreign key(productId) references products(id),
	key(voucherId, productId)
);
*/

/* 1: https://shopee.vn/Th%E1%BA%AFt-l%C6%B0ng-nam-cao-c%E1%BA%A5p-full-h%E1%BB%99p-%C4%91%E1%BB%B1ng-da-b%C3%B2-sang-tr%E1%BB%8Dng-LEANO-fullbox-728-i.899791898.22178052543*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thời Trang Nam'),'Thắt lưng nam cao cấp','Thắt lưng nam cao cấp','/img/products/1-1.png', 'Màu sắc', 'Loại', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Thắt lưng nam cao cấp'), (select id from labels where text = 'Yêu thích'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Thắt lưng nam cao cấp'), 1);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Thắt lưng nam cao cấp'), 4);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Thắt lưng nam cao cấp'), 1),
-- ((select id from products where name = 'Thắt lưng nam cao cấp'), 2);
insert into productImages(productId, image) values
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), '/img/products/1-2.png'),
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), '/img/products/1-3.png'),
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), '/img/products/1-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), 210000, '/img/products/1-v1.png', 'Vàng', 'Chỉ thắt lưng', null, rand()*5000, rand()*1000),
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), 250000, '/img/products/1-v1.png', 'Vàng', 'Thắt lưng + hộp', null, rand()*5000, rand()*1000),
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), 210000, '/img/products/1-v2.png', 'Đen', 'Chỉ thắt lưng', null, rand()*5000, rand()*1000),
((select id from products where name = 'Thắt lưng nam cao cấp' limit 1), 250000, '/img/products/1-v2.png', 'Đen', 'Thắt lưng + hộp', null, rand()*5000, rand()*1000);

/* 2: https://shopee.vn/T%E1%BA%A5t-Tr%C6%A1n-nam-n%E1%BB%AF-tr%E1%BA%AFng-%C4%91en-c%E1%BB%95-cao-c%E1%BB%95-th%E1%BA%A5p-th%E1%BB%9Di-trang-BASIC-Cao-c%E1%BA%A5p-i.389565482.11412744575*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thời Trang Nam'),'Tất Trơn nam nữ','Tất Trơn nam nữ','/img/products/2-1.png', 'Màu sắc', null, null);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Tất Trơn nam nữ'), 2);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Tất Trơn nam nữ'), 3);
insert into productImages(productId, image) values
((select id from products where name = 'Tất Trơn nam nữ' limit 1), '/img/products/2-2.png'),
((select id from products where name = 'Tất Trơn nam nữ' limit 1), '/img/products/2-3.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Tất Trơn nam nữ' limit 1), 23000, '/img/products/2-v1.png', 'Đen', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Tất Trơn nam nữ' limit 1), 23000, '/img/products/2-v2.png', 'Trắng', null, null, rand()*5000, rand()*1000);
/* 3: https://shopee.vn/%C3%81o-thun-%C3%B4m-body-cotton-l%C3%B4ng-m%E1%BB%8Bn-co-gi%C3%A3n-Justdun-B18-i.16848981.26026184103*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thời Trang Nữ'),'Áo Thun AM Nam Nữ','Áo Thun AM Nam Nữ','/img/products/3-1.png', 'Màu', 'Size', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Áo Thun AM Nam Nữ'), (select id from labels where text = 'Yêu thích+'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Áo Thun AM Nam Nữ'), 5);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Áo Thun AM Nam Nữ'), 1);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Áo Thun AM Nam Nữ'), 7);
insert into productImages(productId, image) values
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), '/img/products/3-2.png'),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), '/img/products/3-3.png'),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), '/img/products/3-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), 42000, '/img/products/3-v1.png', 'Đen', '30-45kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), 42000, '/img/products/3-v2.png', 'Trắng', '30-45kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), 42000, '/img/products/3-v3.png', 'Be', '30-45kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), 50000, '/img/products/3-v1.png', 'Đen', '45-70kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), 50000, '/img/products/3-v2.png', 'Trắng', '45-70kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo Thun AM Nam Nữ' limit 1), 50000, '/img/products/3-v3.png', 'Be', '45-70kg', null, rand()*5000, rand()*1000);
/* 4: https://shopee.vn/%C3%81o-thun-%C3%B4m-body-cotton-l%C3%B4ng-m%E1%BB%8Bn-co-gi%C3%A3n-Justdun-B18-i.16848981.26026184103*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thời Trang Nữ'),'Áo thun ôm body cotton lông mịn','Áo thun ôm body cotton lông mịn','/img/products/4-1.png', 'Màu', 'Size', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Áo thun ôm body cotton lông mịn'), (select id from labels where text = 'Mall'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Áo thun ôm body cotton lông mịn'), 3);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Áo thun ôm body cotton lông mịn'), 4),
-- ((select id from products where name = 'Áo thun ôm body cotton lông mịn'), 6);
insert into productImages(productId, image) values
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), '/img/products/4-2.png'),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), '/img/products/4-3.png'),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), '/img/products/4-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 69000, '/img/products/4-v1.png', 'Đen', 's', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 70000, '/img/products/4-v2.png', 'Trắng', 's', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 71000, '/img/products/4-v3.png', 'Đỏ đô', 's', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 72000, '/img/products/4-v1.png', 'Đen', 'm', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 73000, '/img/products/4-v2.png', 'Trắng', 'm', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 74000, '/img/products/4-v3.png', 'Đỏ đô', 'm', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 75000, '/img/products/4-v1.png', 'Đen', 'l', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 76000, '/img/products/4-v2.png', 'Trắng', 'l', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 77000, '/img/products/4-v3.png', 'Đỏ đô', 'l', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 78000, '/img/products/4-v1.png', 'Đen', 'xl', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 79000, '/img/products/4-v2.png', 'Trắng', 'xl', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 80000, '/img/products/4-v3.png', 'Đỏ đô', 'xl', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 81000, '/img/products/4-v1.png', 'Đen', 'xxl', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 82000, '/img/products/4-v2.png', 'Trắng', 'xxl', null, rand()*5000, rand()*1000),
((select id from products where name = 'Áo thun ôm body cotton lông mịn' limit 1), 83000, '/img/products/4-v3.png', 'Đỏ đô', 'xxl', null, rand()*5000, rand()*1000);
/* 5: https://shopee.vn/C%C3%A1p-s%E1%BA%A1c-nhanh-Essager-3A-Type-C-Micro-iP-Usb-0.25m-1m-2m-3M-cho-%C4%91i%E1%BB%87n-tho%E1%BA%A1i-Android-i.211133030.12694198468*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Điện Thoại & Phụ Kiện'),'Cáp sạc nhanh Essager 3A','Cáp sạc nhanh Essager 3A','/img/products/5-1.png', 'Loại', 'Chiều dài', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Cáp sạc nhanh Essager 3A'), (select id from labels where text = 'Xử lý'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Cáp sạc nhanh Essager 3A'), 3);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Cáp sạc nhanh Essager 3A'), 4);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Cáp sạc nhanh Essager 3A'), 6);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Cáp sạc nhanh Essager 3A'), 5);
insert into productImages(productId, image) values
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), '/img/products/5-2.png'),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), '/img/products/5-3.png'),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), '/img/products/5-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 24000, '/img/products/5-v1.png', 'USB-C', '1m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 25000, '/img/products/5-v2.png', 'Micro USB', '1m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 26000, '/img/products/5-v3.png', 'Apple Lightning', '1m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 27000, '/img/products/5-v1.png', 'USB-C', '2m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 28000, '/img/products/5-v2.png', 'Micro USB', '2m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 29000, '/img/products/5-v3.png', 'Apple Lightning', '2m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 30000, '/img/products/5-v1.png', 'USB-C', '3m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 31000, '/img/products/5-v2.png', 'Micro USB', '3m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Cáp sạc nhanh Essager 3A' limit 1), 32000, '/img/products/5-v3.png', 'Apple Lightning', '3m', null, rand()*5000, rand()*1000);
/* 6: https://shopee.vn/D%C3%A2y-C%C3%A1p-Baseus-PD-20W-N%E1%BB%91i-%C4%90%E1%BA%A7u-USB-C-Sang-%C4%90%E1%BA%A7u-L-S%E1%BA%A1c-Nhanh-H%E1%BB%97-Tr%E1%BB%A3-Truy%E1%BB%81n-D%E1%BB%AF-Li%E1%BB%87u-480Mbps-i.131195741.13409270053*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thiết Bị Điện Tử'),'Dây Cáp Baseus PD 20W','description','/img/products/6-1.png', 'Màu sắc', 'Chiều dài', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Dây Cáp Baseus PD 20W'), (select id from labels where text = 'Mall'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Dây Cáp Baseus PD 20W'), 5);
insert into productImages(productId, image) values
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), '/img/products/6-2.png'),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), '/img/products/6-3.png'),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), '/img/products/6-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), 100000, '/img/products/6-v1.png', 'Trắng', '1m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), 100000, '/img/products/6-v2.png', 'Xanh lam', '1m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), 100000, '/img/products/6-v3.png', 'Tím', '1m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), 100000, '/img/products/6-v1.png', 'Trắng', '2m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), 100000, '/img/products/6-v2.png', 'Xanh lam', '2m', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Cáp Baseus PD 20W' limit 1), 100000, '/img/products/6-v3.png', 'Tím', '2m', null, rand()*5000, rand()*1000);
/* 7: https://shopee.vn/-GI%C3%81-H%E1%BB%A6Y-DI%E1%BB%86T-Gh%E1%BA%BF-G%E1%BB%99i-%C4%90%E1%BA%A7u-Cho-B%C3%A9-C%E1%BB%A1-%C4%90%E1%BA%A1i-C%C3%B3-T%E1%BA%A5m-L%C3%B3t-%C4%90%E1%BB%A1-G%C3%A1y-B%C3%A9-Kh%C3%B4ng-B%E1%BB%8B-M%E1%BB%8Fi-C%E1%BB%95-i.292615426.6348607862*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Mẹ & Bé'),'Ghế Gội Đầu Cho Bé Cỡ Đại','description','/img/products/7-1.png', 'Loại', null, null);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại'), 6);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại'), 1);
insert into productImages(productId, image) values
((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại' limit 1), '/img/products/7-2.png'),
((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại' limit 1), '/img/products/7-3.png'),
((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại' limit 1), '/img/products/7-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại' limit 1), 69000, '/img/products/7-v1.png', 'Hồng nhỏ', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại' limit 1), 70000, '/img/products/7-v2.png', 'Hồng lớn', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Ghế Gội Đầu Cho Bé Cỡ Đại' limit 1), 71000, '/img/products/7-v3.png', 'Xanh nhỏ', null, null, rand()*5000, rand()*1000);
/* 8: https://shopee.vn/Tinh-D%E1%BA%A7u-Th%C6%A1m-Thi%C3%AAn-Nhi%C3%AAn-WIACHNN-50ml-B%E1%BA%A3n-Sang-Tr%E1%BB%8Dng-%C4%90%E1%BB%83-Ph%C3%B2ng-Que-G%E1%BB%97-T%E1%BB%B1-Khu%E1%BA%BFch-T%C3%A1n-Kh%E1%BB%AD-M%C3%B9i-WC50-i.424522910.8668901780*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Nhà Cửa & Đời Sống'),'Tinh Dầu Thơm Thiên Nhiên','description','/img/products/8-1.png', 'Mùi hương', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên'), (select id from labels where text = 'Yêu thích'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên'), 7);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên'), 2),
-- ((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên'), 3);
insert into productImages(productId, image) values
((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên' limit 1), '/img/products/8-2.png'),
((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên' limit 1), '/img/products/8-3.png'),
((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên' limit 1), '/img/products/8-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên' limit 1), 55000, '/img/products/8-v1.png', 'Chanh', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên' limit 1), 56000, '/img/products/8-v2.png', 'Trà', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên' limit 1), 57000, '/img/products/8-v3.png', 'Cà phê', null, null, rand()*5000, rand()*1000);
/* 9: https://shopee.vn/Switch-Leobog-GrayWood-V4-5-PIN-Linear-50g-t%E1%BA%A3n-LED-t%E1%BB%91t-c%C3%B4ng-t%E1%BA%AFc-b%C3%A0n-ph%C3%ADm-Switch-Leobog-v4-5pin-DoDo-Gear-i.665488736.23845409057*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Máy Tính & Laptop'),'Switch Leobog GrayWood V4','description','/img/products/9-1.png', 'Switch', 'Phân loại', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Switch Leobog GrayWood V4'), (select id from labels where text = 'Yêu thích'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Switch Leobog GrayWood V4'), 1);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Switch Leobog GrayWood V4'), 6);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Switch Leobog GrayWood V4'), 4),
-- ((select id from products where name = 'Switch Leobog GrayWood V4'), 5);
insert into productImages(productId, image) values
((select id from products where name = 'Switch Leobog GrayWood V4' limit 1), '/img/products/9-2.png'),
((select id from products where name = 'Switch Leobog GrayWood V4' limit 1), '/img/products/9-3.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Switch Leobog GrayWood V4' limit 1), 3000, '/img/products/9-v1.png', 'Leopog', 'prelube', null, rand()*5000, rand()*1000),
((select id from products where name = 'Switch Leobog GrayWood V4' limit 1), 4000, '/img/products/9-v2.png', 'Leopog', 'lube', null, rand()*5000, rand()*1000);
/* 10: https://shopee.vn/B%E1%BB%99-D%E1%BB%A5ng-C%E1%BB%A5-B%E1%BA%A5m-M%C3%B3ng-Tay-16-m%C3%B3n-S%C3%A9t-D%E1%BB%A5ng-C%E1%BB%A5-L%C3%A0m-M%C3%B3ng-3DM-18-Chi-Ti%E1%BA%BFt-Nail-Care-Cao-C%E1%BA%A5p-i.541656789.22585108914*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Sắc Đẹp'),'Bộ Dụng Cụ Bấm Móng Tay 16 món','description','/img/products/10-1.png', null, null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món'), (select id from labels where text = 'Yêu thích+'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món'), 5);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món'), 6);
insert into productImages(productId, image) values
((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món' limit 1), '/img/products/10-2.png'),
((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món' limit 1), '/img/products/10-3.png'),
((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món' limit 1), '/img/products/10-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Bộ Dụng Cụ Bấm Móng Tay 16 món' limit 1), 85000, null, null, null, null, rand()*5000, rand()*1000);
/* 11: https://shopee.vn/Th%E1%BA%BB-nh%E1%BB%9B-Micro-SD-32GB-64GB-128GB-256GB-s%E1%BB%AD-d%E1%BB%A5ng-cho-camera-Imou-I-H%C3%A0ng-ch%C3%ADnh-h%C3%A3ng-i.756905359.17367792759*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Máy Ảnh & Quay Phim'),'Thẻ nhớ Micro SD','description','/img/products/11-1.png', 'Lưu trữ', null, null);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Thẻ nhớ Micro SD'), 2);
insert into productImages(productId, image) values
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), '/img/products/11-2.png'),
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), '/img/products/11-3.png'),
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), '/img/products/11-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), 150000, '/img/products/11-v1.png', '32GB', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), 300000, '/img/products/11-v2.png', '64GB', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), 450000, '/img/products/11-v3.png', '128GB', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Thẻ nhớ Micro SD' limit 1), 600000, '/img/products/11-v4.png', '256GB', null, null, rand()*5000, rand()*1000);
/* 12: https://shopee.vn/PVN48400-Set-10-B%E1%BB%8Bch-t%C4%83m-b%C3%B4ng-70-100-que-th%C3%A2n-g%E1%BB%97-i.182032860.19526426811*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Sức Khỏe'),'Cây ngoáy tai đầu bông êm ái','description','/img/products/12-1.png', null, null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Cây ngoáy tai đầu bông êm ái'), (select id from labels where text = 'Xử lý'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Cây ngoáy tai đầu bông êm ái'), 3);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Cây ngoáy tai đầu bông êm ái'), 1);
insert into productImages(productId, image) values
((select id from products where name = 'Cây ngoáy tai đầu bông êm ái' limit 1), '/img/products/12-2.png'),
((select id from products where name = 'Cây ngoáy tai đầu bông êm ái' limit 1), '/img/products/12-3.png'),
((select id from products where name = 'Cây ngoáy tai đầu bông êm ái' limit 1), '/img/products/12-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Cây ngoáy tai đầu bông êm ái' limit 1), 25000, null, null, null, null, rand()*5000, rand()*1000);
/* 13: https://shopee.vn/%C4%90%E1%BB%93ng-h%E1%BB%93-%C4%91i%E1%BB%87n-t%E1%BB%AD-nam-n%E1%BB%AF-Sport-S042Z-ki%E1%BB%83u-m%E1%BB%9Bi-phong-c%C3%A1ch-ca-t%C3%ADnh-full-ch%E1%BB%A9c-n%C4%83ng-i.68362839.15504250996*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Đồng Hồ'),'Đồng hồ điện tử nam nữ Sport S042Z','description','/img/products/13-1.png', 'Chọn màu', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z'), (select id from labels where text = 'Xử lý'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z'), 7);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z'), 2);
insert into productImages(productId, image) values
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), '/img/products/13-2.png'),
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), '/img/products/13-3.png'),
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), '/img/products/13-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), 39000, '/img/products/13-v1.png', 'Đen', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), 40000, '/img/products/13-v2.png', 'Xanh', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), 41000, '/img/products/13-v3.png', 'Đỏ', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Đồng hồ điện tử nam nữ Sport S042Z' limit 1), 42000, '/img/products/13-v4.png', 'Vàng', null, null, rand()*5000, rand()*1000);

/* 14: https://shopee.vn/-T%E1%BA%B7ng-10-Charm-3D-D%C3%A9p-S%E1%BB%A5c-Nam-N%E1%BB%AF-NESTY-Ki%E1%BB%83u-D%C3%A1ng-Basic-%C4%90%E1%BA%BF-M%E1%BB%81m-Cao-4cm-NE01-i.1113586002.24438735904*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Giày Dép Nữ'),'Dép Sục Nam Nữ NESTY','description','/img/products/14-1.png', 'Màu sắc', 'Size', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Dép Sục Nam Nữ NESTY'), (select id from labels where text = 'Mall'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Dép Sục Nam Nữ NESTY'), 4);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Dép Sục Nam Nữ NESTY'), 3);
insert into productImages(productId, image) values
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), '/img/products/14-2.png'),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), '/img/products/14-3.png'),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), '/img/products/14-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 125000, '/img/products/14-v1.png', 'Trắng kem', '19-20', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 126000, '/img/products/14-v2.png', 'Đen', '20-21', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 127000, '/img/products/14-v3.png', 'Nâu nhạt', '21-22', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 125000, '/img/products/14-v1.png', 'Trắng kem', '22-23', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 126000, '/img/products/14-v2.png', 'Đen', '23-24', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 127000, '/img/products/14-v3.png', 'Nâu nhạt', '24-25', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 125000, '/img/products/14-v1.png', 'Trắng kem', '25-26', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 126000, '/img/products/14-v2.png', 'Đen', '26-27', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Sục Nam Nữ NESTY' limit 1), 127000, '/img/products/14-v3.png', 'Nâu nhạt', '27-28', null, rand()*5000, rand()*1000);

/* 15: https://shopee.vn/D%C3%A9p-Nam-N%E1%BB%AF-Quai-Ngang-%C4%90%C3%BAc-Li%E1%BB%81n-Kh%E1%BB%91i-Si%C3%AAu-Nh%E1%BA%B9-DUWA-H%C3%A0ng-Ch%C3%ADnh-H%C3%A3ng-SH193-i.379233423.20132910191*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Giày Dép Nam'),'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA','description','/img/products/15-1.png', 'Màu', 'Size', null);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA'), 6);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA'), 4);
insert into productImages(productId, image) values
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), '/img/products/15-2.png'),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), '/img/products/15-3.png'),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), '/img/products/15-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 53000, '/img/products/15-v1.png', 'Trắng', '36', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 53000, '/img/products/15-v2.png', 'Đen', '36', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 53000, '/img/products/15-v3.png', 'Đen caro', '36', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 53000, '/img/products/15-v4.png', 'Trắng caro', '36', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 77000, '/img/products/15-v1.png', 'Trắng', '37', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 77000, '/img/products/15-v2.png', 'Đen', '37', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 77000, '/img/products/15-v3.png', 'Đen caro', '37', null, rand()*5000, rand()*1000),
((select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA' limit 1), 77000, '/img/products/15-v4.png', 'Trắng caro', '37', null, rand()*5000, rand()*1000);

/* 16: https://shopee.vn/T%C3%BAi-c%C3%B3i-Merci-%C4%91i-du-l%E1%BB%8Bch-lo%E1%BA%A1i-1-t%C3%BAi-to-l%C3%B3t-d%C3%A0y-d%E1%BA%B7n-kh%C3%B4ng-b%C3%A1n-h%C3%A0ng-lo%E1%BA%A1i-2-nhe-c%C3%B3-b%E1%BB%8Dc-n%C3%A2u-b%C3%AAn-ngo%C3%A0i.-i.441500992.13151328128*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Túi Ví Nữ'),'Túi cói Merci đi du lịch','description','/img/products/16-1.png', null, null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Túi cói Merci đi du lịch'), (select id from labels where text = 'Yêu thích'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Túi cói Merci đi du lịch'), 1);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Túi cói Merci đi du lịch'), 5);
insert into productImages(productId, image) values
((select id from products where name = 'Túi cói Merci đi du lịch' limit 1), '/img/products/16-2.png'),
((select id from products where name = 'Túi cói Merci đi du lịch' limit 1), '/img/products/16-3.png'),
((select id from products where name = 'Túi cói Merci đi du lịch' limit 1), '/img/products/16-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Túi cói Merci đi du lịch' limit 1), 36000, null, null, null, null, rand()*5000, rand()*1000);

/* 17: https://shopee.vn/Qu%E1%BA%A1t-k%E1%BA%B9p-b%C3%A0n-t%C3%ADch-%C4%91i%E1%BB%87n-5-m%E1%BB%A9c-%C4%91%E1%BB%99-c%C3%B3-%C4%91%C3%A8n-led-pin-5000-MHA-V%C3%A0-10000-MHA-H%C3%80NG-CH%C3%8DNH-H%C3%83NG--i.1157734523.28150991443*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thiết Bị Điện Gia Dụng'),'Quạt kẹp bàn tích điện 5 mức độ','description','/img/products/17-1.png', 'Màu sắc', 'Dung lượng pin', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ'), (select id from labels where text = 'Yêu thích'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ'), 3);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ'), 6);
insert into productImages(productId, image) values
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), '/img/products/17-2.png'),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), '/img/products/17-3.png'),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), '/img/products/17-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), 65000, '/img/products/17-v1.png', 'Xanh than', '5000 MAH', null, rand()*5000, rand()*1000),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), 65000, '/img/products/17-v2.png', 'Hồng', '5000 MAH', null, rand()*5000, rand()*1000),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), 65000, '/img/products/17-v3.png', 'Trắng', '5000 MAH', null, rand()*5000, rand()*1000),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), 65000, '/img/products/17-v1.png', 'Xanh than', '10000 MAH', null, rand()*5000, rand()*1000),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), 65000, '/img/products/17-v2.png', 'Hồng', '10000 MAH', null, rand()*5000, rand()*1000),
((select id from products where name = 'Quạt kẹp bàn tích điện 5 mức độ' limit 1), 65000, '/img/products/17-v3.png', 'Trắng', '10000 MAH', null, rand()*5000, rand()*1000);

/* 18: https://shopee.vn/%C3%94-D%C3%B9-Mini-g%E1%BA%A5p-g%E1%BB%8Dn-%C4%91%E1%BB%83-t%C3%BAi-ch%E1%BB%91ng-tia-uv-cao-c%E1%BA%A5p-si%C3%AAu-g%E1%BB%8Dn-che-n%E1%BA%AFng-m%C6%B0a-khi-%C4%91i-du-l%E1%BB%8Bch-%C4%91i-h%E1%BB%8Dc-v%C4%83n-ph%C3%B2ng-i.1306654899.24134307288*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Phụ Kiện & Trang Sức Nữ'),'Ô Dù Mini gấp gọn','description','/img/products/18-1.png', 'Màu sắc', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Ô Dù Mini gấp gọn'), (select id from labels where text = 'Yêu thích+'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Ô Dù Mini gấp gọn'), 3);
insert into productImages(productId, image) values
((select id from products where name = 'Ô Dù Mini gấp gọn' limit 1), '/img/products/18-2.png'),
((select id from products where name = 'Ô Dù Mini gấp gọn' limit 1), '/img/products/18-3.png'),
((select id from products where name = 'Ô Dù Mini gấp gọn' limit 1), '/img/products/18-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Ô Dù Mini gấp gọn' limit 1), 75000, '/img/products/18-v1.png', 'Hồng', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Ô Dù Mini gấp gọn' limit 1), 76000, '/img/products/18-v2.png', 'Trắng', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Ô Dù Mini gấp gọn' limit 1), 77000, '/img/products/18-v3.png', 'Đen', null, null, rand()*5000, rand()*1000);

/* 19: https://shopee.vn/D%C3%A2y-Nh%E1%BA%A3y-Th%E1%BB%83-D%E1%BB%A5c-L%C3%B5i-Th%C3%A9p-T%E1%BA%ADp-Th%E1%BB%83-L%E1%BB%B1c-Boxing-Nh%E1%BA%A3y-D%C3%A2y-C%C3%B3-T%E1%BA%A1-S%E1%BA%AFt-D%C3%A0i-2-7m-Nhi%E1%BB%81u-M%C3%A0u-Ch%E1%BB%91ng-Tr%C6%B0%E1%BB%A3t-i.239077327.4458803718*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thể Thao & Du Lịch'),'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing','description','/img/products/19-1.png', 'Màu sắc', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'ây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing'), (select id from labels where text = 'Yêu thích+'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing'), 2);
insert into productImages(productId, image) values
((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing' limit 1), '/img/products/19-2.png'),
((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing' limit 1), '/img/products/19-3.png'),
((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing' limit 1), '/img/products/19-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing' limit 1), 29000, '/img/products/19-v1.png', 'Đỏ', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing' limit 1), 29000, '/img/products/19-v2.png', 'Đen', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Dây Nhảy Thể Dục Lõi Thép Tập Thể Lực Boxing' limit 1), 29000, '/img/products/19-v3.png', 'Hồng', null, null, rand()*5000, rand()*1000);

/* 20: https://shopee.vn/H%E1%BA%A1t-%C4%90i%E1%BB%81u-Rang-Mu%E1%BB%91i-Nguy%C3%AAn-L%E1%BB%A5a-B%C3%ACnh-Ph%C6%B0%E1%BB%9Bc-Ch%E1%BA%A5t-L%C6%B0%E1%BB%A3ng-Th%C6%A1m-Ngon-Gi%C3%B2n-B%C3%B9i-t%E1%BB%AB-N%C3%B4ng-S%E1%BA%A3n-Gi%E1%BB%8Dt-N%E1%BA%AFng-i.307491301.15213834023*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Bách Hóa Online'),'Hạt Điều Rang Muối Nguyên Lụa Bình Phước','description','/img/products/20-1.png', 'Loại hộp', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước'), (select id from labels where text = 'Mall'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước'), 7);
insert into productImages(productId, image) values
((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước' limit 1), '/img/products/20-2.png'),
((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước' limit 1), '/img/products/20-3.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước' limit 1), 100000, '/img/products/20-v1.png', '250g', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước' limit 1), 120000, '/img/products/20-v2.png', '420g', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước' limit 1), 140000, '/img/products/20-v3.png', '440g', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Hạt Điều Rang Muối Nguyên Lụa Bình Phước' limit 1), 160000, '/img/products/20-v4.png', '225g', null, null, rand()*5000, rand()*1000);

/* 21: https://shopee.vn/B%C6%A1m-xe-m%C3%A1y-xe-%C4%91%E1%BA%A1p-nh%E1%BB%8F-g%E1%BB%8Dn-Kiotool-%C4%91%E1%BA%A7u-van-%C4%91a-n%C4%83ng-i.371748885.21827189116*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Ô Tô & Xe Máy & Xe Đạp'),'Bơm xe máy xe đạp nhỏ gọn Kiotool','description','/img/products/21-1.png', null, null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Bơm xe máy xe đạp nhỏ gọn Kiotool'), (select id from labels where text = 'Mall'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Bơm xe máy xe đạp nhỏ gọn Kiotool'), 4);
insert into productImages(productId, image) values
((select id from products where name = 'Bơm xe máy xe đạp nhỏ gọn Kiotool' limit 1), '/img/products/21-2.png'),
((select id from products where name = 'Bơm xe máy xe đạp nhỏ gọn Kiotool' limit 1), '/img/products/21-3.png'),
((select id from products where name = 'Bơm xe máy xe đạp nhỏ gọn Kiotool' limit 1), '/img/products/21-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Bơm xe máy xe đạp nhỏ gọn Kiotool' limit 1), 75000, null, null, null, null, rand()*5000, rand()*1000);

/* 22: https://shopee.vn/-X%E1%BA%A2-KHO-B%C4%83ng-Keo-B%C4%83ng-D%C3%ADnh-Trong-%C4%90%E1%BB%A5c-4.8cm-200Yard-(1.8kg-c%C3%A2y-6-Cu%E1%BB%99n)-B%C4%83ng-Keo-100Y-200Y-D%C3%A1n-Th%C3%B9ng-%C4%90%C3%B3ng-G%C3%B3i-i.242520587.18320575698*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Nhà Sách Online'),'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard','description','/img/products/22-1.png', 'Màu', 'Kg', null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard'), (select id from labels where text = 'Xử lý'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard'), 6);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard'), 1);
insert into productImages(productId, image) values
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), '/img/products/22-2.png'),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), '/img/products/22-3.png'),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), '/img/products/22-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), 30000, '/img/products/22-v1.png', 'Trong', '1.2kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), 30000, '/img/products/22-v2.png', 'Đục', '1.2kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), 45000, '/img/products/22-v1.png', 'Trong', '1.8kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), 45000, '/img/products/22-v2.png', 'Đục', '1.8kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), 60000, '/img/products/22-v1.png', 'Trong', '2kg', null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo, Băng Dính Trong/Đục 4.8cm - 200Yard' limit 1), 60000, '/img/products/22-v2.png', 'Đục', '2kg', null, rand()*5000, rand()*1000);

/* 23: https://shopee.vn/T%C3%BAi-%C4%90eo-B%E1%BB%A5ng-%C4%90%E1%BB%B1ng-%C4%90i%E1%BB%87n-Tho%E1%BA%A1i-Ch%E1%BA%A1y-B%E1%BB%99-%C4%90ai-%C4%90eo-B%E1%BB%A5ng-Bao-T%E1%BB%AD-Nam-N%E1%BB%AF-%C4%90a-N%C4%83ng-T%E1%BA%ADp-Gym-%C4%90i-Xe-%C4%90%E1%BA%A1p-Leo-N%C3%BAi-i.239077327.4553772245*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Balo & Túi Ví Nam'),'Túi Đeo Bụng Đựng Điện Thoại','description','/img/products/23-1.png', 'Màu sắc', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại'), (select id from labels where text = 'Xử lý'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại'), 5);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại'), 2);
insert into productImages(productId, image) values
((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại' limit 1), '/img/products/23-2.png'),
((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại' limit 1), '/img/products/23-3.png'),
((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại' limit 1), '/img/products/23-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại' limit 1), 29000, '/img/products/23-v1.png', 'Hồng', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại' limit 1), 29000, '/img/products/23-v2.png', 'Xanh lá', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Túi Đeo Bụng Đựng Điện Thoại' limit 1), 29000, '/img/products/23-v3.png', 'Đỏ', null, null, rand()*5000, rand()*1000);

/* 24: https://shopee.vn/Balo-ch%E1%BB%91ng-g%C3%B9-PTLUXURY-ch%E1%BA%A5t-li%E1%BB%87u-v%E1%BA%A3i-oxford-cao-c%E1%BA%A5p-k%C3%ADch-th%C6%B0%E1%BB%9Bc-l%E1%BB%9Bn-cho-b%C3%A9-trai-v%C3%A0-b%C3%A9-g%C3%A1i-H%C3%80NG-QU%E1%BA%A2NG-CH%C3%82U--i.984839978.25577093118*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Thời Trang Trẻ Em'),'Balo chống gù PTLUXURY','description','/img/products/24-1.png', 'Màu sắc', null, null);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Balo chống gù PTLUXURY'), 1);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Balo chống gù PTLUXURY'), 3);
insert into productImages(productId, image) values
((select id from products where name = 'Balo chống gù PTLUXURY' limit 1), '/img/products/24-2.png'),
((select id from products where name = 'Balo chống gù PTLUXURY' limit 1), '/img/products/24-3.png'),
((select id from products where name = 'Balo chống gù PTLUXURY' limit 1), '/img/products/24-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Balo chống gù PTLUXURY' limit 1), 205000, '/img/products/24-v1.png', 'Xanh đỏ', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Balo chống gù PTLUXURY' limit 1), 205000, '/img/products/24-v2.png', 'Xanh trắng', null, null, rand()*5000, rand()*1000);

/* 25: https://shopee.vn/-Qu%C3%A0-t%E1%BA%B7ng-kh%C3%B4ng-b%C3%A1n-B%E1%BB%99-20-Th%E1%BA%BB-K%C3%ADch-Th%C3%ADch-Th%E1%BB%8B-Gi%C3%A1c-Cho-Tr%E1%BA%BB-0-3-Tu%E1%BB%95i-Gi%C3%BAp-B%C3%A9-Ph%C3%A1t-Tri%E1%BB%83n-To%C3%A0n-Di%E1%BB%87n-i.80982978.29970207280*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Đồ Chơi'),'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ','description','/img/products/25-1.png', null, null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ'), (select id from labels where text = 'Yêu thích'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ'), 1);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ'), 4);
insert into productImages(productId, image) values
((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ' limit 1), '/img/products/25-2.png'),
((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ' limit 1), '/img/products/25-3.png'),
((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ' limit 1), '/img/products/25-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Bộ 20 Thẻ Kích Thích Thị Giác Cho Trẻ' limit 1), 50000, null , null, null, null, rand()*5000, rand()*1000);

/* 26: https://shopee.vn/Gi%E1%BA%A5y-v%E1%BB%87-sinh-treo-t%C6%B0%E1%BB%9Dng-TopGia-%C4%91a-s%E1%BA%AFc-%C4%91a-n%C4%83ng-t%E1%BB%AB-b%E1%BB%99t-gi%E1%BA%A5y-thi%C3%AAn-nhi%C3%AAn-1280t%E1%BB%9D-4l%E1%BB%9Bp-i.1016604648.23552060269*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Giặt Giữ & Chăm Sóc Nhà Cửa'),'Giấy vệ sinh treo tường TopGia','description','/img/products/26-1.png', 'Phân loại', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Giấy vệ sinh treo tường TopGia'), (select id from labels where text = 'Yêu thích+'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Giấy vệ sinh treo tường TopGia'), 3);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Giấy vệ sinh treo tường TopGia'), 5);
insert into productImages(productId, image) values
((select id from products where name = 'Giấy vệ sinh treo tường TopGia' limit 1), '/img/products/26-2.png'),
((select id from products where name = 'Giấy vệ sinh treo tường TopGia' limit 1), '/img/products/26-3.png'),
((select id from products where name = 'Giấy vệ sinh treo tường TopGia' limit 1), '/img/products/26-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Giấy vệ sinh treo tường TopGia' limit 1), 129000, '/img/products/26-v1.png', '4 bịch', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Giấy vệ sinh treo tường TopGia' limit 1), 149000, '/img/products/26-v2.png', '6 bịch', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Giấy vệ sinh treo tường TopGia' limit 1), 169000, '/img/products/26-v3.png', '9 bịch', null, null, rand()*5000, rand()*1000);

/* 27: https://shopee.vn/(S%E1%BB%88-SLL)-Khay-v%E1%BB%87-sinh-cho-m%C3%A8o-LunaPet-KM04-Khay-v%E1%BB%87-sinh-gi%C3%A1-r%E1%BA%BB-t%E1%BA%B7ng-k%C3%A8m-x%E1%BA%BBng-x%C3%BAc-ph%C3%A2n-cho-m%C3%A8o-i.323555820.8570626260*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Chăm Sóc Thú Cưng'),'Khay vệ sinh cho mèo LunaPet KM04','description','/img/products/27-1.png', 'Màu sắc', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04'), (select id from labels where text = 'Mall'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04'), 1);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04'), 6);
insert into productImages(productId, image) values
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), '/img/products/27-2.png'),
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), '/img/products/27-3.png'),
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), '/img/products/27-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), 54000, '/img/products/27-v1.png', 'Nâu', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), 54000, '/img/products/27-v2.png', 'Xám', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), 54000, '/img/products/27-v3.png', 'Xanh non', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Khay vệ sinh cho mèo LunaPet KM04' limit 1), 54000, '/img/products/27-v4.png', 'Xanh dương', null, null, rand()*5000, rand()*1000);

/* 28: https://shopee.vn/B%E1%BA%A3o-H%C3%A0nh-R%C6%A1i-V%E1%BB%A1-12-Th%C3%A1ng-cho-iPhone-iPad-Apple-Watch-(Gi%C3%A1-tr%E1%BB%8B-m%C3%A1y-50-Tri%E1%BB%87u)-i.288286284.28361795377*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Voucher & Dịch Vụ'),'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch','description','/img/products/28-1.png', 'Giá trị máy', null, null);
-- insert into applyLabel(productID, labelID) values
-- ((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch'), (select id from labels where text = 'Xử lý'));
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch'), 2);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch'), 1),
-- ((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch'), 2);
insert into productImages(productId, image) values
((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch' limit 1), '/img/products/28-2.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch' limit 1), 1000000, null, '0-5 triệu', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch' limit 1), 1500000, null, '5-10 triệu', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch' limit 1), 2000000, null, '10-15 triệu', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch' limit 1), 2500000, null, '15-20 triệu', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Bảo Hành Rơi Vỡ 12 Tháng cho iPhone, iPad, Apple Watch' limit 1), 3000000, null, '20-25 triệu', null, null, rand()*5000, rand()*1000);

/* 29: https://shopee.vn/B%C4%83ng-Keo-Nano-D%C3%A1n-2-M%E1%BA%B7t-Trong-Su%E1%BB%91t-B%C4%83ng-D%C3%ADnh-2-M%E1%BA%B7t-%C4%90a-N%C4%83ng-i.132665697.7166304326*/
insert into products(categoryId, name, description, image, variation1, variation2, variation3) values
((select id from Categories where name = 'Dụng Cụ & Thiết Bị Tiện Ích'),'Băng Keo Nano Dán 2 Mặt Trong Suốt','description','/img/products/29-1.png', 'Phân loại', null, null);
-- insert into applyVoucher(productId, voucherId) values
-- ((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt'), 5);
-- insert into applyTag(productId, tagId) values
-- ((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt'), 3),
-- ((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt'), 4);
insert into productImages(productId, image) values
((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt' limit 1), '/img/products/29-2.png'),
((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt' limit 1), '/img/products/29-3.png'),
((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt' limit 1), '/img/products/29-4.png');
insert into productVariations(productId, price, image, value1, value2, value3, sold, inStock) values
((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt' limit 1), 20000, null, '1M', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt' limit 1), 30000, null, '3M', null, null, rand()*5000, rand()*1000),
((select id from products where name = 'Băng Keo Nano Dán 2 Mặt Trong Suốt' limit 1), 50000, null, '5M', null, null, rand()*5000, rand()*1000);

-- create table if not exists users (
-- 	id integer not null unique auto_increment,
-- 	username varchar(32) unique,
-- 	hashedPassword char(60),
-- 	displayName varchar(32),
-- 	profilePicture varchar(500),
-- 	firstName varchar(32),
-- 	middleName varchar(32),
-- 	lastName varchar(32),
-- 	primary key(id)
-- );

-- insert into users(username, hashedPassword, displayName, profilePicture) values
-- ('username', '$2b$10$Ud1QXMVEKY8.JSWU2SIqqOAUt2zDAWsIgc0tABvYjL3qGBAcTYfPK', 'The cow that is holy', '/img/user-profile/avatar-1.jpeg'),
-- ('zeropassword', '$2b$10$9Ja.762fY0VoxSMh6sQgsOKhhnMI.QF7tz9oc/B0hAjIlLP9tKWUm', 'The cat that bite', '/img/user-profile/avatar-2.jpeg');

-- create table if not exists userSessions(
-- 	id integer not null unique auto_increment,
--     userId integer not null unique,
--     session varchar(300) unique,
--     expire datetime,
--     primary key (id),
--     foreign key (userId) references users(id)
-- );

-- create table if not exists cartItems(
-- 	id integer not null unique auto_increment,
-- 	userId integer not null,
-- 	productVariationId integer not null,
-- 	amount integer default 0,
-- 	primary key(id),
-- 	foreign key(userId) references users(id),
-- 	foreign key(productVariationId) references productVariations(id),
--   key(userId, productVariationId)
-- );


-- insert into cartItems(userId, productVariationId, amount) values
-- ((select id from users where username = 'username'), (select pv.id from productVariations as pv join products as p on pv.productId = p.id where p.name ='Cây ngoáy tai đầu bông êm ái' and pv.value1 is null and pv.value2 is null ), 1),
-- ((select id from users where username = 'username'), (select pv.id from productVariations as pv join products as p on pv.productId = p.id where p.name ='Túi Đeo Bụng Đựng Điện Thoại' and pv.value1 = 'Hồng' and pv.value2 is null ), 2),
-- ((select id from users where username = 'username'), (select pv.id from productVariations as pv join products as p on pv.productId = p.id where p.name ='Dép Sục Nam Nữ NESTY' and pv.value1 = 'Nâu nhạt' and pv.value2 = '21-22' ), 3),
-- ((select id from users where username = 'username'), (select pv.id from productVariations as pv join products as p on pv.productId = p.id where p.name ='Switch Leobog GrayWood V4' and pv.value1 = 'Leopog' and pv.value2 = 'prelube' ), 4),
-- ((select id from users where username = 'username'), (select pv.id from productVariations as pv join products as p on pv.productId = p.id where p.name ='Bơm xe máy xe đạp nhỏ gọn Kiotool' and pv.value1 is null and pv.value2 is null ), 5);

-- create table if not exists addresses (
-- 	id integer not null unique auto_increment,
-- 	userId integer not null,
-- 	address varchar(500),
-- 	coordinate point,
-- 	primary key (userId, address),
-- 	foreign key(userId) references users(id)
-- );

-- create table if not exists banners(
-- 	id integer not null unique auto_increment,
-- 	image varchar(500),
-- 	link varchar(500),
-- 	dateAdded datetime,
-- 	type varchar(500),
-- 	primary key(id)
-- );

-- insert into banners(image, link, type, dateAdded) values
-- ('/img/banners/main-1.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-2.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-3.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-4.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-5.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-6.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-7.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-8.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-9.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-10.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-11.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-12.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-13.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-14.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-15.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/main-16.webp', '#', 'mainBanner', current_timestamp()),
-- ('/img/banners/sub-1.webp', '#', 'subBanner', current_timestamp()),
-- ('/img/banners/sub-2.webp', '#', 'subBanner', current_timestamp()),
-- ('/img/banners/sub-3.webp', '#', 'subBanner', current_timestamp()),
-- ('/img/banners/sub-4.webp', '#', 'subBanner', current_timestamp());

-- create table if not exists suggestSearches (
-- 	id integer not null unique auto_increment,
-- 	suggest varchar(500),
-- 	link varchar(500),
-- 	primary key(id)
-- );

-- insert into suggestSearches(link, suggest) values
-- ('#', 'Xi măng đồng tháp'),
-- ('#', 'Măng non nội bài'),
-- ('#', 'Bài tiến lên hàn quốc'),
-- ('#', 'Mecha Girl'),
-- ('#', 'Đồ Công Nghệ Độc Lạ'),
-- ('#', 'Ví Kim Loại'),
-- ('#', 'Kit Nhôm'),
-- ('#', 'Đèn Edison'),
-- ('#', 'Mạch Bàn Phím Bluetooth'),
-- ('#', 'EDC');

-- create table if not exists notifications(
-- 	id integer not null unique auto_increment,
-- 	userId integer not null,
-- 	title varchar(500),
-- 	image varchar(500),
-- 	description varchar(500),
-- 	primary key(id),
-- 	foreign key (userId) references users(id)
-- );

-- insert into notifications (userId, title, image, description) values
-- ((select id from users where username ='username'), 'Tham gia khảo sát', '/img/notifications/type-1-voucher-extra.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum impedit quidem voluptate, nisi exercitationem itaque incidunt est rerum, repellat alias eligendi, ut error animi! Qui voluptatem nisi illo, non deleniti dignissimos! Ratione, accusamus? Aspernatur, dolore magni. Repellat reiciendis accusantium odit explicabo. Ea quibusdam tempora ut voluptas in impedit odit? Reprehenderit.'),
-- ((select id from users where username ='username'), 'Giảm giá khủng 40%', '/img/notifications/type-2-voucher-hunting.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum impedit quidem voluptate, nisi exercitationem itaque incidunt est rerum.'),
-- ((select id from users where username ='username'), 'Nhận ngay mã freeship 0đ', '/img/notifications/type-3-note.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum impedit quidem voluptate, nisi exercitationem itaque incidunt est rerum, repellat alias eligendi, ut error animi!'),
-- ((select id from users where username ='username'), 'Giao hàng thành công', '/img/notifications/type-4-fast-delivery.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum impedit quidem voluptate, nisi exercitationem itaque incidunt est rerum, repellat alias eligendi, ut error animi! Qui voluptatem nisi illo, non deleniti dignissimos! Ratione, accusamus? Aspernatur, dolore magni. Repellat reiciendis accusantium odit explicabo. Ea quibusdam tempora ut voluptas in impedit odit? Reprehenderit.'),
-- ((select id from users where username ='username'), 'Hủy đơn hàng thành công', '/img/notifications/type-5-top-deal.png', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.');

-- create table if not exists searchHistories(
-- 	id integer not null unique auto_increment,
-- 	userId integer not null,
-- 	keyword varchar(500) not null,
--     time datetime default now(),
-- 	primary key (id),
-- 	foreign key (userId) references users(id)
-- );

-- insert into searchHistories (userId, keyword) values
-- ((select id from users where username ='username'),'Doraemon tập 77'),
-- ((select id from users where username ='username'),'Conan tập 21'),
-- ((select id from users where username ='username'),'PC 2'),
-- ((select id from users where username ='username'),'Cửa kính'),
-- ((select id from users where username ='username'),'Cửa thủy tinh'),
-- ((select id from users where username ='username'),'Thủy tinh đánh sơn tinh'),
-- ((select id from users where username ='username'),'Tinh Tinh cưỡi rồng');

-- create table if not exists searchAds(
-- 	id integer not null unique auto_increment,
--     keyword varchar(500) not null,
--     link varchar(500),
--     image varchar(500),
--     start date,
--     primary key(id)
-- );

-- insert into searchAds(keyword, link, image, start) values
-- ('Mua 1 tặng 1', '#', '/img/ad-icons/free-ship.png', '2026-02-01'),
-- ('Giảm ngay 50%', '#', '/img/ad-icons/free-ship.png', '2025-06-01'),
-- ('Shopee bao ship 0Đ - Đăng ký ngay', '#', '/img/ad-icons/free-ship.png', '2025-01-01');

-- create table if not exists flashSales(
-- 	id integer not null unique auto_increment,
-- 	start datetime not null,
-- 	end datetime not null,
-- 	primary key(id)
-- );

-- create table if not exists flashSaleItems(
-- 	id integer not null unique auto_increment,
-- 	flashSaleId integer not null,
-- 	productId integer not null,
-- 	percentDiscount integer default 0,
-- 	stamp varchar(500),
-- 	total integer,
-- 	remain integer,
-- 	primary key (id),
-- 	foreign key (flashSaleId) references flashSales(id),
-- 	foreign key (productId) references products(id),
-- 	key(flashSaleId, productId)
-- );

-- insert into flashSales(start, end) values ('2025-11-17', '2026-11-18');
-- insert into flashSaleItems(flashSaleId, productId, percentDiscount, stamp, total, remain) values
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Thắt lưng nam cao cấp'), 30, 'Yêu thích', 100, 90),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Ô Dù Mini gấp gọn'), 27, 'Yêu thích+', 120, 79),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Balo chống gù PTLUXURY'), 99, 'Mall', 314, 217),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Túi cói Merci đi du lịch'), 69, 'Choice', 5, 1),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Tinh Dầu Thơm Thiên Nhiên'), 20, 'Choice', 721, 4),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Dép Nam, Nữ Quai Ngang Đúc Liền Khối Siêu Nhẹ DUWA'), 55, 'Mall', 32, 7),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Thẻ nhớ Micro SD'), 6, 'Yêu thích+', 64, 63),
-- ((select id from flashSales where start = '2025-11-17' and end = '2026-11-18'), (select id from products where name = 'Áo thun ôm body cotton lông mịn'), 1, 'Yêu thích', 22, 11);

-- create table if not exists voucherBanners(
-- 	id integer not null unique auto_increment,
-- 	start date,
-- 	end date,
-- 	name varchar(500),
-- 	image varchar(500),
-- 	link1 varchar(500),
-- 	link2 varchar(500),
-- 	link3 varchar(500),
-- 	primary key (id)
-- );

-- insert into voucherBanners(start, end, name, image, link1, link2, link3) values
-- ('2025-01-01', '2025-06-30', 'january voucher', '/img/voucher-banner/three-voucher.webp', '#','#','#'),
-- ('2025-04-01', '2025-07-30', 'april voucher', '/img/voucher-banner/three-voucher.webp', '#','#','#'),
-- ('2025-05-01', '2025-08-30', 'june voucher', '/img/voucher-banner/three-voucher.webp', '#','#','#'),
-- ('2025-01-01', '2025-12-30', '2025 voucher', '/img/voucher-banner/three-voucher.webp', '#','#','#');

-- create table if not exists mallBanners(
-- 	id integer not null unique auto_increment,
-- 	start date,
-- 	end date,
-- 	name varchar(500),
-- 	image varchar(500),
-- 	link varchar(500),
-- 	primary key (id)
-- );

-- insert into mallBanners(start, end, name, image, link) values
-- ('2025-11-01', '2025-12-30', 'winter banner', '/img/mall-banners/ad-banner.jpg', '#'),
-- ('2025-10-01', '2026-02-27', 'new year banner', '/img/mall-banners/ad-banner.jpg', '#'),
-- ('2025-11-01', '2026-02-27', '2026 banner', '/img/mall-banners/ad-banner.jpg', '#'),
-- ('2025-01-01', '2025-12-30', '2025 banner', '/img/mall-banners/ad-banner.jpg', '#');

-- create table if not exists vendors(
-- 	id integer not null unique auto_increment,
-- 	name varchar(500),
-- 	isMall boolean default false,
-- 	primary key(id)
-- );

-- insert into vendors(name, isMall) values ('Con chồn chồn', false), ('Con đười ươi', true), ('Con mèo mướp', true);

-- create table mallPromotions(
-- 	id integer not null unique auto_increment,
-- 	vendorId integer not null,
-- 	start date,
-- 	end date,
-- 	image varchar(500),
-- 	slogan varchar(500),
-- 	 primary key (id),
-- 		foreign key (vendorId) references vendors(id)
-- );

-- insert into mallPromotions(vendorId, start, end, image, slogan) values
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-1.png', 'Ưu đãi đến 50%'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-2.png', 'Mua 1 được 2'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-3.png', 'Mua 1 tặng 1'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-4.png', 'Mua 1 tặng 1'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-5.png', 'Mua 1 tặng 1'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-6.png', 'Quà mọi đơn'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-7.png', 'Ưu đãi đến 50%'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-8.png', 'Mua là có quà'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-9.png', 'Mua 1 tặng 1'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-10.png', 'Deli siêu sale'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-11.png', 'Mua là có quà'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-12.png', 'Mua 1 tặng 6'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-13.png', 'Mua là có quà'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-14.png', 'Mua là có quà'),
-- ((select id from vendors where isMall = true limit 1), '2025-01-01', '2025-12-30', '/img/mall-promotions/item-15.png', 'Ưu đãi đến 20%');

















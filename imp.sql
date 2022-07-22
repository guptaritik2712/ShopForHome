create database capstone_project_db;
use capstone_project_db;
CREATE TABLE cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
);


CREATE TABLE discount
(
    id character varying(255) NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
);

CREATE TABLE product_category
(
    category_id integer NOT NULL,
    category_name character varying(255) ,
    category_type integer,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
);

ALTER TABLE `product_category` 
CHANGE COLUMN `category_id` `category_id` INT NOT NULL AUTO_INCREMENT ;


CREATE TABLE product_info
(
    product_id character varying(255)  NOT NULL,
    product_name character varying(255)  NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_stock integer NOT NULL,
    product_description character varying(255) ,
     product_icon character varying(255) , 
     product_status integer DEFAULT 0,
    category_type integer DEFAULT 0,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
);

CREATE TABLE users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) ,
    email character varying(255) ,
    name character varying(255) ,
    password character varying(255) ,
    phone character varying(255) ,
    role character varying(255) ,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
);

ALTER TABLE `users` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) ,
    buyer_email character varying(255) ,
    buyer_name character varying(255) ,
    buyer_phone character varying(255) ,
    create_time timestamp,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
);

ALTER TABLE `order_main` 
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE product_in_order
(
    id bigint NOT NULL AUTO_INCREMENT,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255)  NOT NULL,
    product_icon character varying(255) ,
    product_id character varying(255) ,
    product_name character varying(255) ,
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        ,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
);



CREATE TABLE wishlist
(
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp ,
    user_id bigint,
    product_id character varying(255),
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_wish_Fkey FOREIGN KEY (user_id)
        REFERENCES users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE `discount`
ADD COLUMN user_email VARCHAR(255);

ALTER TABLE `discount` 
ADD INDEX `user_email_fkey_idx` (`user_email` ASC) VISIBLE;
;
ALTER TABLE `discount` 
ADD CONSTRAINT `user_email_fkey`
  FOREIGN KEY (`user_email`)
  REFERENCES `users` (`email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `discount` 
DROP PRIMARY KEY;
;

ALTER TABLE `discount` 
ADD COLUMN `coupon` VARCHAR(255) NULL AFTER `user_email`,
CHANGE COLUMN `id` `id` BIGINT NOT NULL ,
ADD PRIMARY KEY (`id`);
;

ALTER TABLE `discount` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



INSERT INTO product_category VALUES (1, 'Curtains', 0, '2022-07-16 19:03:26', '2022-07-16 19:03:26');
INSERT INTO product_category VALUES (2, 'Sofas', 1, '2022-07-16 19:03:27', '2022-07-16 19:03:27');
INSERT INTO product_category VALUES (3, 'Wall Shelves', 2, '2022-07-16 19:03:27', '2022-07-16 19:03:27');
INSERT INTO product_category VALUES (4, 'Metal Wall Art', 3, '2022-07-16 19:03:28', '2022-07-16 19:03:28');

INSERT INTO product_info VALUES ('C01','Blue Polycotton Curtain',3149,25,'Blue Polycotton Light Filtering 5 Feet Eyelet Curtain (Set of 2)','https://ii1.pepperfry.com/media/catalog/product/g/r/1100x1210/green-blackout-cotton-5-feet-eyelet-window-curtain-by-soumya-green-blackout-cotton-5-feet-eyelet-win-qdtejn.jpg',0,0,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('C02','Beige Polyester Floral',712,50,'Skyloom 100% Premium Fabric Floral Self Design Maroon Color Curtain','https://ii1.pepperfry.com/media/catalog/product/b/e/800x880/beige-polyester-florals-5ft-blackout-eyelet-windowcurtain-by-ariana-beige-polyester-florals-5ft-blac-dmqemy.jpg',0,0,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('C03','Silver Polycotton Light Curtain',3129,100,'Stylish. Modern. Rustic. Curtains','https://ii1.pepperfry.com/media/catalog/product/g/r/800x880/grey-blackout-cotton-7-feet-eyelet-door-curtain-by-soumya-grey-blackout-cotton-7-feet-eyelet-door-cu-oxc2sm.jpg',0,0,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('C04','Grey Polyester Solid Curtain',2319,29,'Easy to wash and maintain, this curtain is worth investing in.','https://ii1.pepperfry.com/media/catalog/product/b/e/800x880/beige-polyester-solid-5-feet-blackout-eyelet-curtain-by-rosarahome-beige-polyester-solid-5-feet-blac-3bocea.jpg',0,0,'2022-07-17 19:03:26','2022-07-17 19:03:26');

INSERT INTO product_info VALUES ('S01','Dreamer Single Seater Sofa',10810,78,'Fabric does not lose color with rubbing','https://ii1.pepperfry.com/media/catalog/product/b/a/800x880/barcelona-single-seater-sofa-in-dark-earth-colour-by-wakefit-barcelona-single-seater-sofa-in-dark-ea-yq0rd2.jpg',0,1,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('S02','Napper Single Seater Sofa',8747,85,'Frame material: Neem wood, Support material: MDF & plywood','https://ii1.pepperfry.com/media/catalog/product/n/a/800x880/napper-single-seater-sofa-in-omega-grey-colour-by-wakefit-napper-single-seater-sofa-in-omega-grey-co-bfidwm.jpg',0,1,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('S03','Brawny Single Seater Sofa',12900,67,'The sofas attributed to this style have a streamlined form with low','https://ii1.pepperfry.com/media/catalog/product/m/i/1100x1210/miami-sofa-single-seater-in-sapphire-blue-colour-by-wakefit-miami-sofa-single-seater-in-sapphire-blu-7mxzcv.jpg',0,1,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('S04','Exuberance 1 Seater Single Size ',5185,88,' The sofa come bed can be placed in your living room, bed room','https://ii1.pepperfry.com/media/catalog/product/s/i/1600x1760/single-futon-sofa-cum-bed-with-mattress-in-rust-colour-by-arra-single-futon-sofa-cum-bed-with-mattre-aesxq8.jpg',0,1,'2022-07-17 19:03:26','2022-07-17 19:03:26');

INSERT INTO product_info VALUES ('W01','Wood Wall shelf',1499,52,'Decorate your walls with these well designed and ergonomic wall shelves','https://ii1.pepperfry.com/media/catalog/product/e/n/800x880/engineered-wood-wallshelf-in-white-colour-engineered-wood-wallshelf-in-white-colour-rj35jj.jpg',0,2,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('W02','Marcus Wood & Metal Wall Shelf',849,103,'Decorative metal and wooden hanging wall shelves','https://ii1.pepperfry.com/media/catalog/product/v/e/1600x1760/vega-ladder-shelf-in-grey-and-light-oak-by-ensemble-homes-vega-ladder-shelf-in-grey-and-light-oak-by-lfuvlw.jpg',0,2,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('W03','Siramika Sheesham Book Shelf',3858,90,'Siramika Sheesham Wood Book Shelf in Provincial Teak Finish by Wooden Mood','https://ii1.pepperfry.com/media/catalog/product/s/i/800x880/siramika-sheesham-wood-wall-shelf-in-brown-colour-by-mudramark-siramika-sheesham-wood-wall-shelf-in--gx2gcm.jpg',0,2,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('W04','Wood Wall Mounted Set Top Box',699,200,'Available in a variety of styles and designs, you can use them to organise your essentials or display decorative items','https://ii1.pepperfry.com/media/catalog/product/b/l/800x880/black-engineered-wood-carved-set-top-box-holder-by-home-sparkle-black-engineered-wood-carved-set-top-mfldne.jpg',0,2,'2022-07-17 19:03:26','2022-07-17 19:03:26');

INSERT INTO product_info VALUES ('M01','Iron Decorative Flower',2496,80,'This astoundingly designed Metal Art is durable and unique looking','https://ii1.pepperfry.com/media/catalog/product/b/l/1600x1760/blue--iron-blue-round-wall-art-by-the-shining-rays-blue--iron-blue-round-wall-art-by-the-shining-ray-t9zjym.jpg',0,3,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('M02','Iron Abstract Wall Art',1539,99,'Metal Wall Hanging Excellent home decor','https://ii1.pepperfry.com/media/catalog/product/m/e/800x880/metal-decorative-wall-art-in-multicolour-by-malik-design-metal-decorative-wall-art-in-multicolour-by-591bhg.jpg',0,3,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('M03','Iron Abstract Wall Art ',3952,500,'A perfect choice for for Living Room and bed room wall painting','https://ii1.pepperfry.com/media/catalog/product/v/e/800x880/velvet-laminated-modern-art-set-of-5-wall-art-panels-by-wens-velvet-laminated-modern-art-set-of-5-wa-z0qtbu.jpg',0,3,'2022-07-17 19:03:26','2022-07-17 19:03:26');
INSERT INTO product_info VALUES ('M04','Wrought Iron Butterfly Wall Art',999,90,'Add oodles of class to your roomwall by picking from our creative range of wall hangings','https://ii1.pepperfry.com/media/catalog/product/i/r/800x880/iron-alexa-butterfly-family-metal-wall-art-by-vedas-iron-alexa-butterfly-family-metal-wall-art-by-ve-0mwgmy.jpg',0,3,'2022-07-17 19:03:26','2022-07-17 19:03:26');

INSERT INTO users VALUES (1, true, 'Plot 456, Nargarjuna Nagar, Delhi', 'admin@gmail.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');





--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 24632)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24631)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 212 (class 1259 OID 24639)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24638)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 214 (class 1259 OID 24646)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24645)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 216 (class 1259 OID 24653)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24652)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 218 (class 1259 OID 24662)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24672)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24671)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 217 (class 1259 OID 24661)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3204 (class 2604 OID 24635)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 24642)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 24649)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 24656)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 24665)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 24675)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3371 (class 0 OID 24632)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES (1, 'Одежда');
INSERT INTO public.category VALUES (2, 'Мебель');
INSERT INTO public.category VALUES (3, 'Бытовая техника');
INSERT INTO public.category VALUES (4, 'Прочее');


--
-- TOC entry 3373 (class 0 OID 24639)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image VALUES (6, 'f0256f53-d20b-4efe-b7bf-0cd9fa5fba35.1.jpg', 2);
INSERT INTO public.image VALUES (7, '546a5b00-d578-43b4-9846-6dc88723837c.2.jpg', 2);
INSERT INTO public.image VALUES (8, '2d7e271b-97f8-4f1e-bb21-aaa5ddbf1ac6.3.jpg', 2);
INSERT INTO public.image VALUES (9, '6b79b2f4-b008-405f-a68f-147cef95363f.4.jpg', 2);
INSERT INTO public.image VALUES (10, '6f27ce19-1f04-4210-918f-a1f92ee2334e.5.jpg', 2);
INSERT INTO public.image VALUES (11, '55f85f97-8d65-4c28-8d1f-89f3155a79eb.1.jpg', 3);
INSERT INTO public.image VALUES (12, '0f26994f-fc09-4992-8bc7-42907e29de0f.2.jpg', 3);
INSERT INTO public.image VALUES (13, 'e57a27fb-ec89-42ce-ad8d-31728355586a.3.jpg', 3);
INSERT INTO public.image VALUES (14, '0d83a62c-312e-4cde-a86f-fc923c7b54dc.4.jpg', 3);
INSERT INTO public.image VALUES (15, '9cc65f86-ef95-4dd4-b246-8c1049923b1b.5.jpg', 3);
INSERT INTO public.image VALUES (21, 'baca22e3-a652-46e6-8d38-33192e7131fe.1.jpeg', 5);
INSERT INTO public.image VALUES (22, 'caee55e7-bf24-467c-8e1e-bd1b64686bd5.2.jpg', 5);
INSERT INTO public.image VALUES (23, '4ed0bbe3-9c88-492f-9032-a9d0477c908c.3.jpg', 5);
INSERT INTO public.image VALUES (24, '97dd0874-bbfd-4eb8-9342-3c3bdbe65bf2.4.jpg', 5);
INSERT INTO public.image VALUES (25, 'a39839e2-cf03-4b6b-84e9-32cc01f937b0.5.jpg', 5);
INSERT INTO public.image VALUES (26, '265142a9-562b-408f-842a-dd41d46a6403.1.jpg', 6);
INSERT INTO public.image VALUES (27, '940a2ae2-2c9f-4fa3-928a-9cf670952074.2.jpg', 6);
INSERT INTO public.image VALUES (28, 'a0782535-7484-40ee-a4a6-03631f2e63b4.3.jpg', 6);
INSERT INTO public.image VALUES (29, '1698051b-31f5-409f-a5bd-a93f945edc21.4.jpg', 6);
INSERT INTO public.image VALUES (30, '12dcd7a5-8e02-4fe0-b45e-33f3d565342c.5.jpg', 6);
INSERT INTO public.image VALUES (31, '6852a6fc-d431-4211-a389-95c1419ea338.1.jpg', 7);
INSERT INTO public.image VALUES (32, '2f2edc1e-1ac1-437f-8ff9-fc1737ff684f.2.jpg', 7);
INSERT INTO public.image VALUES (33, 'a54f1ed5-f460-4001-94c7-460c1a1baff4.3.jpg', 7);
INSERT INTO public.image VALUES (34, '7183ede3-fbcd-44bd-adc9-47e06681da72.4.jpg', 7);
INSERT INTO public.image VALUES (35, '750c1ad1-ea28-44e2-858e-5509d40e319b.5.jpg', 7);
INSERT INTO public.image VALUES (36, '2f912349-8a46-4feb-80a9-a50170c179e8.1 (1).jpg', 8);
INSERT INTO public.image VALUES (37, '38d99588-e1af-4dcf-a04b-ac704915188a.2.jpg', 8);
INSERT INTO public.image VALUES (38, '6dcacaf6-e654-4e4b-b5af-27601d2290e1.3.jpg', 8);
INSERT INTO public.image VALUES (39, 'c903831f-b453-4bc5-9963-3be67fc3037f.4.jpg', 8);
INSERT INTO public.image VALUES (40, '06acfcc6-0c73-487a-a079-2933f67b64a8.5.jpg', 8);
INSERT INTO public.image VALUES (41, '4975c6ba-89de-413e-b2b8-428454626d54.1 .jpeg', 9);
INSERT INTO public.image VALUES (42, '7df92a66-55e7-4b0e-b25c-15ed9da9c142.2.jpg', 9);
INSERT INTO public.image VALUES (43, '1987db9a-e7a1-45be-b333-da7614192895.3.jpg', 9);
INSERT INTO public.image VALUES (44, 'fa799fed-975b-4011-b4b7-d0ec74b1ee50.4.jpg', 9);
INSERT INTO public.image VALUES (45, '1b36b653-4ff2-4371-aa71-1e26ab527c25.5.jpg', 9);
INSERT INTO public.image VALUES (46, 'a6066e35-07f9-4c61-8ee7-163d49aca418.4.jpeg', 10);
INSERT INTO public.image VALUES (47, 'a985e12c-ccd8-4c23-af34-b762247b39da.1.jpg', 10);
INSERT INTO public.image VALUES (48, '93efdff4-0edf-49d6-9495-74b916b406fc.2.jpeg', 10);
INSERT INTO public.image VALUES (49, '74b2b1b8-107b-4ae6-ae6d-c1bd41398b1b.3.jpg', 10);
INSERT INTO public.image VALUES (50, '3e0477f3-c159-4e30-a497-2974b2cd90ae.5.jpg', 10);
INSERT INTO public.image VALUES (51, '7a7cdbd4-691a-4196-ac09-f727051c53a8.1.jpg', 11);
INSERT INTO public.image VALUES (52, 'f0f3df4a-6f56-4225-9cfe-c3733f1097a9.2.jpg', 11);
INSERT INTO public.image VALUES (53, 'be1cc522-326f-4299-9682-cca3451740fb.3.jpg', 11);
INSERT INTO public.image VALUES (54, '9f797cec-71b1-448a-a1ca-f23ea6e16d5e.4.jpg', 11);
INSERT INTO public.image VALUES (55, '040b7d76-22f2-4428-8394-55196e117edf.5.jpg', 11);


--
-- TOC entry 3375 (class 0 OID 24646)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (10, 1, '2023-04-21 23:26:12.724216', 'abdb29a3-cca6-40ba-8da2-9bbd00734457', 39600, 0, 3, 2);
INSERT INTO public.orders VALUES (9, 1, '2023-04-21 23:26:12.552523', 'abdb29a3-cca6-40ba-8da2-9bbd00734457', 39600, 0, 3, 2);
INSERT INTO public.orders VALUES (5, 1, '2023-04-21 23:25:50.995685', 'f2e48b0f-4feb-4afc-89d4-1c58fe18778f', 39600, 2, 3, 2);
INSERT INTO public.orders VALUES (6, 1, '2023-04-21 23:25:51.435584', 'f2e48b0f-4feb-4afc-89d4-1c58fe18778f', 39600, 2, 3, 2);
INSERT INTO public.orders VALUES (7, 1, '2023-04-21 23:25:51.550708', 'f2e48b0f-4feb-4afc-89d4-1c58fe18778f', 39600, 2, 3, 2);
INSERT INTO public.orders VALUES (8, 1, '2023-04-21 23:25:51.715457', 'f2e48b0f-4feb-4afc-89d4-1c58fe18778f', 39600, 2, 3, 2);
INSERT INTO public.orders VALUES (2, 1, '2023-04-21 22:39:13.897491', '3a3a6def-4e88-479d-bc8f-43c672520daf', 39600, 1, 2, 2);
INSERT INTO public.orders VALUES (3, 1, '2023-04-21 22:39:14.514617', '3a3a6def-4e88-479d-bc8f-43c672520daf', 39600, 1, 2, 2);
INSERT INTO public.orders VALUES (4, 1, '2023-04-21 22:39:14.87552', '3a3a6def-4e88-479d-bc8f-43c672520daf', 39600, 1, 2, 2);
INSERT INTO public.orders VALUES (1, 1, '2023-04-20 15:56:33.686009', '907fe1e3-7544-46e3-82bf-830481b600bb', 39600, 3, 2, 2);
INSERT INTO public.orders VALUES (11, 1, '2023-04-22 23:57:30.456314', '0336a3ab-e40e-4af1-8bec-3acfcd83a9cc', 2520, 1, 4, 3);


--
-- TOC entry 3377 (class 0 OID 24653)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person VALUES (1, 'admin', '$2a$10$w.D4vDV/P0X7xwUfTKhCKOirQexSy8J/SQ1e37lpRmZF176Q/5UUO', 'ROLE_ADMIN');
INSERT INTO public.person VALUES (3, 'user2', '$2a$10$SNazH1UqTnv5yRXFx9hl4OtZA9KgxgfiFmg3wrA5Egqionuaz7ZKy', 'ROLE_USER');
INSERT INTO public.person VALUES (2, 'user1', '$2a$10$vllthGVE7rqxWCHQ5ztyUuXKaijb6H2VaJb8dXGu8V/rIyyTjRrGG', 'ROLE_USER');
INSERT INTO public.person VALUES (4, 'user3', '$2a$10$hOVRzyHqLev669/WJdVYt.489fvKF01FPF4uTyA.cHhbfabMZJA6e', 'ROLE_USER');


--
-- TOC entry 3379 (class 0 OID 24662)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product VALUES (5, '2023-04-23 01:09:24.760708', 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.', 3000, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Коледино', 2);
INSERT INTO public.product VALUES (2, NULL, 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 39600, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино', 2);
INSERT INTO public.product VALUES (3, '2023-04-22 17:52:38.611185', 'Описание: Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129.', 2520, 'Стендмебель - фабрика мебели', 'Стендмебель Обувница Джулия СТМ, тумба для обуви', 'Коледино', 2);
INSERT INTO public.product VALUES (6, '2023-04-23 01:10:46.363069', 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1450, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 1);
INSERT INTO public.product VALUES (7, '2023-04-23 01:12:05.450063', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 1);
INSERT INTO public.product VALUES (8, '2023-04-23 01:13:01.12878', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 1);
INSERT INTO public.product VALUES (9, '2023-04-23 01:14:41.672646', '5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.', 10999, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)', 'Коледино', 3);
INSERT INTO public.product VALUES (10, '2023-04-23 01:16:00.34259', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 3);
INSERT INTO public.product VALUES (11, '2023-04-23 01:17:39.335747', 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.', 33615, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 3);


--
-- TOC entry 3381 (class 0 OID 24672)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 55, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 11, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 13, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 11, true);


--
-- TOC entry 3212 (class 2606 OID 24637)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 24644)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 24651)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 24660)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 24677)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 24670)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 24679)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3226 (class 2606 OID 24685)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3228 (class 2606 OID 24695)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3227 (class 2606 OID 24690)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3225 (class 2606 OID 24680)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3230 (class 2606 OID 24705)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3229 (class 2606 OID 24700)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);

--
-- PostgreSQL database dump complete
--


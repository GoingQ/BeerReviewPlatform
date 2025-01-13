set names utf8mb4;
set charset utf8mb4;
drop database if exists beer;
create database beer charset utf8mb4;
use beer;

create table countries (
	id int unsigned not null auto_increment primary key,
	name varchar(255) not null unique
);

insert into countries(name) values
('Belgium'),
('Germany'),
('Czech Republic'),
('United States'),
('United Kingdom'),
('Ireland'),
('Mexico'),
('Netherlands'),
('France'),
('Denmark'),
('Austria'),
('Japan');

create table ABV (
	id int unsigned not null auto_increment primary key,
	name varchar(255) not null unique
);

insert into ABV(name) values
('5.0% - 5.5%'),
('5.5% - 6.0%'),
('4.0% - 4.5%'),
('6.0% - 7.0%'),
('above 7.0%');

create table Style (
	id int unsigned not null auto_increment primary key,
	name varchar(255) not null unique
);

insert into Style(name) values
('Pale Lager'),
('Pilsner'),
('Amber Ale'),
('Irish Stout'),
('Belgian Strong Pale Ale'),
('Helles Lager'),
('Pale Ale'),
('Creamy Stout'),
('American Lager'),
('Japanese Lager'),
('Trappist Ale'),
('Craft Lager'),
('Wheat Beer'),
('Golden Ale'),
('Full-bodied Lager');

create table Flavour (
    id int unsigned not null auto_increment primary key,
    name varchar(255) not null unique
);

insert into Flavour(name) values
('Malty'),
('Hoppy'),
('Crisp'),
('Bitter'),
('Fruity'),
('Roasty'),
('Sweet'),
('Sour'),
('Smooth'),
('Spicy'),
('Coffee'),
('Chocolate'),
('Clean'),
('Bready'),
('Light'),
('Herbal'),
('Citrusy');

create table beer (
    id int unsigned not null auto_increment primary key,
    name varchar(255) not null unique,
    countryId int unsigned not null,
    constraint beer_countries foreign key(countryId) references countries(id),
    styleId int unsigned not null,
    constraint beer_style foreign key(styleId) references Style(id),
    abvId int unsigned not null,
    constraint beer_abv foreign key(abvId) references ABV(id),
    likes int unsigned not null default 0,
    dislikes int unsigned not null default 0,
    version int unsigned not null default 0
);

insert into beer(name, countryId, styleId, abvId) values
-- Belgium
('Duvel', 1, 5, 1),  -- Duvel: 5.0% - 5.5%
('Leffe Blonde', 1, 5, 2),  -- Leffe Blonde: 5.5% - 6.0%
('Chimay Blue', 1, 12, 3),  -- Chimay Blue: 4.0% - 4.5%
('Westvleteren 12', 1, 12, 4),  -- Westvleteren 12: 6.0% - 7.0%

-- Germany
('Weihenstephaner', 2, 1, 5),  -- Weihenstephaner: 5.0% - 5.5%
('Paulaner Hefe-Weißbier', 2, 6, 4),  -- Paulaner Hefe-Weißbier: 5.5% - 6.0%
('Erdinger Weissbier', 2, 6, 2),  -- Erdinger Weissbier: 4.0% - 4.5%
('Beck\'s', 2, 1, 1),  -- Beck's: 5.0% - 5.5%

-- Czech Republic
('Pilsner Urquell', 3, 2, 2),  -- Pilsner Urquell: 4.0% - 4.5%
('Budvar', 3, 2, 3),  -- Budvar: 6.0% - 7.0%
('Staropramen', 3, 2, 1),  -- Staropramen: 5.0% - 5.5%

-- United States
('Budweiser', 4, 7, 4),  -- Budweiser: 5.5% - 6.0%
('Coors Light', 4, 7, 1),  -- Coors Light: 5.0% - 5.5%
('Stone IPA', 4, 7, 5),  -- Stone IPA: 5.0% - 5.5%
('Samuel Adams Boston Lager', 4, 7, 2),  -- Samuel Adams Boston Lager: 4.0% - 4.5%
('Miller Lite', 4, 7, 3),  -- Miller Lite: 6.0% - 7.0%

-- United Kingdom
('Bass Pale Ale', 5, 7, 1),  -- Bass Pale Ale: 5.0% - 5.5%
('Fuller\'s London Pride', 5, 5, 4),  -- Fuller's London Pride: 5.5% - 6.0%
('Newcastle Brown Ale', 5, 3, 2),  -- Newcastle Brown Ale: 4.0% - 4.5%
('Beavertown Neck Oil', 5, 7, 3),  -- Beavertown Neck Oil: 6.0% - 7.0%

-- Ireland
('Guinness', 6, 4, 2),  -- Guinness: 5.0% - 5.5%
('Murphy\'s Irish Stout', 6, 4, 1),  -- Murphy's Irish Stout: 5.0% - 5.5%
('Smithwick\'s', 6, 4, 3),  -- Smithwick's: 4.0% - 4.5%

-- Mexico
('Corona', 7, 6, 1),  -- Corona: 5.0% - 5.5%
('Modelo Especial', 7, 6, 4),  -- Modelo Especial: 5.5% - 6.0%
('Pacifico', 7, 6, 5),  -- Pacifico: 5.0% - 5.5%
('Negra Modelo', 7, 6, 3),  -- Negra Modelo: 6.0% - 7.0%

-- Netherlands
('Heineken', 8, 1, 1),  -- Heineken: 5.0% - 5.5%
('Amstel', 8, 1, 3),  -- Amstel: 6.0% - 7.0%
('Grolsch', 8, 1, 2),  -- Grolsch: 5.5% - 6.0%

-- France
('Kronenbourg 1664', 9, 5, 2),  -- Kronenbourg 1664: 4.0% - 4.5%
('1664 Blanc', 9, 5, 5),  -- 1664 Blanc: 5.0% - 5.5%
('Pelforth', 9, 1, 3),  -- Pelforth: 6.0% - 7.0%

-- Denmark
('Carlsberg', 10, 1, 4),  -- Carlsberg: 5.5% - 6.0%
('Tuborg', 10, 1, 2),  -- Tuborg: 4.0% - 4.5%

-- Austria
('Stiegl', 11, 1, 5),  -- Stiegl: 5.0% - 5.5%
('Zipfer', 11, 1, 1),  -- Zipfer: 5.0% - 5.5%

-- Japan
('Asahi', 12, 1, 3),  -- Asahi: 5.5% - 6.0%
('Sapporo', 12, 1, 1),  -- Sapporo: 5.0% - 5.5%
('Kirin', 12, 1, 4);  -- Kirin: 6.0% - 7.0%

create table beerFlavours (
    beerId int unsigned not null,
    constraint beerFlavours_beer foreign key(beerId) references beer(id),
    flavourId int unsigned not null,
    constraint beerFlavours_flavour foreign key(flavourId) references Flavour(id)
);

insert into beerFlavours(beerId, flavourId) values
-- Belgium
(1, 1), (1, 2), (1, 3), (1, 4),  -- Duvel: Malty, Hoppy, Crisp, Bitter
(2, 5), (2, 6), (2, 3), (2, 7),  -- Leffe Blonde: Fruity, Roasty, Crisp, Sweet
(3, 8), (3, 9), (3, 10), (3, 11), -- Chimay Blue: Sour, Spicy, Coffee, Chocolate
(4, 1), (4, 9),  -- Westvleteren 12: Malty, Smooth

-- Germany
(5, 5), (5, 3), (5, 4), (5, 7), -- Weihenstephaner: Fruity, Roasty, Bitter, Sweet
(6, 12), (6, 1), (6, 13), (6, 4), -- Paulaner Hefe-Weißbier: Roasty, Malty, Bready, Light
(7, 12), (7, 6), (7, 9), (7, 11), -- Erdinger Weissbier: Roasty, Fruity, Sour, Coffee
(8, 5), (8, 3), (8, 14), (8, 9), -- Beck's: Bitter, Clean, Bready, Smooth

-- Czech Republic
(9, 5), (9, 3), (9, 9), (9, 14), -- Pilsner Urquell: Fruity, Sour, Smooth, Bready
(10, 12), (10, 1), (10, 6), (10, 13), -- Budvar: Sour, Malty, Herbal, Roasty
(11, 1), (11, 9), (11, 8), (11, 4), -- Staropramen: Malty, Smooth, Sweet, Bitter

-- United States
(12, 2), (12, 8), (12, 7), (12, 3), -- Budweiser: Hoppy, Clean, Sweet, Roasty
(13, 5), (13, 3), (13, 14), (13, 6), -- Coors Light: Fruity, Crisp, Bready, Light
(14, 1), (14, 7), (14, 5), (14, 11), -- Stone IPA: Malty, Sour, Fruity, Clean
(15, 6), (15, 2), (15, 10), (15, 9), -- Samuel Adams Boston Lager: Roasty, Bready, Spicy, Smooth
(16, 7), (16, 6), (16, 8), (16, 5), -- Miller Lite: Sweet, Fruity, Roasty, Malty

-- United Kingdom
(17, 8), (17, 5), (17, 3), (17, 14), -- Bass Pale Ale: Sour, Fruity, Bitter, Clean
(18, 9), (18, 1), (18, 7), (18, 4), -- Fuller's London Pride: Smooth, Malty, Sweet, Bitter
(19, 5), (19, 3), (19, 8), (19, 10), -- Newcastle Brown Ale: Fruity, Sour, Bready, Citrusy
(20, 7), (20, 5), (20, 11), (20, 6), -- Beavertown Neck Oil: Sweet, Roasty, Clean, Bready

-- Ireland
(21, 12), (21, 9), (21, 10), (21, 4), -- Guinness: Fruity, Smooth, Spicy, Bitter
(22, 13), (22, 1), (22, 6), (22, 3), -- Murphy's Irish Stout: Roasty, Malty, Sour, Clean
(23, 10), (23, 6), (23, 12), (23, 7), -- Smithwick's: Citrusy, Fruity, Roasty, Sweet

-- Mexico
(24, 11), (24, 2), (24, 7), (24, 8), -- Corona: Clean, Hoppy, Sweet, Fruity
(25, 12), (25, 7), (25, 6), (25, 1), -- Modelo Especial: Fruity, Roasty, Sweet, Malty
(26, 5), (26, 2), (26, 6), (26, 9), -- Pacifico: Fruity, Hoppy, Bready, Smooth
(27, 3), (27, 7), (27, 8), (27, 4), -- Negra Modelo: Clean, Roasty, Bready, Light

-- Netherlands
(28, 5), (28, 6), (28, 8), (28, 9), -- Heineken: Sweet, Fruity, Roasty, Citrusy
(29, 3), (29, 7), (29, 10), (29, 1), -- Amstel: Roasty, Bready, Sweet, Malty
(30, 1), (30, 13), (30, 2), (30, 4), -- Grolsch: Malty, Citrusy, Hoppy, Bitter

-- France
(31, 5), (31, 7), (31, 1), (31, 6), -- Kronenbourg 1664: Fruity, Sweet, Malty, Clean
(32, 6), (32, 8), (32, 7), (32, 4), -- 1664 Blanc: Roasty, Hoppy, Clean, Sour
(33, 12), (33, 10), (33, 9), (33, 14), -- Pelforth: Smooth, Sweet, Citrusy, Bitter

-- Denmark
(34, 5), (34, 3), (34, 9), (34, 10), -- Carlsberg: Fruity, Sour, Smooth, Citrusy
(35, 2), (35, 7), (35, 1), (35, 8), -- Tuborg: Hoppy, Sweet, Malty, Roasty

-- Austria
(36, 4), (36, 8), (36, 1), (36, 5), -- Stiegl: Bitter, Roasty, Clean, Fruity
(37, 2), (37, 6), (37, 7), (37, 3), -- Zipfer: Fruity, Malty, Sweet, Sour

-- Japan
(38, 5), (38, 1), (38, 10), (38, 9), -- Asahi: Sweet, Fruity, Bitter, Roasty
(39, 4), (39, 6), (39, 7), (39, 2), -- Sapporo: Roasty, Citrusy, Clean, Sweet
(40, 3), (40, 8), (40, 12), (40, 5); -- Kirin: Bready, Sour, Fruity, Light

create table webPages(
    beerId int unsigned not null,
    constraint webPages_beer foreign key(beerId) references beer(id),
    url varchar(255) not null
);

-- Inserting web pages related to specific beers
insert into webPages(beerId, url) values
(29, "https://en.wikipedia.org/wiki/Mondseer"),
(29, "https://www.cheese.com/mondseer/"),
(29, "https://www.tasteatlas.com/mondseer"),

-- Adding web pages for new beers (for example, more Belgian beers)
(1, "https://www.duvel.com/en/"),
(1, "https://en.wikipedia.org/wiki/Duvel"),
(2, "https://www.leffe.com/en/"),
(2, "https://en.wikipedia.org/wiki/Leffe_Blonde"),
(3, "https://chimay.com/en/"),
(3, "https://en.wikipedia.org/wiki/Chimay"),
(4, "https://westvleteren.be/"),
(4, "https://en.wikipedia.org/wiki/Westvleteren_12"),

-- German beers web pages
(5, "https://www.weihenstephaner.de/en/"),
(5, "https://en.wikipedia.org/wiki/Weihenstephan"),
(6, "https://www.paulaner.de/en/"),
(6, "https://en.wikipedia.org/wiki/Paulaner"),
(7, "https://www.erdinger.de/en/"),
(7, "https://en.wikipedia.org/wiki/Erdinger_Weissbräu"),
(8, "https://www.becks.de/"),
(8, "https://en.wikipedia.org/wiki/Beck%27s"),

-- Adding more web pages for US beers
(9, "https://www.budweiser.com/"),
(9, "https://en.wikipedia.org/wiki/Budweiser"),
(10, "https://www.coorslight.com/"),
(10, "https://en.wikipedia.org/wiki/Coors_Light"),
(11, "https://www.stonebrewing.com/"),
(11, "https://en.wikipedia.org/wiki/Stone_Brewing"),
(12, "https://www.samueladams.com/"),
(12, "https://en.wikipedia.org/wiki/Samuel_Adams"),

-- United Kingdom beers
(13, "https://www.bass.com/"),
(13, "https://en.wikipedia.org/wiki/Bass_Pale_Ale"),
(14, "https://www.guinness.com/"),
(14, "https://en.wikipedia.org/wiki/Guinness"),
(15, "https://www.fullersbrewery.com/"),
(15, "https://en.wikipedia.org/wiki/London_Pride"),
(16, "https://www.newcastlebrewery.com/"),
(16, "https://en.wikipedia.org/wiki/Newcastle_Brown_Ale"),

-- Ireland
(17, "https://www.murphysirishstout.com/"),
(17, "https://en.wikipedia.org/wiki/Murphy%27s"),
(18, "https://www.smithwicks.com/"),
(18, "https://en.wikipedia.org/wiki/Smithwick%27s"),

-- Mexican beers
(19, "https://www.corona.com/"),
(19, "https://en.wikipedia.org/wiki/Corona_Beer"),
(20, "https://www.modelousa.com/"),
(20, "https://en.wikipedia.org/wiki/Modelo_Especial"),
(21, "https://www.pacificobeer.com/"),
(21, "https://en.wikipedia.org/wiki/Pacifico"),
(22, "https://www.negra-modelo.com/"),
(22, "https://en.wikipedia.org/wiki/Negra_Modelo"),

-- Dutch beers
(23, "https://www.heineken.com/"),
(23, "https://en.wikipedia.org/wiki/Heineken"),
(24, "https://www.amstel.com/"),
(24, "https://en.wikipedia.org/wiki/Amstel"),
(25, "https://www.grolsch.com/"),
(25, "https://en.wikipedia.org/wiki/Grolsch"),

-- Adding web pages for French beers
(26, "https://www.kronenbourg.com/"),
(26, "https://en.wikipedia.org/wiki/Kronenbourg_1664"),
(27, "https://www.1664blanc.com/"),
(27, "https://en.wikipedia.org/wiki/1664_Blanc"),
(28, "https://www.pelforth.com/"),
(28, "https://en.wikipedia.org/wiki/Pelforth"),

-- Austrian beers
(29, "https://www.stiegl.at/en/"),
(29, "https://en.wikipedia.org/wiki/Stiegl"),
(30, "https://www.zipfer.at/"),
(30, "https://en.wikipedia.org/wiki/Zipfer"),

-- Japanese beers
(31, "https://www.asahibeer.com/"),
(31, "https://en.wikipedia.org/wiki/Asahi"),
(32, "https://www.sapporobeer.jp/"),
(32, "https://en.wikipedia.org/wiki/Sapporo"),
(33, "https://www.kirinbeer.jp/"),
(33, "https://en.wikipedia.org/wiki/Kirin");

-- Create the user if it doesn't exist
create user if not exists project identified by 'project';

-- Granting select and insert permissions on the relevant tables
grant select, insert on countries to project;
grant select, insert on Flavour to project;
grant select, insert on ABV to project;
grant select, insert on Style to project;

-- Granting select, insert, and update permissions on the beer table
grant select, insert, update on beer to project;

-- Granting select and insert permissions on related tables
grant select, insert on beerFlavours to project;
grant select, insert on webPages to project;
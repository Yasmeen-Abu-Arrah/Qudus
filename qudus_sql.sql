-- QUDUS DATABASE SCHEMA --

create database if not exists qudus
character set utf8mb4 collate utf8mb4_unicode_ci;
use qudus;

create table if not exists artifacts(
    id int auto_increment,
    name varchar(50) not null,
    description text,
    origin varchar(50),
    period varchar(50),
    material varchar(50),
    condition_status enum('Excellent', 'Good', 'Needs Maintenance'),
    location varchar(50),
    image_url varchar(255),
    acquisition_date date,

    constraint `artifacts_pk` primary key (id)
);

create table if not exists staff(
    id int auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    role enum('Admin', 'Curator', 'Guide', 'Designer', 'Security', 'Volunteer') not null,
    email varchar(50) not null unique,
    phone varchar(15),
    hire_date date,

    constraint `staff_pk` primary key (id)
);

create table if not exists artists(
    id int auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(50) not null unique,
    bio text,

    constraint `artists_pk` primary key (id)
);

create table if not exists artworks(
    id int auto_increment,
    title varchar(50) not null,
    description text,
    artwork_type varchar(50),
    creation_year year,
    location varchar(100),
    image_url varchar(255),
    artist_id int,

    constraint `artworks_pk` primary key (id),
    constraint `artworks_artist_id_fk` foreign key (artist_id) references artists(id)
);

create table if not exists exhibitions(
    id int auto_increment,
    title varchar(50) not null,
    start_date date not null,
    end_date date not null,
    description text,
    status enum('Upcoming', 'Ongoing', 'Past') default 'Upcoming',
    manager_id int not null,

    constraint `exhibitions_pk` primary key (id),
    constraint `exhibitions_manager_id_fk` foreign key (manager_id) references staff(id)
);

create table if not exists visitors(
    id int auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(50) not null unique,
    phone varchar(15),

    constraint `visitors_pk` primary key (id)
);

create table if not exists visits(
    id int auto_increment,
    visitor_id int not null,
    exhibition_id int,
    visit_date date default current_date,
    feedback text,
    rating int check (rating between 1 and 5),

    constraint `visits_pk` primary key (id),
    constraint `visits_visitor_id_fk` foreign key (visitor_id) references visitors(id),
    constraint `visits_exhibition_id_fk` foreign key (exhibition_id) references exhibitions(id)
);

create table if not exists printer_requests(
    id int auto_increment,
    request_type varchar(100) not null,
    request_date date default current_date,
    status enum('Pending', 'Approved', 'Printed', 'Delivered', 'Rejected') default 'Pending',
    file_path varchar(255),
    designer_id int not null,

    constraint `requests_pk` primary key (id),
    constraint `requests_designer_id_fk` foreign key (designer_id) references staff(id),
);

create table if not exists exhibition_artifacts( -- includes
    exhibition_id int not null,
    artifact_id int not null,
    added_date timestamp default current_timestamp,

    constraint `exhibition_artifacts_pk` primary key (exhibition_id, artifact_id),
    constraint `exhibition_artifacts_exhibition_id_fk` foreign key (exhibition_id) references exhibitions(id),
    constraint `exhibition_artifacts_artifact_id_fk` foreign key (artifact_id) references artifacts(id)
);

create table if not exists exhibition_artworks(  -- includes
    exhibition_id int not null,
    artwork_id int not null,
    added_date timestamp default current_timestamp,

    constraint `exhibition_artworks_pk` primary key (exhibition_id, artwork_id),
    constraint `exhibition_artworks_exhibition_id_fk` foreign key (exhibition_id) references exhibitions(id),
    constraint `exhibition_artworks_artwork_id_fk` foreign key (artwork_id) references artworks(id)
);

create table if not exists exhibition_staff( -- works_on 
    exhibition_id int not null,
    staff_id int not null,
    role_in_exhibition varchar(50),
    assigned_date timestamp default current_timestamp,

    constraint `exhibition_staff_pk` primary key (exhibition_id, staff_id),
    constraint `exhibition_staff_exhibition_id_fk` foreign key (exhibition_id) references exhibitions(id),
    constraint `exhibition_staff_staff_id_fk` foreign key (staff_id) references staff(id)
);

create table if not exists requests_artifacts( -- to_print // 3D printing requests for artifacts
    request_id int not null,
    artifact_id int not null,
    scale decimal(5,2) default 1.00,
    material_used varchar(50),

    constraint `requests_artifacts_pk` primary key (request_id, artifact_id),
    constraint `requests_artifacts_request_id_fk` foreign key (request_id) references printer_requests(id),
    constraint `requests_artifacts_artifact_id_fk` foreign key (artifact_id) references artifacts(id)
);

create table if not exists requests_artworks( -- to_print // 3D printing requests for artworks
    request_id int not null,
    artwork_id int not null,
    scale decimal(5,2) default 1.00,
    material_used varchar(50),

    constraint `requests_artworks_pk` primary key (request_id, artwork_id),
    constraint `requests_artworks_request_id_fk` foreign key (request_id) references printer_requests(id),
    constraint `requests_artworks_artwork_id_fk` foreign key (artwork_id) references artworks(id)
);

create table if not exists visitors_requests( -- sales tracking / payments 
    visitor_id int not null,
    request_id int not null,
    price decimal(10,2) not null,
    payment_method enum('Cash', 'Credit Card', 'Mobile Payment', 'Bank Transfer') not null,
    currency VARCHAR(3) DEFAULT 'ILS',
    payment_date timestamp default current_timestamp,
    status enum('Paid', 'Pending', 'Failed') default 'Pending',

    constraint `visitors_requests_pk` primary key (visitor_id, request_id),
    constraint `visitors_requests_visitor_id_fk` foreign key (visitor_id) references visitors(id),
    constraint `visitors_requests_request_id_fk` foreign key (request_id) references printer_requests(id)
);

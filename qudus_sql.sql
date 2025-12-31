-- QUDUS 31/12--

create database if not exists qudus
character set utf8mb4 collate utf8mb4_unicode_ci;
use qudus;

create table if not exists artifacts(
    id int,
    name varchar(50),
    description text,
    origin varchar(50),
    period varchar(50),
    material varchar(50),
    condition_status menu('Excellent', 'Good', 'Needs Maintenance'),
    location varchar(50),
    image_url varchar(255),
    acquisition_date date,

    primary key (id)
);

create table if not exists staff(
    id int,
    first_name varchar(20),
    last_name varchar(20),
    role varchar(20),
    email varchar(50),
    phone varchar(15),
    hire_date date,

    primary key (id),
    unique (email)
);

create table if not exists artists(
    id int,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(50),
    bio text,

    primary key (id),
    unique (email)
);

create table if not exists artworks(
    id int,
    title varchar(50),
    description text,
    artwork_type varchar(50),
    creation_year year,
    location varchar(100),
    image_url varchar(255),
    artist_id int,

    primary key (id),
    foreign key (artist_id) references artists(id)
);

create table if not exists exhibitions(
    id int,
    title varchar(50),
    start_date date,
    end_date date,
    description text,
    status menu('Upcoming', 'Ongoing', 'Past'),
    manager_id int,

    primary key (id),
    foreign key (manager_id) references staff(id)
);

create table if not exists visitors(
    id int,
    first_name varchar(20),
    last_name varchar(20),

    primary key (id)
);

create table if not exists visits(
    id int,
    visitor_id int,
    exhibition_id int,
    visit_date date,
    feedback text,
    rating int,

    primary key (id),
    foreign key (visitor_id) references visitors(id),
    foreign key (exhibition_id) references exhibitions(id)
);

create table if not exists printer_requests(
    id int,
    request_type varchar(100),
    request_date date,
    status menu('Pending', 'Approved', 'Printed', 'Delivered', 'Rejected'),
    file_path varchar(255),
    designer_id int,

    primary key (id),
    foreign key (designer_id) references staff(id)
);

create table if not exists payments(
    id int,
    request_id int,
    visitor_id int,
    amount decimal(10,2),
    payment_method varchar(20),
    payment_date date,
    
    primary key (id),
    foreign key (request_id) references printer_requests(id),
    foreign key (visitor_id) references visitors(id)
);

create table if not exists exhibition_artifacts( -- includes
    exhibition_id int,
    artifact_id int,

    primary key (exhibition_id, artifact_id),
    foreign key (exhibition_id) references exhibitions(id),
    foreign key (artifact_id) references artifacts(id)
);

create table if not exists exhibition_artworks(  -- includes
    exhibition_id int,
    artwork_id int,

    primary key (exhibition_id, artwork_id),
    foreign key (exhibition_id) references exhibitions(id),
    foreign key (artwork_id) references artworks(id)
);

create table if not exists exhibition_staff( -- works_on 
    exhibition_id int,
    staff_id int,
    role_in_exhibition varchar(50),

    primary key (exhibition_id, staff_id),
    foreign key (exhibition_id) references exhibitions(id),
    foreign key (staff_id) references staff(id)
);


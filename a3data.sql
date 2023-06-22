create table IF NOT EXISTS v (
    Vno varchar(4) not null,
    Vname varchar(20) not null,
    City varchar(30) not null,
    Vbalance float not null,
    primary key(Vno)
);

create table IF NOT EXISTS c (
    Account varchar(4) not null,
    CName varchar(10) not null,
    Province varchar(5) not null,
    Cbalance float not null,
    Crlimit float not null,
    primary key(Account)
);

create table IF NOT EXISTS t (
    Tno varchar(4) not null primary key,
    Vno varchar(4) not null references v(Vno),
    Account varchar(4) not null references c(Account),
    T_date date not null,
    Amount float not null
);

insert into v (Vno, Vname, City, Vbalance)
    values
    ('V1', 'IKEA', 'Toronto', 200.00),
    ('V2', 'Walmart', 'Waterloo', 671.05),
    ('V3', 'Esso', 'Windsor', 0.00),
    ('V4', 'Esso', 'Waterloo', 225.00);

insert into c (Account, CName, Province, Cbalance, Crlimit)
    values
    ('A1', 'Smith', 'ONT', 2515.00, 2000),
    ('A2', 'Jones', 'BC', 2014.00, 2500),
    ('A3', 'Doc', 'ONT', 150.00, 1000);

insert into t (Tno, Vno, Account, T_date, Amount)
    values 
    ('T1', 'V2', 'A1', '2022-07-15', 1325.00),
    ('T2', 'V2', 'A3', '2021-12-16', 1900.00),
    ('T3', 'V3', 'A1', '2022-09-01', 2500.00),
    ('T4', 'V4', 'A2', '2022-03-20', 1613.00),
    ('T5', 'V4', 'A3', '2022-07-31', 2212.00);
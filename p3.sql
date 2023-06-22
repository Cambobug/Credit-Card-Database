create or replace function p3(acc varchar, cusName varchar, prov varchar, Clim float) 
    returns table (
        Account varchar,
        CName varchar,
        Province varchar,
        Cbalance float,
        Crlimit float
    )
    as $$
    begin
        insert into c (Account, CName, Province, Cbalance, Crlimit)
        values (acc, cusName, prov, 0.00, Clim);

        return query 
        select * from c;
    end; $$
LANGUAGE 'plpgsql';
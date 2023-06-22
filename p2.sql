create or replace function p2(vendor varchar) 
    returns table (
        Account varchar,
        CName varchar,
        Province varchar
    )
    as $$
    begin
        return query 
        select c.Account, c.CName, c.Province from c natural join t natural join v
        where Vname = vendor;
    end; $$
LANGUAGE 'plpgsql';
create or replace function p1(customer varchar) 
    returns table (
        Vname varchar,
        T_date date,
        Amount float
    )
    as $$
    begin
        return query 
        select v.Vname, t.T_date, t.Amount from c natural join t natural join v
        where Cname = customer;
    end; $$
LANGUAGE 'plpgsql';
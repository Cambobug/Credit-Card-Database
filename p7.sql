create or replace function p7() returns void as $$
    declare
        c1 cursor for select Account, CName, Cbalance, Crlimit from c;
        serviceFee float;
        Acc varchar;
        Cnam varchar;
        CBal float;
        Clim float;

    begin  
        open c1;
        loop

            fetch c1 into Acc, Cnam, CBal, Clim;
            exit when not found;

            if(CBal > Clim) then
            
                select (Cbalance - Crlimit) * 0.1 into serviceFee from c where Account = Acc and Cbalance > Clim;

                update c set CBalance = CBalance - serviceFee where Account = Acc;

                select CBalance into Cbal from c where Account = Acc;

                raise notice 'Customer Name: %', Cnam;
                raise notice 'Customer Balance: %', CBal;
                raise notice '';

            end if;

        end loop;  
        close c1;     

    end; $$
LANGUAGE 'plpgsql';

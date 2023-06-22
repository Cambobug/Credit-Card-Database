create or replace function p4() returns void as $$
    declare
        c1 cursor for select Account from c;
        Acc varchar;
        id varchar;
        Cnam varchar;
        Camm float;
        Vnam varchar;
    begin  
        
        open c1;
        loop

            fetch c1 into Acc;
            exit when not found;

            if exists(select Tno from t where Acc = Account) then

                select Account, Cname, Amount, Vname 
                into id, Cnam, Camm, Vnam 
                from c natural join t natural join v
                where Account = Acc and T_date = (select max(T_date) from t where Account = Acc);

                raise notice 'Account Number: %', Acc;
                raise notice 'Customer Name: %', Cnam;
                raise notice 'Transaction Amount: %', Camm;
                raise notice 'Vendor Name: %', Vnam;
                raise notice '';

            else
                 raise notice 'No Transactions for Account %', Acc;
                 raise notice '';
            end if;

        end loop;
        close c1;
        
    end; $$
LANGUAGE 'plpgsql';
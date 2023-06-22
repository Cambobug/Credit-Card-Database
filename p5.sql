create or replace function p5() returns void as $$
    declare
        c1 cursor for select distinct Vno from v;
        c3 cursor for select Vno, VName, Vbalance from v;
        sm float;
        tamount float;
        Vnum varchar;
        Vnam varchar;
        totalVBal float;

    begin  
        open c1;
        loop

            fetch c1 into Vnum;
            exit when not found;
            
            select coalesce(sum(Amount),0) into sm from t where t.Vno = vNum;
            update v set Vbalance = Vbalance + sm where Vno = Vnum;

        end loop;  
        close c1;     
        
        open c3;
        loop
            fetch c3 into Vnum, Vnam, totalVBal;
            exit when not found;
            raise notice 'Vendor Number: %', Vnum;
            raise notice 'Vendor Name: %', Vnam;
            raise notice 'Vendor Balance: %', totalVBal;
            raise notice '';
        end loop;
        close c3;

    end; $$
LANGUAGE 'plpgsql';
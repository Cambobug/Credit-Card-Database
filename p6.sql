create or replace function p6() returns void as $$
    declare
        c1 cursor for select Vno, VName, Vbalance from v;
        serviceFee float;
        Vnum varchar;
        Vnam varchar;
        VBal float;

    begin  
        open c1;
        loop

            fetch c1 into Vnum, Vnam, Vbal;
            exit when not found;
            
            select Vbalance * 0.025 into serviceFee from v where Vno = Vnum;

            update v set Vbalance = Vbalance - serviceFee where Vno = Vnum;

            select Vbalance into Vbal from v where Vno = Vnum;

            raise notice 'Vendor Number: %', Vnum;
            raise notice 'Service Fee: %', serviceFee;
            raise notice 'Vendor Balance: %', VBal;
            raise notice '';

        end loop;  
        close c1;     

    end; $$
LANGUAGE 'plpgsql';

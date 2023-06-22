create or replace function p8(inVnum varchar, inAnum varchar, inAmm float) returns void as $$
    declare
        serviceFee float;
        transID varchar;
        numTrans numeric;
        curDate date;

        Cacc varchar;
        Cnam varchar;
        CProv varchar;
        Cbal float;
        Clim float;

        Vnam varchar;
        VCit varchar;
        VBal float;

    begin  
        if exists(select Vno from v where Vno = inVnum) then

            if exists(select Account from c where Account = inAnum) then

                select count(*) from t into numTrans;
                select cast(now() as date) into curDate;
                select concat('T', numTrans + 1) into transID;

                insert into t (Tno, Vno, Account, T_date, Amount)
                values (transID, inVnum, inAnum, curDate, inAmm);

                update c set CBalance = CBalance - inAmm where Account = inAnum;
                update v set VBalance = VBalance + inAmm where Vno = inVnum;

                raise notice 'Transcation Number: %', transID;
                raise notice 'Vendor Number: %', inVnum;
                raise notice 'Account Number: %', inAnum;
                raise notice 'Date: %', curDate;
                raise notice 'Amount: %', inAmm;
                raise notice '';

                select Account, Cname, Province, Cbalance, Crlimit into Cacc, Cnam, Cprov, Cbal, Clim from c where Account = inAnum;
                select Vno, Vname, City, Vbalance into inVnum, Vnam, VCit, VBal from v where Vno = inVnum;

                raise notice 'Account Number: %', Cacc;
                raise notice 'Account Name: %', Cnam;
                raise notice 'Account Province: %', Cprov;
                raise notice 'Account Balance: %', Cbal;
                raise notice 'Account Limit: %', Clim;
                raise notice '';

                raise notice 'Vendor Number: %', inVnum;
                raise notice 'Vendor Name: %', Vnam;
                raise notice 'Vendor City: %', VCit;
                raise notice 'Vendor Balance: %', VBal;
                raise notice '';

            end if;

        end if;    

    end; $$
LANGUAGE 'plpgsql';

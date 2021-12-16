CREATE TYPE ti AS (t text, i bigint);

CREATE OR REPLACE FUNCTION m2sc(text,int) RETURNS SETOF ti AS '
select s, count(*) from (select substring(orth,length(orth)-$2+1,length(orth)) as s from lex where infl like ''%'' || $1 || ''-%'' or infl like ''%'' || $1) as a group by s order by s;
' LANGUAGE sql;

CREATE OR REPLACE FUNCTION m2w(text) RETURNS SETOF text AS '
select distinct orth from lex where infl like ''%'' || $1 || ''-%'' or infl like ''%'' || $1;
' LANGUAGE sql;

CREATE OR REPLACE FUNCTION sc2w(text,text) RETURNS SETOF text AS '
select distinct orth from lex where (infl like ''%'' || $1 || ''-%'' or infl like ''%'' || $1) and orth like ''%'' || $2;
' LANGUAGE sql;

CREATE OR REPLACE FUNCTION h(text,text,int) RETURNS SETOF ti AS '
select s, count(*) from (select substring(orth,length(orth)-$3+1,length(orth)) as s from lex where (infl like ''%'' || $1 || ''-%'' or infl like ''%'' || $1) and orth like ''%'' || $2) as a group by s order by s;
' LANGUAGE sql;

CREATE OR REPLACE FUNCTION t2sc(text,text,int) RETURNS SETOF ti AS '
DECLARE
	x RECORD;
BEGIN
    FOR x IN EXECUTE \'select s,count(*) from (select substring(m2w,length(m2w)-\' || $3 || \'+1,length(m2w)) as s from \' || $1 || \' where m2w like \' || quote_literal($2) || \') as x group by s order by s\' LOOP 
      RETURN NEXT x; 
    END LOOP;
    RETURN;
END;
' LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION t2w(text,text) RETURNS SETOF text AS '
DECLARE
	x RECORD;
BEGIN
    FOR x IN EXECUTE \'select m2w from \' || $1 || \' where m2w like \' || quote_literal($2)  LOOP 
      RETURN NEXT x.m2w; 
    END LOOP;
    RETURN;
END;
' LANGUAGE plpgsql;




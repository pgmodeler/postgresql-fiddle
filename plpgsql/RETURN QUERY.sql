CREATE FUNCTION return_rows() RETURNS SETOF record AS $$
BEGIN
    RETURN QUERY SELECT * from tablename;
END;
$$ LANGUAGE plpgsql;
DROP FUNCTION return_rows();

CREATE FUNCTION return_scalar() RETURNS int AS $$
BEGIN
    RETURN (SELECT 1);
END;
$$ LANGUAGE plpgsql;
DROP FUNCTION return_scalar();
CREATE OR REPLACE FUNCTION insert_regions()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO regiones (region)
    VALUES (NEW.region);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER regions_into_table
AFTER INSERT OR UPDATE ON regiones_municipios_departamentos
FOR EACH ROW
EXECUTE FUNCTION insert_regions();

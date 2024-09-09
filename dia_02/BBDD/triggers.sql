CREATE OR REPLACE FUNCTION split_and_deduplicate()
RETURNS TRIGGER AS $$
DECLARE
    v_region_id INT;
    v_departamento_id INT;
    v_municipio_id INT;
BEGIN
    -- Verificar e insertar la región si no existe
    SELECT id_region INTO v_region_id
    FROM regiones
    WHERE region = NEW.region;

    IF NOT FOUND THEN
        INSERT INTO regiones (region)
        VALUES (NEW.region)
        RETURNING id_region INTO v_region_id;
    END IF;

    -- Verificar e insertar el departamento si no existe
    SELECT id_departamento INTO v_departamento_id
    FROM departamentos
    WHERE id_region = v_region_id
      AND departamento = NEW.departamento;

    IF NOT FOUND THEN
        INSERT INTO departamentos (id_region, departamento)
        VALUES (v_region_id, NEW.departamento)
        RETURNING id_departamento INTO v_departamento_id;
    END IF;

   -- Verificar e insertar el departamento si no existe
    INSERT INTO municipios (id_departamento, municipio)
    VALUES (v_departamento_id, NEW.municipio)
    ON CONFLICT (id_departamento, municipio) DO NOTHING;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sort_info
AFTER INSERT ON regiones_municipios_departamentos
FOR EACH ROW
EXECUTE FUNCTION split_and_deduplicate();

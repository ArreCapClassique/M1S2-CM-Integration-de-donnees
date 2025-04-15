SELECT
    table_name AS "Source de données",
    column_name AS "Colonne/Attribut",
    CASE
        WHEN data_type = 'NUMBER'
            THEN
                CASE
                    WHEN data_precision IS NULL THEN 'Nombre'
                    WHEN data_scale IS NULL OR data_scale=0 THEN 'Nombre de ' || data_precision || ' chiffres'
                    ELSE 'Nombre de ' || data_precision || ' chiffres, dont ' || data_scale || ' décimales'
                END
        WHEN data_type = 'VARCHAR2' THEN 'Chaîne de ' || data_length || ' car.'
        ELSE INITCAP(data_type)
    END AS "Type et format",
    CASE
        WHEN data_type = 'NUMBER'
            THEN
                CASE
                    WHEN data_precision IS NULL THEN 'NUMBER(38,0)'
                    WHEN data_scale IS NULL OR data_scale=0 THEN 'NUMBER(' || data_precision || ',0)'
                    ELSE 'NUMBER(' || data_precision || ',' || data_scale || ')'
                END
        WHEN data_type = 'VARCHAR2' THEN 'VARCHAR2(' || data_length || ')'
        ELSE data_type
    END AS "Type de la BD"
FROM USER_TAB_COLUMNS
ORDER BY "Colonne/Attribut";
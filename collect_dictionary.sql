SELECT
    table_name AS "Source de données",
    column_name AS "Colonne/Attribut",
    CASE
        WHEN data_type='NUMBER'
            THEN
                CASE
                    WHEN data_precision IS NOT NULL THEN 'NUMBER(' || data_length || ',' || data_precision || ')'
                    ELSE 'NUMBER(' || data_length || ')'
                END
        WHEN data_type='VARCHAR2' THEN 'VARCHAR2(' || data_length || ')'
        ELSE data_type
    END AS "Type de la BD"
FROM USER_TAB_COLUMNS;
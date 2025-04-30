SELECT
    table_name AS "数据源",
    column_name AS "列 / 属性",
    CASE
        WHEN data_type = 'NUMBER'
            THEN
                CASE
                    WHEN data_precision IS NULL THEN '整数'
                    WHEN data_scale IS NULL OR data_scale=0 THEN '长度为 ' || data_precision || ' 的整数'
                    ELSE '长度为 ' || data_precision || ' 的实数, 其中 ' || data_scale || ' 位小数'
                END
        WHEN data_type = 'VARCHAR2' THEN '长度为 ' || data_length || ' 的字符串'
        WHEN data_type = 'FLOAT' THEN '实数'
        ELSE INITCAP(data_type)
    END AS "类型和格式",
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
    END AS "数据库类型"
FROM USER_TAB_COLUMNS
ORDER BY
    "列 / 属性",
    "数据源";
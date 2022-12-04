\copy "region" from 'tables/region.tbl' DELIMITER '|' CSV;
\copy "nation" from 'tables/nation.tbl' DELIMITER '|' CSV;
\copy "customer" from 'tables/customer.tbl' DELIMITER '|' CSV;
\copy "supplier" from 'tables/supplier.tbl' DELIMITER '|' CSV;
\copy "part" from 'tables/part.tbl' DELIMITER '|' CSV;
\copy "partsupp" from 'tables/partsupp.tbl' DELIMITER '|' CSV;
\copy "orders" from 'tables/orders.tbl' DELIMITER '|' CSV;
\copy "lineitem" from 'tables/lineitem.tbl' DELIMITER '|' CSV;
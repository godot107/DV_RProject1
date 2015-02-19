
# combined data frame
#data frame for step 10
df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders o join customers c on o.customer_id = c.customer_id join order_details d on o.order_id = d.order_id join items i on d.item_id = i.item_id"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

head(df)

#plot 1

g <- ggplot(df, aes(x = as.Date(ORDER_DATE, '%Y-%m-%d'), y = (as.Date(SHIPPED_DATE, '%Y-%m-%d')))) + geom_point(aes(color = as.factor(UNIT_PRICE))) + facet_wrap(~CUSTOMER_STATE)

g

#plot 2
g <- ggplot(df, aes(x = as.Date(ORDER_DATE, '%Y-%m-%d'), y = (as.Date(SHIPPED_DATE, '%Y-%m-%d')))) + geom_point(aes(color = as.factor(TITLE))) + facet_wrap(~CUSTOMER_STATE)

g

#plot 3
g <- ggplot(df, aes(x = as.Date(ORDER_DATE, '%Y-%m-%d'), y = (as.Date(SHIPPED_DATE, '%Y-%m-%d')))) + geom_point(aes(color = as.factor(ARTIST))) + facet_wrap(~CUSTOMER_STATE)

g
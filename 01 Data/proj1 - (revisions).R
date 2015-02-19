library(RCurl)
library(ggplot2)

#plot 1 for items

df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from items"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))       
# data frame for items
head(df)
ggplot(df, aes(x=ITEM_ID, y=UNIT_PRICE)) + geom_point()

#plot 2 for customers
df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from customers"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))          
# data frame for customers
head(df)
ggplot(df, aes(x=CUSTOMER_CITY, y=CUSTOMER_STATE)) + geom_point()

#plot 3 for orders
df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))         
# data frame for orders
head(df)
ggplot(df, aes(x= ORDER_DATE, y= SHIPPED_DATE)) + geom_point()


#plot 4 for order details
df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from order_details"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))          
# data frame for order_details
head(df)
ggplot(df, aes(x=ORDER_ID , y=ORDER_QTY )) + geom_point()


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
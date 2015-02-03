

# data frame from customers
dfc <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from customers"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

g <-  ggplot(dfc, aes(x=CUSTOMER_STATE, y=CUSTOMER_CITY))
g + geom_point(aes(color = color))

# data frame from orders
dfo <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

dfo

# data frame from items
dfi <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from items"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

dfi

# data frame from order_details
dfd <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from  order_details"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

dfd

# for step 10
# looks like a scatter plot, x is as.Date(...) and Y is as.Date(... ), legend is the color? so that changes too.

df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders o join customers c on o.customer_id = c.customer_id join order_details d on o.order_id = d.order_id join items i on d.item_id = i.item_id"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

df

#plot 1
#g <- ggplot(df, aes(x = "as.Date(ORDER_DATE, \"%Y-%m-%d\""), y = ("as.Date(SHIPPED_DATE, \"%Y-%m-%d\""), color = "as.factor(UNIT_PRICE)") +  geom_point(aes(color = "as.factor(UNIT_PRICE)"))

g <- ggplot(df, aes(x = as.Date(ORDER_DATE, '%Y-%m-%d'), y = (as.Date(SHIPPED_DATE, '%Y-%m-%d')))) + geom_point()

g <- ggplot(df, aes(x = as.Date(ORDER_DATE, '%Y-%m-%d'), y = (as.Date(SHIPPED_DATE, '%Y-%m-%d')))) + geom_point(aes(color = as.factor(UNIT_PRICE)) + facet_wrap(~color)


#plot 2
g <- ggplot(df, aes(x = "as.Date(ORDER_DATE, \"%Y-%m-%d\""), y = ("as.Date(SHIPPED_DATE, \"%Y-%m-%d\""), color = "as.factor(TITLE)") + geom_line()


#plot 3
g <- ggplot(df, aes(x = "as.Date(ORDER_DATE, \"%Y-%m-%d\""), y = ("as.Date(SHIPPED_DATE, \"%Y-%m-%d\""), color = "as.factor(ARTIST)")

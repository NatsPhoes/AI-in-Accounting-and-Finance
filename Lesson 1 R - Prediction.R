dt <- read.csv("Desktop/Y3S1/BE3415 AI for financial and accounting/DBS_SingDollar.csv")
model=lm(dt$DBS ~ dt$SGD)
summary(model)

pred = predict(model)
err = dt$DBS - pred
rmse=(mean(err^2)^0.5)
print(rmse)

dt$SGD2 = dt$SGD^2
model=lm(dt$DBS ~ dt$SGD + dt$SGD2)
summary(model)
pred = predict(model, newdata = dt)
err=dt$DBS - pred
rmse = (mean(err^2)^0.5)
print(rmse)

plot(dt$SGD, dt$DBS, main="Regression", xlab = "SGD", ylab="DBS")
abline(model)


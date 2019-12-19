library("readxl")
data1 = read_excel("data/1415CSM_dataset.xlsx")
i=1
asLabel=""
for (val in data1$Ratings) {
  if(val<=4.9){
    asLabel[i]="Poor"
  }else if(val<=6.4){
    asLabel[i]="Average"
  }else if(val<=8.9){
    asLabel[i]="Good"
  }else if(val<=10){
    asLabel[i]="Excellent"
  }
  i=i+1
}
# print(asLabel)
data1 = data.frame(data1,asLabel)
# print(data1)
set.seed(10)
datasize = dim(data1)[1]
train_idx = sample(datasize, datasize*0.8)

indicator1 = rep(0,datasize)
indicator1[train_idx] = 1 # 1:train 0:valid
data1 = data.frame(data1,indicator1)

train = subset(data1,data1$indicator1==1)
valid = subset(data1,data1$indicator1==0)


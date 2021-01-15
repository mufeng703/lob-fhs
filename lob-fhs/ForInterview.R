first = c("Why MSFE program？", "What does financial engineering mean to you？")
second = c("How do you think about NYC？", "How partner describe you？", "What's your favorite food？", "Describe a big achievement", 
           "what do you do for fun", "how do you judge when someone has integrity？", "What do you expect to gain from this program？", 
           "Can you tell me a joke/ Tell me a funny story", "What does integrity means to you？", "Tell me your programming experiences", 
           "A project you enjoyed, how do you find it meaningful", "we are proud of our curriculum, What courses or topics interest you?", 
           "describe a time you use creative solution to solve a problem", "A recent movie or book you see")
last = c("Any questions for the admission team？")

f = sample(first, 1)
s = sample(second, 1)
l = sample(last, 1)

print(paste0("1. ", f))
print(paste0("2. ", s))
print(paste0("3. ", l))


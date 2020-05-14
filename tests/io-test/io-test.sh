mkdir -p test

echo "Time touch"
time touch test/{1..1000} 

echo "Time rm"
time rm -rf test/*

echo "Time mkdir"
time mkdir test/{1..1000} 

echo "Time rm"
time rm -rf test/*

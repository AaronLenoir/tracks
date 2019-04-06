git pull
sudo docker build -t tracks .
cd ..
sudo docker-compose stop tracks
sudo docker-compose up -d tracks
cd tracks

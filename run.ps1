#docker run -it --rm -v C:\Users\chris\Desktop\feed:/feed --entrypoint=bash  mdev/documentation:v0.1 
docker run --name mdev-doc-privatgallerycreator -v C:\Users\chris\Desktop\feed:/feed -d --rm mdev/documentation:v0.1 
docker run --name mdev-doc-nginx -v C:\Users\chris\Desktop\feed:/usr/share/nginx/html:ro -d --rm -p 8080:80 nginx 
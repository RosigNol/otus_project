docker pull structurizr/lite
xcopy %userprofile%\Documents\GitHub\otus_project\lib\ %userprofile%\Documents\GitHub\otus_project\c4\lib\ /e /y /r
docker run -it --rm -p 8085:8080 -v %userprofile%\Documents\GitHub\otus_project\c4\:/usr/local/structurizr structurizr/lite
pause

1) create the code for de lambda
2) Build and zip de lambda
GOOS=linux GOARCH=amd64 go build -o main
zip main.zip main 
3) (Solo primera vez) terraform init
4) terraform fmt (si quiero formatear)
5) terraform validate (validar el tf file)
6) terraform apply --apply changes
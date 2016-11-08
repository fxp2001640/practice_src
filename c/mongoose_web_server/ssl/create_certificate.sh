#!/bin/bash

#clean
rm -f www.xpfan.com.key www.xpfan.com.csr www.xpfan.com.crt

#generate private key
openssl genrsa -des3 -passout file:passout.txt -out www.xpfan.com.key 1024

#create CSR : Certificate  Signing Request
openssl req -new -key www.xpfan.com.key -passin file:passout.txt -out www.xpfan.com.csr

#create Self-Signed SSL Certificate
openssl x509 -req -days 365 -in www.xpfan.com.csr -signkey www.xpfan.com.key -passin file:passout.txt -out www.xpfan.com.crt

#remove passphrase
openssl rsa -in www.xpfan.com.key -passin file:passout.txt -out tmp.key

#merge private key and Self-Signed SSL Certificate
mv www.xpfan.com.crt tmp.crt
cat tmp.key >> www.xpfan.com.crt
cat tmp.crt >> www.xpfan.com.crt
rm -f tmp.key tmp.crt www.xpfan.com.key www.xpfan.com.csr

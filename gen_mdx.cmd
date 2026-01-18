@echo off
call npx @mintlify/scraping@latest openapi-file https://api.palatine.ru/api/v1/cloud_api/openapi.json  -o .\api-reference

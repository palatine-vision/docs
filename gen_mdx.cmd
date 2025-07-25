@echo off
call npx @mintlify/scraping@latest openapi-file https://api.palatine.ru/api/v1/transcribe/openapi.json  -o .\api-reference\transcribe
call npx @mintlify/scraping@latest openapi-file https://api.palatine.ru/api/v1/audio/openapi.json       -o .\api-reference\transcribe_openai
call npx @mintlify/scraping@latest openapi-file https://api.palatine.ru/api/v1/diarization/openapi.json -o .\api-reference\diarization

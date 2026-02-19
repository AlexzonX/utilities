#!/usr/bin/env bash
echo "koder..."
read -p "Введи слово которое ты хочешь зашифровать:" text
echo "какие хеши бывают:(Base16 (Hex), Base32, Base85, ZBase32, Base64URL ,sha256sum,sha1sum,sha224sum , sha384sum ,sha512sum)"
read -p "Выбери какой хеш будешь использовать:" hash

if [[ "$hash" == "Base16" || "$hash" == "base16" ]]; then
	echo -n "$text" | xxd
fi
 
if [[ "$hash" == "Base32" || "$hash" == "base32" ]]; then
	echo -n "$text" | $hash
fi

if [[ "$hash" == "Base64url" || "$hash" == "base64URL" ]]; then
	echo -n "$text" | base64 | tr '+/' '-_' | sed 's/=//g'
fi

if [[ "$hash" == "Base85" || "$hash" == "base85" ]]; then
	echo -n "$text" | python3 -c "import base64; print(base64.b85encode(b'$text').decode())"
fi
if [[ "$hash" == "sha256" || "$hash" == "sha256sum" ]]; then
	echo -n "$text" | $hash
fi

if [[ "$hash" == "sha1" || "$hash" == "sha1sum" ]]; then
    echo -n "$text" | sha1sum
fi

if  [[ "$hash" == "sha224sum" || "$hash" == "sha224" ]]; then
	echo -n "$text" | sha224sum
fi
if [[ "$hash" == "sha384sum" || "$hash" == "sha384" ]]; then
	echo -n "$text" | sha384sum
fi 
#!/usr/bin/env sh
# see https://habr.com/ru/post/584162/

# allow tun2socks create iface
sleep 3

# assign network address
ip addr add 127.254.254.1/32 dev gatewaytun

# ifup
ip link set gatewaytun up

# todo configure ip range for proxying
ip route add 10.0.0.0/8 dev gatewaytun metric 1000



# Опционально. Добавляем маршрут до прокси-сервера в локальной сети
#ip route add АДРЕС_СЕТИ/ПРЕФИКС dev ИМЯ_ИНТЕРФЕЙСА_В_ЛОКАЛЬНОЙ_СЕТИ

# Опционально. Маршрут до прокси-сервера в интернете (наиболее вероятный вариант для дома)
#ip route add АДРЕС_ПРОКСИ/32 dev ИМЯ_ИНТЕРФЕЙСА_В_СЕТИ_ПРОВАЙДЕРА

# todo добавить ns
# ensure-line() {
#     local file="$1"
#     local line="$2"
#     grep "$line" "$file" > /dev/null || echo "$line" >> "$file"    
# }
# ensure-line /etc/resolv.conf 'nameserver 127.254.254.1'
# ensure-line /etc/resolv.conf 'nameserver 10.230.192.78'
# ensure-line /etc/resolv.conf 'nameserver 10.230.192.77'
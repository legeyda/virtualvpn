
NAME:=proxy-tunnel
CONFIG_FILES:=environment.sh exec-after.sh

install:
	systemctl stop ${NAME}.service || true
	install -Dt /etc/${NAME} ${CONFIG_FILES}
	install ${NAME}.service /etc/systemd/system
	systemctl daemon-reload

uninstall:
	systemctl stop ${NAME}.service
	rm /etc/systemd/system/${NAME}.service
	systemctl daemon-reload
	cd /etc/${NAME} && rm ${CONFIG_FILES}	
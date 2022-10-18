  apt update > /dev/null 2>&1  && echo "[OK] APT source list updated"
  apt install -y vim chrony gnupg2 pass> /dev/null 2>&1  && echo "[OK] vim and chrony installed"

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /dev/null 2>&1  && echo "[OK] Allow SSH with Password"
systemctl restart sshd



cat <<EOF > /etc/hosts
127.0.0.1 localhost.localdomain localhost
191.16.20.10 router-mongo.example.com router-mongo
191.16.20.20 conf-01.example.com conf-01
191.16.20.30 conf-02.example.com conf-02
191.16.20.40 sh-pri-01.example.com sh-pri-01 sh-pri-01
191.16.20.50 sh-pri-02.example.com sh-pri-02 sh-pri-02
191.16.20.60 sh-seg-01.example.com sh-seg-01 sh-seg-01
191.16.20.70 sh-seg-02.example.com sh-seg-02 sh-seg-02
191.16.20.100 monitor.example.com monitor
EOF
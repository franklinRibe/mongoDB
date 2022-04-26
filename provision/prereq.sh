if [ "$1" = "debian/buster64" ]; then
  apt update > /dev/null 2>&1  && echo "[OK] APT source list updated"
  apt install -y vim chrony gnupg2 pass> /dev/null 2>&1  && echo "[OK] vim and chrony installed"
else
  dnf install -y epel-release
  dnf install vim chrony -y  
  sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config > /dev/null 2>&1  && echo "[OK] SELinux disabled"
fi 

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /dev/null 2>&1  && echo "[OK] Allow SSH with Password"
systemctl restart sshd



cat <<EOF > /etc/hosts
127.0.0.1 localhost.localdomain localhost
192.168.200.1 router-mongo.example.com router-mongo
192.168.200.2 conf-01.example.com conf-01
192.168.200.3 conf-02.example.com conf-02
192.168.200.4 sh-pri-01.example.com sh-pri-01 sh-pri-01
192.168.200.5 sh-pri-02.example.com sh-pri-02 sh-pri-02
192.168.200.6 sh-seg-01.example.com sh-seg-01 sh-seg-01
192.168.200.7 sh-seg-02.example.com sh-seg-02 sh-seg-02
192.168.200.10 monitor.example.com monitor
EOF
mkdir install
cd install
mv ~/Téléchargements/CPU-X_v4.0.1_Ubuntu.tar.gz .
tar -xzf CPU-X_v4.0.1_Ubuntu.tar.gz
cd xUbuntu_20.04
sudo dpkg -i libcpuid15_0.5.0_amd64.deb cpuidtool_0.5.0_amd64.deb cpu-x_4.0.1_amd64.deb
cpu-x
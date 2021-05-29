sudo rm -r .output/modules
make modules_install INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=modules
ssh timb@172.16.42.1 sudo rm -r /lib/modules/5.12.8-postmarketos-exynos4
scp -r .output/modules/lib/modules/5.12.8-postmarketos-exynos4 timb@172.16.42.1:/tmp
ssh timb@172.16.42.1 sudo mv /tmp/5.12.8-postmarketos-exynos4 /lib/modules
ssh timb@172.16.42.1 sudo reboot


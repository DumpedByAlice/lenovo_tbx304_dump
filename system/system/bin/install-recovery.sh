#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:16900096:11458171b3e19904c7ad20f82ffe4bf5857bf9ad; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:11161600:d00489e3b51a8c7a90283cc5cda4d8a480188c66 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:16900096:11458171b3e19904c7ad20f82ffe4bf5857bf9ad && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

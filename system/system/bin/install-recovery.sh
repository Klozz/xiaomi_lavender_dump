#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:1c714a120b670e22120a282b0ba6e97e1ca20ad3; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:2580016907281dee12f1523b9919f3b3dc1e13ea \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:1c714a120b670e22120a282b0ba6e97e1ca20ad3 && \
      log -t recovery "Installing new recovery image: succeeded" && \
        echo "Installing new recovery image: succeeded" > /cache/recovery/last_install_recovery_status || \
      (log -t recovery "Installing new recovery image: failed" && \
        echo "Installing new recovery image: failed" > /cache/recovery/last_install_recovery_status)
else
  log -t recovery "Recovery image already installed" && \
  echo "Recovery image already installed" > /cache/recovery/last_install_recovery_status
fi

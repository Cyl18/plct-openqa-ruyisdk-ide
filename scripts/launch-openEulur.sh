
DISPLAY=:1 /bin/qemu-system-riscv64 \
  -nographic -machine virt \
  -smp "4" -m 4G \
  -display sdl \
  -bios "/var/lib/openqa/share/factory/other/fw_payload_oe_uboot_2304.bin" \
  -drive file="/var/lib/openqa/share/factory/hdd/openEuler-23.09-V1-xfce-qemu-preview-modified.qcow2",format=qcow2,id=hd0,if=none \
  -object rng-random,filename=/dev/urandom,id=rng0 \
  -device virtio-vga \
  -device virtio-rng-device,rng=rng0 \
  -device virtio-blk-device,drive=hd0 \
  -device virtio-net-device,netdev=usernet \
  -netdev user,id=usernet,hostfwd=tcp::"2222"-:22 \
  -device qemu-xhci -usb -device usb-kbd -device usb-tablet -device virtio-vga
rm -f /var/lib/openqa/share/factory/hdd/jammy-server-cloudimg-amd64-modified-temp.img || true
qemu-img create -f qcow2 -b /var/lib/openqa/share/factory/hdd/jammy-server-cloudimg-amd64-modified.qcow2 -F qcow2 /var/lib/openqa/share/factory/hdd/jammy-server-cloudimg-amd64-modified-temp.img

DISPLAY=:1 /bin/qemu-system-x86_64 \
  -nographic -machine q35,accel=kvm:tcg \
  -smp "4" -m 4G \
  -drive file="/var/lib/openqa/share/factory/hdd/jammy-server-cloudimg-amd64-modified-temp.img",format=qcow2,id=hd0,if=none \
  -display sdl \
  -vga virtio \
  -bios /usr/share/qemu/ovmf-x86_64.bin \
  -device VGA,xres=1024,yres=768 \
  -smbios type=1,serial=ds='nocloud;s=http://192.168.0.131:8000/' \
  -object rng-random,filename=/dev/urandom,id=rng0 \
  -device virtio-blk-pci,drive=hd0 \
  -nic user,id=usernet,hostfwd=tcp::"22222"-:22 -vnc :91,share=force-shared \
  -device qemu-xhci -usb -device usb-kbd -device usb-tablet

rm -f /var/lib/openqa/share/factory/hdd/jammy-server-cloudimg-amd64-modified-temp.img || true
#!/usr/bin/sh

cpus=$(nproc)
memory="4096M"

image_path="/var/lib/polyos-mobile-qemu"

sudo qemu-system-riscv64 \
    -name PolyOS-Mobile \
    -machine virt \
    -m ${memory} \
    -smp ${cpus} \
    -no-reboot \
    -netdev user,id=net0 \
    -device virtio-net-device,netdev=net0,mac=12:22:33:44:55:66 \
    -drive if=none,file=${image_path}/updater.img,format=raw,id=updater,index=3 \
    -device virtio-blk-device,drive=updater \
    -drive if=none,file=${image_path}/system.img,format=raw,id=system,index=2 \
    -device virtio-blk-device,drive=system \
    -drive if=none,file=${image_path}/vendor.img,format=raw,id=vendor,index=1 \
    -device virtio-blk-device,drive=vendor \
    -drive if=none,file=${image_path}/userdata.img,format=raw,id=userdata,index=0 \
    -device virtio-blk-device,drive=userdata \
    -append "loglevel=1 console=ttyS0,115200 init=init root=/dev/ram0 rw rootwait ohos.boot.hardware=riscv64_virt default_boot_device=10007000.virtio_mmio sn=8823456789 ohos.required_mount.system=/dev/block/vdb@/usr@ext4@ro,barrier=1@wait,required ohos.required_mount.vendor=/dev/block/vdc@/vendor@ext4@ro,barrier=1@wait,required ohos.required_mount.data=/dev/block/vdd@/data@ext4@nosuid,nodev,noatime,barrier=1,data=ordered,noauto_da_alloc@wait,reservedsize=104857600" \
    -kernel ${image_path}/Image \
    -initrd ${image_path}/ramdisk.img \
    -vga none \
    -vnc :20 \
    -device virtio-gpu-pci,xres=486,yres=864,max_outputs=1,addr=08.0 \
    -monitor telnet:127.0.0.1:55555,server,nowait \
    -device virtio-mouse-pci \
    -device virtio-keyboard-pci \
    -k en-us \
    -device ac97 \
    -display sdl,gl=off
  
exit

wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip &>/dev/null &
unzip ngrok-stable-linux-amd64.zip1 &>/dev/null &
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
./ngrok tcp 3388 &>/dev/null &
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
qemu-img create -f raw WVN.img 64G
qemu-img create -f raw WVNX.img 128G
wget -O WVN.iso 'https://software.download.prss.microsoft.com/dbazure/Windows_InsiderPreview_Server_vNext_en-us_25140.iso?t=92db880a-86a7-450b-8917-fcf62ed5a870&e=1656236680&h=b7f66fa92567c06c5c370bc83c70825d06b5d238f0bd40716daa78113795e52c'
wget -O RTL8139F.iso 'https://drive.google.com/uc?export=download&id=1wDL8vo9mmYKw1HKXZzaYHoKmzSt_wXai'
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=d \
  -drive file=WVN.iso,media=cdrom \
  -drive file=RTL8139F.iso,media=cdrom \
  -drive file=WVN.img,format=raw \
  -drive file=WVNX.img,format=raw \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu core2duo \
  -smp cores=6 \
  -device rtl8139,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \

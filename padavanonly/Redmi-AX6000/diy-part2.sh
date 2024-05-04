#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP
sed -i 's/192.168.6.1/192.168.100.1/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='ImmortalWrt'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

##-----------------Add OpenClash dev core------------------
##curl -sL -m 30 --retry 2 https://raw.githubusercontent.com/vernesong/OpenClash/master/core-lateset/dev/clash-linux-arm64.tar.gz -o /tmp/clash.tar.gz
##tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
##chmod +x /tmp/clash >/dev/null 2>&1
##mkdir -p feeds/luci/applications/luci-app-openclash/root/etc/openclash/core
##mv /tmp/clash feeds/luci/applications/luci-app-openclash/root/etc/openclash/core/clash >/dev/null 2>&1
##rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
##---------------------------------------------------------

# 修改插件名字
sed -i 's/"SoftEther VPN Service"/"SoftEther VPN"/g' `egrep "SoftEther VPN Service" -rl ./`
sed -i 's/"AliDDNS"/"阿里DDNS"/g' `egrep "AliDDNS" -rl ./`
sed -i 's/"FileBrowser"/"文件管理"/g' `egrep "FileBrowser" -rl ./`
sed -i 's/"SoftEther Status"/"SoftEther"/g' `egrep "SoftEther Status" -rl ./`
sed -i 's/"MWAN3 分流助手"/"分流助手"/g' `egrep -rl 'MWAN3 分流助手' ./`
sed -i 's/"FileBrowser"/"文件管理"/g' `egrep -rl 'FileBrowser' ./`
sed -i 's/"广告屏蔽大师 Plus+"/"广告屏蔽"/g' `egrep -rl '广告屏蔽大师 Plus+' ./`
sed -i 's/"AList"/"文件搜刮"/g' `egrep -rl 'AList' ./`
sed -i 's/"EASY MESH"/"MESH组网"/g' `egrep -rl 'EASY MESH' ./`
sed -i 's/"服务质量(QoS)"/"服务质量"/g' `egrep -rl '服务质量(QoS)' ./`
sed -i 's/"frp 客户端"/"FRP客户端"/g' `egrep -rl 'frp 客户端' ./`
sed -i 's/"解除网易云音乐播放限制"/"网易云音乐"/g' `egrep -rl '解除网易云音乐播放限制' ./`
sed -i 's/"Multi Stream daemon Lite"/"msd_lite"/g' `egrep -rl 'Multi Stream daemon Lite' ./`

cat > package/base-files/files/etc/banner << EOF
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 %D %V, %C
 -----------------------------------------------------
EOF

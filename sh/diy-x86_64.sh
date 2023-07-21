#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/g' package/base-files/files/bin/config_generate
sed -i 's_http://downloads.openwrt.org_https://openwrt.proxy.ustclug.org_' /etc/opkg/distfeeds.conf

#git clone https://github.com/jerrykuku/openwrt-package package/one
#git clone https://github.com/kenzok8/openwrt-packages package/two
#git clone https://github.com/kenzok8/small package/small
#git clone https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

mkdir package/community
pushd package/community
# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome ../luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/AdGuardHome ../AdGuardHome

# Add smartdns
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add clash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-clash ../luci-app-clash

# Add aliddns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliddns ../luci-app-aliddns

rm -rf package/lean/luci-theme-argon
git clone -b 18.06 --depth 1 --single-branch https://github.com/jerrykuku/luci-theme-argon.git package/custom/luci-theme-argon
git clone --depth 1 --single-branch https://github.com/jerrykuku/luci-app-argon-config.git package/custom/luci-app-argon-config

popd

pushd package/community/OpenClash/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

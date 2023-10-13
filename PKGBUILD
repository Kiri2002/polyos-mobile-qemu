# Maintainer: Kiri <kiri@vern.cc>

pkgname=polyos-mobile-qemu
pkgver=3.2
pkgrel=1
pkgdesc='An intelligent mobile and AIoT operating system designed for the RISC-V architecture, running in qemu-riscv64'
arch=('x86_64')
url='https://polyos.iscas.ac.cn'
license=('unknown')
depends=('qemu'
         'mesa')
makedepends=('gendesk')
optdepends=()
source=("https://polyos.iscas.ac.cn/downloads/polyos-mobile-3.2-beta2.img.tar.xz"
        "qemu_riscv64_run_archlinux.sh"
        "https://polyos.iscas.ac.cn/img/polyos-logo.png")
sha256sums=('c774a91af02b7e08f5aadc572735f47ece49c05819668dd954ac9660bc0a2b29'
            'SKIP'
            'SKIP')

prepare() {
    # generate desk entry
    gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec="${pkgname}" --name="-polyos" --categories="Education"
}

package() {
    install -Dm 755 ${srcdir}/qemu_riscv64_run_archlinux.sh ${pkgdir}/usr/bin/${pkgname}
    install -Dm 644 ${srcdir}/images/userdata.img "${pkgdir}/var/lib/polyos-mobile-qemu/userdata.img"
    install -Dm 644 ${srcdir}/images/vendor.img "${pkgdir}/var/lib/polyos-mobile-qemu/vendor.img"
    install -Dm 644 ${srcdir}/images/system.img "${pkgdir}/var/lib/polyos-mobile-qemu/system.img"
    install -Dm 644 ${srcdir}/images/updater.img "${pkgdir}/var/lib/polyos-mobile-qemu/updater.img"
    install -Dm 644 ${srcdir}/images/ramdisk.img "${pkgdir}/var/lib/polyos-mobile-qemu/ramdisk.img"
    install -Dm 644 ${srcdir}/images/Image "${pkgdir}/var/lib/polyos-mobile-qemu/Image"
    install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm 644 ${srcdir}/polyos-logo.png ${pkgdir}/usr/share/icons/hicolor/647x647/apps/${pkgname}.png
}

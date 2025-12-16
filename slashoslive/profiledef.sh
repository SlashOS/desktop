#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="slashos"
iso_label="SLASH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="SlashOS <https://slashos.github.io>"
iso_application="SlashOS Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="slashos"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)

cleanup_buildroot_os_release() {
  local base arch target path
  local candidates=(
    "${workdir:-}"
    "${WORKDIR:-}"
    "${builddir:-}"
    "${BUILD:-}"
    "${AIROOTFS_WORKDIR:-}"
    "${mkarchiso_workdir:-}"
    "${MKARCHISO_WORKDIR:-}"
    "${mkarchiso_root:-}"
    "${ROOT:-}"
    "${ROOTDIR:-}"
    "slashostmp"
    "work"
    "build"
  )

  for base in "${candidates[@]}"; do
    [[ -z "${base}" ]] && continue
    base="${base%/}"
    for arch in x86_64 armv7h aarch64 i686; do
      target="${base}/${arch}/airootfs/usr/lib/os-release"
      if [[ -f "${target}" ]]; then
        printf 'Removing leftover os-release from %s\n' "${target}"
        rm -f "${target}"
      fi
    done
    if [[ -d "${base}" ]]; then
      while IFS= read -r path; do
        [[ -n "${path}" ]] || continue
        rm -f "${path}"
      done < <(find "${base}" -path '*/airootfs/usr/lib/os-release' -print 2>/dev/null)
    fi
  done
}

cleanup_buildroot_os_release

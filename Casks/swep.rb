cask "swep" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "5b661c592afd67a4e432c09cb28e0a99689b1144fa7fbaff48089519d8c51d72",
         intel: "cb0bc0413c14350164bd76d7fbc88689d2f98a0cc41c30c4c0ac582337ab7592"

  url "https://github.com/JKS-sys/swep-releases-30-sep-2026/releases/download/v#{version}/Swep_#{version}_#{arch}.dmg"
  name "Swep"
  desc "Keep your Mac clean: caches, app leftovers, empty folders, large files"
  homepage "https://ipconfig.co.network/swep"

  livecheck do
    url "https://github.com/JKS-sys/swep-releases-30-sep-2026/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Swep.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Swep.app"]
  end

  zap trash: [
    "~/.swep",
    "~/Library/Application Support/network.co.ipconfig.swep",
    "~/Library/Caches/network.co.ipconfig.swep",
    "~/Library/WebKit/network.co.ipconfig.swep",
  ]
end

cask "swep" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "0d004d3f5973d3b079f130a2ed88f36d1e0535971bbcb981053deecdb0925e80",
         intel: "c9f13b08eb6b11255a1059dcbb2e605748f4f8cffc808d221e285bcdc491cd3b"

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

class Sp < Formula
  desc "Swep on the command line: keep your Mac clean"
  homepage "https://ipconfig.co.network/swep"
  version "0.2.3"
  license :cannot_represent

  on_arm do
    url "https://github.com/JKS-sys/swep-releases-30-sep-2026/releases/download/v0.2.3/sp_0.2.3_aarch64-apple-darwin.tar.gz"
    sha256 "6fc4e1530be90f01c07e475a2be01282a60126dedefccf7ef133304386b98ef4"
  end
  on_intel do
    url "https://github.com/JKS-sys/swep-releases-30-sep-2026/releases/download/v0.2.3/sp_0.2.3_x86_64-apple-darwin.tar.gz"
    sha256 "7937f4a92eac021e4ae19443d5accb037f85e57426a28871fdaa5394d1cd1fa1"
  end

  depends_on :macos

  def install
    bin.install "sp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sp --version")
  end
end

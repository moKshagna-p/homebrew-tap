class Lrc < Formula
  desc "Full-screen terminal UI for synced Apple Music and Spotify lyrics"
  homepage "https://github.com/moKshagna-p/lrc"
  url "https://github.com/moKshagna-p/lrc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3f956d2ad3246a792d5dc8cd0ad0cae89c5e498934de7cb9451e52ad0008a54d"
  license :cannot_represent

  depends_on :macos
  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"lrc", "./cmd/lrc"
    bin.install_symlink "lrc" => "lyrics"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lyrics --version")
  end
end

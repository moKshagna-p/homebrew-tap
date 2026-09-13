class Lrc < Formula
  desc "Full-screen terminal UI for synced Apple Music and Spotify lyrics"
  homepage "https://github.com/moKshagna-p/lrc"
  url "https://github.com/moKshagna-p/lrc/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "381658458d06a4492ba77c6b21f0162b852fed267e90b57968ac98cdf80b39fe"
  license :cannot_represent

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"lrc", "./cmd/lrc"
    bin.install_symlink "lrc" => "lyrics"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lyrics --version")
  end
end

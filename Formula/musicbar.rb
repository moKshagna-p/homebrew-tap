class Musicbar < Formula
  desc "A macOS menu bar app for 'Now Playing'"
  homepage "https://github.com/moKshagna-p/musicbar-macos"
  url "https://github.com/moKshagna-p/musicbar-macos/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d4e4f17e1a5471e1cffc2b0e860625479555c30136a062229dff7f70f4a62b77"
  license "MIT"

  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/MusicBar"
  end

  test do
    system "#{bin}/MusicBar", "--version"
  end
end

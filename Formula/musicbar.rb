class Musicbar < Formula
  desc "A macOS menu bar app for 'Now Playing'"
  homepage "https://github.com/moKshagna-p/musicbar-macos"
  url "https://github.com/moKshagna-p/musicbar-macos/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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

class Musicbar < Formula
  desc "A macOS menu bar app for 'Now Playing'"
  homepage "https://github.com/moKshagna-p/musicbar-macos"
  url "https://github.com/moKshagna-p/musicbar-macos/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "c90d18c4ba046f5daa7ae36248f233d4cee1e6a37050192917b80f4d7cce913d"
  license "MIT"

  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    
    # Create the .app bundle structure manually
    mkdir_p "MusicBar.app/Contents/MacOS"
    mkdir_p "MusicBar.app/Contents/Resources"
    cp ".build/release/MusicBar", "MusicBar.app/Contents/MacOS/MusicBar"
    cp "Sources/MusicBar/Info.plist", "MusicBar.app/Contents/Info.plist"
    
    prefix.install "MusicBar.app"
  end

  def caveats
    <<~EOS
      MusicBar.app has been installed to:
        #{opt_prefix}/MusicBar.app

      To link it to your Applications folder, run:
        ln -sfn #{opt_prefix}/MusicBar.app /Applications/MusicBar.app
    EOS
  end

  test do
    system "true"
  end
end

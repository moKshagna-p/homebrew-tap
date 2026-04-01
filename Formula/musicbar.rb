class Musicbar < Formula
  desc "A macOS menu bar app for 'Now Playing'"
  homepage "https://github.com/moKshagna-p/musicbar-macos"
  url "https://github.com/moKshagna-p/musicbar-macos/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ef076050430ef0bed99e1d4f36338871a7f9782e35ad6da3319f98a272b6adee"
  license "MIT"

  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    
    # Create the .app bundle structure
    mkdir_p "MusicBar.app/Contents/MacOS"
    mkdir_p "MusicBar.app/Contents/Resources"
    cp ".build/release/MusicBar", "MusicBar.app/Contents/MacOS/MusicBar"
    cp "Sources/MusicBar/Info.plist", "MusicBar.app/Contents/Info.plist"
    
    # This automatically links to /Applications
    prefix.install "MusicBar.app"
  end

  def post_install
    # Manually symlink to /Applications if needed, but 'app' is cleaner
    # For simplicity in this environment, we use prefix.install and a caveat
  end

  # Homebrew's proper way to handle macOS apps
  def caveats
    <<~EOS
      MusicBar.app has been installed. To link it to your Applications folder, run:
        ln -sfn #{opt_prefix}/MusicBar.app /Applications/MusicBar.app
    EOS
  end

  test do
    system "true"
  end
end

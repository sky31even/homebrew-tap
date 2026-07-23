cask "macgauge" do
  version "0.2.0"
  sha256 "7ef5ce46e2b525a94afb3ccf13f070eee49aa52976b08b0e918ccedb8530b2fd"

  url "https://github.com/sky31even/MacGauge/releases/download/v#{version}/MacGauge-#{version}.zip"
  name "MacGauge"
  desc "Menu-bar system monitor with a pinnable always-on-top stats panel"
  homepage "https://github.com/sky31even/MacGauge"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "MacGauge.app"

  zap trash: [
    "~/Library/Application Support/MacGauge",
  ]

  caveats <<~EOS
    MacGauge is signed but not notarized. If macOS blocks the first launch:
      xattr -d com.apple.quarantine /Applications/MacGauge.app
  EOS
end

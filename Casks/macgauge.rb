cask "macgauge" do
  version "0.2.1"
  sha256 "10b2b1320381297804b67585649292d080068da9bd5559f5bbdec023dc7efe2f"

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

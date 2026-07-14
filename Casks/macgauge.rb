cask "macgauge" do
  version "0.1.1"
  sha256 "7c79bcc4fe5a0e0238d81b41828ae3c038640252b6f5f96d0b08259d918ce8df"

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

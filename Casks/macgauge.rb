cask "macgauge" do
  version "0.1.0"
  sha256 "fa4a834a767f9a031945e563c346c704f511b575a0f7be4f2d61bbf2af20af24"

  url "https://github.com/sky31even/MacGauge/releases/download/v#{version}/MacGauge-#{version}.zip"
  name "MacGauge"
  desc "Menu-bar system monitor with a pinnable always-on-top stats panel"
  homepage "https://github.com/sky31even/MacGauge"

  depends_on macos: ">= :sequoia"
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

# Nazar UI: the optional window for nazar (spec 6.1, 12). Rendered by
# `scripts/release.sh casks` from packaging/homebrew/nazar-ui.rb.in in the
# nazar repository; edit the template, not the rendered cask.
cask "nazar-ui" do
  version "0.1.1"
  sha256 "9cab9a8cca8885fd887c95f378a3abb9c1df8a589e91e7f17b9350b20d0e515b"

  url "https://github.com/atas/nazar/releases/download/v#{version}/nazar-ui-#{version}.zip"
  name "Nazar UI"
  desc "Optional window for the nazar SSH agent"
  homepage "https://github.com/atas/nazar"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  # An ordinary app: it runs only while its window is open and does
  # nothing but run the nazar CLI (cask "nazar", installed separately).
  app "Nazar UI.app"

  zap trash: [
    "~/Library/Preferences/dev.nazar.ui.plist",
    "~/Library/Saved Application State/dev.nazar.ui.savedState",
  ]

  caveats <<~EOS
    Nazar UI needs nazar itself: brew install --cask atas/tap/nazar
  EOS
end

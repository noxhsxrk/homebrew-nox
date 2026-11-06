cask "shaken" do
  version "0.1.0"
  sha256 "407e9224a09340b49fc3a9aaed7a4c012e9a263f1afd8dd4f04893eb0e704598"

  url "https://github.com/noxhsxrk/shaken/releases/download/v#{version}/Shaken-#{version}.dmg"
  name "Shaken"
  desc "Shake while dragging to open a wheel of commands"
  homepage "https://shaken.noxhsxrk.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Shaken.app"

  # Builds aren't notarized by Apple yet. Clearing the quarantine flag lets Shaken open
  # without the "can't be checked for malware" prompt, so nobody has to run xattr by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Shaken.app"],
        writable_base:  :appdir,
        writable_paths: ["Shaken.app"]
  end

  uninstall quit: "com.noxhsxrk.shaken"

  zap trash: [
    "~/Library/Application Support/Shaken",
    "~/Library/Caches/com.noxhsxrk.shaken",
    "~/Library/Caches/Shaken",
    "~/Library/Preferences/com.noxhsxrk.shaken.plist",
  ]
end

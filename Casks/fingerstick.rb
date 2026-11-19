cask "fingerstick" do
  version "1.1.1"
  sha256 "b9410dde45500ca24b81ccb5f4102fd4b5a62882f3081e5d89f9d39cd3fae841"

  url "https://github.com/noxhsxrk/finger-stick/releases/download/v#{version}/FingerStick-#{version}.zip"
  name "FingerStick"
  desc "Hold Control and a pointing hand on a stick taps the screen at the cursor"
  homepage "https://github.com/noxhsxrk/finger-stick"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "FingerStick.app"

  # Builds aren't notarized by Apple yet. Clearing the quarantine flag lets FingerStick open
  # without the "can't be checked for malware" prompt, so nobody has to run xattr by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/FingerStick.app"],
        writable_base:  :appdir,
        writable_paths: ["FingerStick.app"]
  end

  uninstall quit: "com.noxhsxrk.fingerstick"

  zap trash: "~/Library/Preferences/com.noxhsxrk.fingerstick.plist"
end

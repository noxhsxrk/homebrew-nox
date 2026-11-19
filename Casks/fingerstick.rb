cask "fingerstick" do
  version "1.0.0"
  sha256 "344b2d1ebccc0872e90108e7e6723ad5d4fe8a7cce8db9258f6a58c6a9e0b098"

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

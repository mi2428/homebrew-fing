# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.9.3"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.9.3/fing-v0.9.3-darwin-arm64",
          using: :nounzip
      sha256 "9f4c4f63b006614a443efbd716f2fe37c3d02741d8679abd7d39c19aad29ae68"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.9.3/fing-v0.9.3-darwin-amd64",
          using: :nounzip
      sha256 "bf77b766b60018001030e9ac6a76adbdc2fe2b94544e145c1a3370a2d2c196dd"
    end
  end

  def install
    bin.install Dir["fing-v#{version}-darwin-*"].first => "fing"
    chmod 0755, bin/"fing"
  end

  test do
    assert_match "fing #{version}", shell_output("#{bin}/fing --version")
    assert_match "Usage:", shell_output("#{bin}/fing --help")
  end
end

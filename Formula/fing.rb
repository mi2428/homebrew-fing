# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.12.3"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.12.3/fing-v0.12.3-darwin-arm64",
          using: :nounzip
      sha256 "5619444348eb3374a21e1f7dcf32278c5361eb38dd4a688b3b783f3754cee498"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.12.3/fing-v0.12.3-darwin-amd64",
          using: :nounzip
      sha256 "b55d100fda0b42a6d53a1b11c599e08e79ee78d0b4ab79ca6c910e2c8d3e86a8"
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

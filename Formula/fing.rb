# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.12.1"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.12.1/fing-v0.12.1-darwin-arm64",
          using: :nounzip
      sha256 "9d7dab21f5b09555eeb7beaa6532788476e98bda5a2c7b0d059b4bfaaa79be87"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.12.1/fing-v0.12.1-darwin-amd64",
          using: :nounzip
      sha256 "83b5829e27465545b71a23d93f51ae3f5320f31d5e342f2300d2f08fbf9ae654"
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

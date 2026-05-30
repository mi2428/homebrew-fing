# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.10.0"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.10.0/fing-v0.10.0-darwin-arm64",
          using: :nounzip
      sha256 "bc44974d1661248d78f6dce38bfd9546f6c030da19c10e95739e0779bf9fe5ef"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.10.0/fing-v0.10.0-darwin-amd64",
          using: :nounzip
      sha256 "7035ccc82a8b0c97557d0320c96b044f3dfec65b3b5f73ddd24f97ac9afc2e34"
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

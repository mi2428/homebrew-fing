# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.12.0"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.12.0/fing-v0.12.0-darwin-arm64",
          using: :nounzip
      sha256 "2dcf9ae92eda0d7e21f3ac8fd07b125e767c9a1e5d0aa8c112bb9911d3592b0d"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.12.0/fing-v0.12.0-darwin-amd64",
          using: :nounzip
      sha256 "289607ea8c75e791b0c6f9ff466d5226684608a8da22091e323fac5c138a6625"
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
